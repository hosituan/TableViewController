//
//  CellPresentable.swift
//  TableViewController
//
//  Created by HoSiTuan on 04/05/2022.
//

import Foundation
import UIKit

public protocol Presentable {}
public protocol CellPresentable: Presentable {
    var index: IndexPath { get set }
    var cellIdentifier: String { get set }
    var cellHeight: CGFloat { get set }
}

public class CellPresentableRowViewModel: CellPresentable {
    public var index: IndexPath
    
    public var cellIdentifier: String
    
    public var cellHeight: CGFloat
    
    public init(cellIdentifier: String, cellHeight: CGFloat = UITableView.automaticDimension, index: IndexPath) {
        self.cellIdentifier = cellIdentifier
        self.cellHeight = cellHeight
        self.index = index
    }
    
}
public protocol CellConfigurable {
    public func setup(viewModel: CellPresentable)
}
