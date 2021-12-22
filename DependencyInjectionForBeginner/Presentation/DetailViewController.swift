//
//  DetailViewController.swift
//  DependencyInjectionForBeginner
//
//  Created by pavel mishanin on 06.12.2021.
//

import UIKit

class DetailViewController: UIViewController {
    
    private let tableView = UITableView()
//    var name = String()
//    var age = String()
//    var weight = String()
    var animalsArray: GenerelAnimalsVo!
    var secondArray: AnimalDTO2!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.tableFooterView = UIView()
        tableView.separatorStyle = .none
        
        layoutConstraints()
    }
}

extension DetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return DetailViewControllerCell(
            name: secondArray.name,
            age: secondArray.id,
            weight: nil
        )
    }
    
}

extension DetailViewController {
    
    private func layoutConstraints() {
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}


