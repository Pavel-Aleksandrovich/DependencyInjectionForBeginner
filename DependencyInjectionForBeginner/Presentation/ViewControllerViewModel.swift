//
//  ViewControllerViewModel.swift
//  DependencyInjectionForBeginner
//
//  Created by pavel mishanin on 21.11.2021.
//

import UIKit

final class ViewControllerViewModel {
    private let dataManager: DataManager

    init(dataManager: DataManager) {
        self.dataManager = dataManager
    }
    
    func save() {
        let name: String = "test"
        dataManager.save(name: name)
        
    }
    
    func fetchMovies(closure: @escaping (Array<String>) -> ()) {
        dataManager.fetchMovies(closure: closure)
    }
}
