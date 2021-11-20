//
//  ViewController.swift
//  DependencyInjectionForBeginner
//
//  Created by pavel mishanin on 20.11.2021.
//

import UIKit

class ViewController: UIViewController {
    
    private let viewModel = DependencyFactory().provideViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.save()
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

class DependencyFactory {
    
    func provideViewModel() -> ViewModel {
        let storage = Storage()
        let dataManager = DataManager(storage: storage)
        let viewModel = ViewModel(dataManager: dataManager)
        return viewModel
    }
}
