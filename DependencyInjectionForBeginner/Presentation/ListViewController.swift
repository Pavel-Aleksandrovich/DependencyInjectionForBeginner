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
    private let identifier = "ListCell"
    private var animalArray = [AnimalDTO2]()
    private var filterArray = [AnimalDTO2]()
    private let searchController = UISearchController(searchResultsController: nil)
    
    private var searchBarIsEmpty: Bool {
        guard let text = searchController.searchBar.text else { return false }
        return text.isEmpty
    }
    
    private var isFiltering: Bool {
        return searchController.isActive && !searchBarIsEmpty
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        animalArray = RemoteDataSource.shared.jsonDecod()
        tableView.register(ListViewControllerCell.self, forCellReuseIdentifier: identifier)
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Enter your requiest"
        navigationItem.searchController = searchController
        definesPresentationContext = true
        navigationItem.hidesSearchBarWhenScrolling = false
        
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        navigationController?.navigationBar.prefersLargeTitles = true
        title = viewModel.title
        view.backgroundColor = .red
        viewModel.save()
        showLoader()
        initLabel()
        addElement()
        addAlert()
        tableView.tableFooterView = UIView()
    }
    
    private func addElement() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addAlert))
    }
    
    @objc private func addAlert() {
        addElement(title: "Add", message: nil) { [ weak self ] AnimalDTO2 in
            self?.animalArray.append(AnimalDTO2)
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
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
// MARK: - UITableViewDelegate

extension ListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //        let cell = tableView.cellForRow(at: indexPath)
        //        cell?.accessoryType = .checkmark
        tableView.deselectRow(at: indexPath, animated: false)
        
        let vc = DetailViewController()
        
        if isFiltering {
            vc.secondArray = filterArray[indexPath.row]
        } else {
            vc.secondArray = animalArray[indexPath.row]
        }
        
//        vc.animalsArray = animalList[indexPath.row]
        navigationController?.pushViewController(vc, animated: false)
    }
}
// MARK: - UITableViewDataSource

extension ListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if isFiltering {
            return filterArray.count
        }
        
        return animalArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! ListViewControllerCell
        
        var arrayRow: AnimalDTO2
        
        if isFiltering {
            arrayRow = filterArray[indexPath.row]
        } else {
            arrayRow = animalArray[indexPath.row]
        }
        
        cell.nameLabel.text = arrayRow.name
        cell.idLabel.text = arrayRow.id
        //        cell.avatarLabel.text = animalList[indexPath.row].avatar
        
        cell.accessoryType = .disclosureIndicator
        
        return cell
    }
}
// MARK: - UISearchResultsUpdating

extension ListViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
    
    private func filterContentForSearchText(_ searchText: String) {
        filterArray = animalArray.filter {
            $0.name.lowercased().contains(searchText.lowercased())
        }
        tableView.reloadData()
    }
    
}





