//
//  ViewController.swift
//  DependencyInjectionForBeginner
//
//  Created by pavel mishanin on 20.11.2021.
//

import UIKit

class ListViewController: UIViewController {
    
    private let alert = UIAlertController(title: nil, message: "Please Wait ...", preferredStyle: .alert)
    private let label = UILabel()
    private let activityIndicatorView = UIActivityIndicatorView()
    private let viewModel = DependencyFactory().provideViewModel()
    private var animalList = [GenerelAnimalsVo]()
    private let tableView = UITableView()
    let testArray = ["aaa", "fff"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(ListViewControllerCell.self, forCellReuseIdentifier: "cell")
        
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        
        title = viewModel.title
        view.backgroundColor = .red
        viewModel.save()
        showLoader()
        initLabel()
    }
    
    private func alerActivityIndicator() {
        let loader = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
        loader.hidesWhenStopped = true
        loader.style = .large
        loader.startAnimating()
        alert.view.addSubview(loader)
        present(alert, animated: true, completion: nil)
    }
    
    private func activityIndicator() {
        activityIndicatorView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        activityIndicatorView.color = .black
        activityIndicatorView.style = .large
        activityIndicatorView.center = view.center
        activityIndicatorView.startAnimating()
        view.addSubview(activityIndicatorView)
    }
    
    private func initLabel() {
        label.frame = CGRect(x: 0, y: 0, width: 300, height: 100)
        label.center = view.center
//        view.addSubview(label)
        
//        viewModel.fetchMovies(){ movies in
//            self.label.text = "\(movies)"
//            print(movies)
//            self.hideLoader()
//        }
        viewModel.fetchAnimals(errorClosure: {
            // show alert error
            // hide loader
        }, successClosure: { [ weak self ] animals in
            
            self?.animalList = animals
//            self?.label.text = self?.animalAge[0].avatar
//            print(self?.animalAge[0].avatar)
            self?.hideLoader()
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        })
        
    }
    
    private func showLoader() {
//        activityIndicator()
        alerActivityIndicator()
    }
    
    private func hideLoader() {
        activityIndicatorView.stopAnimating()
        alert.dismiss(animated: false, completion: nil)
    }
    
}

extension ListViewController: UITableViewDelegate {
    
}

extension ListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return animalList.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ListViewControllerCell
        
        cell.textLabel?.text = animalList[indexPath.row].name
        cell.detailTextLabel?.text = animalList[indexPath.row].id
//        print(animalList[0].name)
//        cell.
        
        return cell
    }
    
}

class ListViewControllerCell: UITableViewCell {
    
//    private let idLabel = UILabel()
//    private let nameLabel = UILabel()
//    private let avatarLabel = UILabel()
//    private let stackView = UIStackView()
    
    override init(style: UITableViewCell.CellStyle , reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
    }
    
    
//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        initUI()
//
//    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//   private func initUI() {
//
//    contentView.addSubview(stackView)
//    stackView.addArrangedSubview(nameLabel)
//    stackView.addArrangedSubview(avatarLabel)
//    stackView.addArrangedSubview(idLabel)
//
//    [stackView, nameLabel, avatarLabel, idLabel].forEach{
//        $0.translatesAutoresizingMaskIntoConstraints = false
//    }
//
//    stackView.axis = .vertical
//    stackView.alignment = .leading
//    stackView.distribution = .fillEqually
//    stackView.spacing = 5
//
//    NSLayoutConstraint.activate([
//        stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
//        stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
//        stackView.topAnchor.constraint(equalTo: contentView.topAnchor),
//        stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
//
//        nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
//        nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
//        nameLabel.heightAnchor.constraint(equalToConstant: 20)
//    ])
//    }
    
}




