//
//  ViewController.swift
//  DependencyInjectionForBeginner
//
//  Created by pavel mishanin on 20.11.2021.
//

import UIKit

class ViewController: UIViewController {

    private var viewModel: ViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let storage = Storage()
        let dataManager = DataManager(storage: storage)
        viewModel = ViewModel(dataManager: dataManager)
        viewModel?.save()
    }
    
}

class ViewModel {
    private let dataManager: DataManager
    
    init(dataManager: DataManager) {
        self.dataManager = dataManager
    }
    
    func save() {
        dataManager.save()
    }
}

class DataManager {
    private let storage: Storage
    
    init(storage: Storage) {
        self.storage = storage
    }
    
    func save() {
        storage.save()
    }
}

class Storage {

    func save() {
        print("Save")
    }
}
