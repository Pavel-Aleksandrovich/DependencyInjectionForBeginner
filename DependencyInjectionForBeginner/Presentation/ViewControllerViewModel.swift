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
    
    let title = "Title"
    
    func save() {
        let name: String = "test"
        dataManager.save(name: name)
    }
    
    func fetchMovies(errorClosure: @escaping () -> () ,successClosure: @escaping (Array<String>) -> ()) {
        dataManager.fetchMovies(errorClosure: errorClosure, successClosure: successClosure)
    }
}
