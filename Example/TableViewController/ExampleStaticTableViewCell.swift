//
//  ExampleStaticTableViewCell.swift
//  TableViewController_Example
//
//  Created by HoSiTuan on 04/05/2022.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

import Foundation
import TableViewController

class ExampleStaticTableViewCell: PresentableTableViewCell {
    lazy var titleLabel = UILabel()
    override func setupView() {
        super.setupView()
        contentView.addSubview(titleLabel)
        titleLabel.text = "Example static row"
        titleLabel.font = .systemFont(ofSize: 16, weight: .semibold)
        titleLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(24)
            make.top.equalToSuperview().offset(16)
            make.centerX.centerY.equalToSuperview()
        }
    }
}
