//
//  PresentTableViewCell.swift
//  TableViewController
//
//  Created by HoSiTuan on 04/05/2022.
//

import Foundation
import UIKit

open class PresentableTableViewCell: UITableViewCell, CellConfigurable {
    
    open override class func awakeFromNib() {
        self.awakeFromNib()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String!) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupView()
    }

    
    open func setupView() {
        
    }

    public func setup(viewModel: CellPresentable) { 
        
    }
}

