//
//  BaseViewController+TableView.swift
//  CodeBase
//
//  Created by Ho Si Tuan on 04/05/2022.
//

import Foundation
import UIKit
import SnapKit
import RxSwift

public protocol TableViewSetupable: AnyObject {
    func registerCell()
    func setupTableView()
}
open class TableViewController: UIViewController, TableViewSetupable {
    public var viewModel: TableViewModel?
    private var disposeBag = DisposeBag()
    public var tableView = UITableView()
    
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTableView()
    }
    
    @objc dynamic open func registerCell() {
        
    }
    
    @objc dynamic open func setupTableView() {
        view.addSubview(tableView)
        guard let viewModel = self.tableViewModel() else { return }
        self.viewModel = viewModel
        self.observeData()
        
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        registerCell()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func observeData() {
        self.viewModel?.viewModels
            .subscribe(onNext: { [weak self] _ in
                self?.tableView.reloadData()
            })
            .disposed(by: disposeBag)
    }
    
    open func tableViewModel() -> TableViewModel? {
        return nil
    }
    
}

extension TableViewController: UITableViewDelegate {
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.viewModel?.heightForRow(at: indexPath) ?? UITableView.automaticDimension
    }
}

extension TableViewController: UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel?.numberOfRow(in: section) ?? 0
    }
    public func numberOfSections(in tableView: UITableView) -> Int {
        return self.viewModel?.numberOfSection() ?? 0
    }
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let model = self.viewModel?.modelForRow(at: indexPath) else { return UITableViewCell() }
        let cell = tableView.dequeueReusableCell(withIdentifier: model.cellIdentifier, for: indexPath)
        if let cell = cell as? CellConfigurable {
            cell.setup(viewModel: model)
        }
        return cell
    }
}
