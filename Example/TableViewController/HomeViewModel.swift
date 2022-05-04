//
//  HomeViewModel.swift
//  TableViewController_Example
//
//  Created by HoSiTuan on 04/05/2022.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

import Foundation
import TableViewController
import UIKit

class HomeViewModel: TableViewModel {
    override func buildViewModels() {
        super.buildViewModels()
        
        //MARK: Static row, section 0
        //Static row with fully params
        let firstRowModel = CellPresentableRowViewModel(cellIdentifier: ExampleStaticTableViewCell.className, cellHeight: UITableView.automaticDimension, index: nextIndex(in: 0))
        self.buildingModels.append(firstRowModel)
        
        //Static row with cellIdentifier only
        let secondRowModel = CellPresentableRowViewModel(cellIdentifier: ExampleStaticTableViewCell.className, cellHeight: UITableView.automaticDimension, index: nextIndex(in: 0))
        self.buildingModels.append(secondRowModel)
        
        //Static row with cellIdentifier only
        let thirdRowModel = CellPresentableRowViewModel(cellIdentifier: ExampleStaticTableViewCell.className, cellHeight: UITableView.automaticDimension, index: nextIndex(in: 0))
        self.buildingModels.append(thirdRowModel)
        
        //MARK: Cell with data, section 1
        //Text row viewModel with fully params
        let firstTextRowModel = ExampleTextRowViewModel(text: "This is first text row", cellHeight: 120, index: nextIndex(in: 1))
        self.buildingModels.append(firstTextRowModel)
        
        //Text row viewModel
        let secondTextRowModel = ExampleTextRowViewModel(text: "This is second text row", index: nextIndex(in: 1))
        self.buildingModels.append(secondTextRowModel)
        
        //MARK: Object data, section 2
        //Example row with object data
        let userInfoRowViewModel = ExampleRowViewModel(data: User(name: "User 001", avatarURL: nil, bio: "Hello, I'm TableViewController. Enjoy this library."), cellHeight: UITableView.automaticDimension, index: nextIndex(in: 2))
        self.buildingModels.append(userInfoRowViewModel)
        
        
        //Important line, accept new data for viewModels
        self.viewModels.accept(buildingModels)
    }
    
    
}
