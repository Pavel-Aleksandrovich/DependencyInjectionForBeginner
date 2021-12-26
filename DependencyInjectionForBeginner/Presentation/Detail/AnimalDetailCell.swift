//
//  DetailViewControllerCell.swift
//  DependencyInjectionForBeginner
//
//  Created by pavel mishanin on 09.12.2021.
//

import UIKit

class AnimalDetailCell: UITableViewCell {
    
    private let stackView = UIStackView()
    private var nameLabel = UILabel()
    private var ageLabel = UILabel()
    private var weightLabel = UILabel()
    
    private let name: String?
    private let age: String?
    private let weight: String?
    
    init(name: String?, age: String?, weight: String?) {
        self.name = name
        self.age = age
        self.weight = weight
        super.init(style: .default, reuseIdentifier: "cell")
        
        setupView()
        setupHierarchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        stackView.axis = .vertical
        stackView.spacing = 5
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        
        [stackView, nameLabel, ageLabel, weightLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        [nameLabel, ageLabel, weightLabel].forEach {
            $0.font = .systemFont(ofSize: 25, weight: .heavy)
        }
        
        nameLabel.text = name
        ageLabel.text = age
        weightLabel.text = weight
    }
    
    private func setupHierarchy() {
        contentView.addSubview(stackView)
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(ageLabel)
        stackView.addArrangedSubview(weightLabel)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}
