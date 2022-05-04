//
//  TableViewModel.swift
//  TableViewController
//
//  Created by HoSiTuan on 04/05/2022.
//

import Foundation
import RxSwift
import RxCocoa

open class TableViewModel: NSObject {
    lazy open var buildingModels = [CellPresentable]()
    public let viewModels = BehaviorRelay<[CellPresentable]>(value: [])
    
    open func buildViewModels() {
        self.buildingModels = []
    }

    
    open func numberOfRow(in section: Int) -> Int {
        return self.viewModels.value.filter {
            $0.index.section == section
        }.count
    }
    
    open func numberOfSection() -> Int {
        if let maxViewModelSection = viewModels.value.max(by: { $0.index.section < $1.index.section }) {
            return maxViewModelSection.index.section + 1
        }
        return 0
    }
    
    open func modelForRow(at indexPath: IndexPath) -> CellPresentable? {
        return self.viewModels.value.filter {
            $0.index == indexPath
        }.first
    }
    
    open func heightForRow(at indexPath: IndexPath) -> CGFloat {
        return self.modelForRow(at: indexPath)?.cellHeight ?? UITableView.automaticDimension
    }
    
    open func nextIndex(in section: Int) -> IndexPath {
        let viewModelInSection = self.buildingModels.filter {
            $0.index.section == section
        }
        let numerOfRow = viewModelInSection.count
        return IndexPath(row: numerOfRow, section: section)
    }
}

