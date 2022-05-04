//
//  ExampleTableViewCell.swift
//  TableViewController_Example
//
//  Created by HoSiTuan on 04/05/2022.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

import Foundation
import TableViewController

struct User {
    var name: String?
    var avatarURL: String?
    var bio: String?
}

class ExampleRowViewModel: CellPresentable {
    var cellIdentifier: String = ExampleTableViewCell.className
    var cellHeight: CGFloat
    var index: IndexPath
    
    var nameString: String?
    var bio: String?
    var avatarURL: String?
    init(data: User, cellHeight: CGFloat = UITableView.automaticDimension, index: IndexPath) {
        self.index = index
        self.cellHeight = cellHeight
        self.nameString = data.name
        self.avatarURL = data.avatarURL
        self.bio = data.bio
    }
}

class ExampleTableViewCell: PresentableTableViewCell {
    lazy var avatarImageView = UIImageView()
    lazy var nameLabel = UILabel()
    lazy var descriptionLabel = UILabel()
    
    override func setupView() {
        super.setupView()
        contentView.addSubview(avatarImageView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(descriptionLabel)
        avatarImageView.snp.makeConstraints { make in
            make.height.width.equalTo(64)
            make.left.top.equalToSuperview().offset(24)
            make.bottom.lessThanOrEqualToSuperview().inset(24)
        }
        avatarImageView.layer.cornerRadius = 32
        avatarImageView.layer.masksToBounds = true
        avatarImageView.backgroundColor = .gray
        
        nameLabel.snp.makeConstraints { make in
            make.left.equalTo(avatarImageView.snp.right).offset(12)
            make.top.equalToSuperview().offset(30)
            make.height.equalTo(24)
        }
        nameLabel.font = .systemFont(ofSize: 16, weight: .semibold)
        nameLabel.textColor = .black
        
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(8)
            make.left.equalTo(nameLabel)
            make.right.equalToSuperview().inset(24)
            make.bottom.lessThanOrEqualToSuperview().inset(24)
        }
        descriptionLabel.textColor = .gray
        descriptionLabel.numberOfLines = 0
        descriptionLabel.font = .systemFont(ofSize: 14)
    }
}

extension ExampleTableViewCell: CellConfigurable {
    func setup(viewModel: CellPresentable) {
        guard let viewModel = viewModel as? ExampleRowViewModel else { return }
        self.nameLabel.text = viewModel.nameString
        self.descriptionLabel.text = viewModel.bio
        //Additional avatar setup
    }
}
