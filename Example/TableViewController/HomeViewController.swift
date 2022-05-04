//
//  HomeController.swift
//  TableViewController
//
//  Created by hosituan on 05/04/2022.
//  Copyright (c) 2022 hosituan. All rights reserved.
//

import UIKit
import TableViewController

class HomeViewController: TableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        view.backgroundColor = .white
        title = "Presentable TableView"
        //Builing viewModel manually.
        self.viewModel?.buildViewModels()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func registerCell() {
        super.registerCell()
        self.tableView.registerCells(
            ExampleStaticTableViewCell.self,
            ExampleTextTableViewCell.self,
            ExampleTableViewCell.self)
    }
    
    override func setupTableView() {
        super.setupTableView()
    }
    
    override func tableViewModel() -> TableViewModel? {
        return HomeViewModel()
    }

}

