//
//  ExampleTextTableViewCell.swift
//  TableViewController_Example
//
//  Created by HoSiTuan on 04/05/2022.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

import Foundation
import TableViewController

class ExampleTextRowViewModel: CellPresentable {
    var cellIdentifier: String = ExampleTextTableViewCell.className
    var cellHeight: CGFloat
    var index: IndexPath
    
    var text: String?
    init(text: String?, cellHeight: CGFloat = UITableView.automaticDimension, index: IndexPath) {
        self.index = index
        self.cellHeight = cellHeight
        self.text = text
    }
}

class ExampleTextTableViewCell: PresentableTableViewCell {
    lazy var exampleTextLabel = UILabel()
    
    override func setupView() {
        super.setupView()
        contentView.addSubview(exampleTextLabel)
        exampleTextLabel.font = .systemFont(ofSize: 20, weight: .bold)
        exampleTextLabel.textColor = .brown
        
        exampleTextLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(24)
            make.top.equalToSuperview().offset(16)
            make.centerX.centerY.equalToSuperview()
        }
        
    }
}

extension  ExampleTextTableViewCell: CellConfigurable {
    func setup(viewModel: CellPresentable) {
        guard let viewModel = viewModel as? ExampleTextRowViewModel else { return }
        self.exampleTextLabel.text = viewModel.text
    }
}
