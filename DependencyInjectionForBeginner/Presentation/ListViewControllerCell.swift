//
//  ListViewControllerCell.swift
//  DependencyInjectionForBeginner
//
//  Created by pavel mishanin on 06.12.2021.
//

import UIKit

class ListViewControllerCell: UITableViewCell {
    
     let idLabel = UILabel()
     let nameLabel = UILabel()
     let avatarLabel = UILabel()
    private let stackView = UIStackView()
    
//     var id: String
//     var name: String
//     var avatar: String
    
//    init(name: String?, avatar: String?, id: String?, reuseIdentifier: String?) {
//        self.name = name!
//        self.avatar = avatar!
//        self.id = id!
//        super.init(style: .default, reuseIdentifier: reuseIdentifier)
//        initUI()
//        add()
//    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initUI()
//        add()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    private func add() {
//        idLabel.text = id
//        nameLabel.text = name
//        avatarLabel.text = avatar
//    }
    
   private func initUI() {

    contentView.addSubview(stackView)
    stackView.addArrangedSubview(nameLabel)
    stackView.addArrangedSubview(avatarLabel)
    stackView.addArrangedSubview(idLabel)

    [stackView, nameLabel, avatarLabel, idLabel].forEach{
        $0.translatesAutoresizingMaskIntoConstraints = false
    }

    stackView.axis = .vertical
    stackView.alignment = .center
    stackView.distribution = .fillEqually
    stackView.spacing = 5

    NSLayoutConstraint.activate([
        stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
        stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
        stackView.topAnchor.constraint(equalTo: contentView.topAnchor),
        stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
    ])
    }
    
}
