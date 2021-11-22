//
//  ViewController.swift
//  DependencyInjectionForBeginner
//
//  Created by pavel mishanin on 20.11.2021.
//

import UIKit

class ViewController: UIViewController {
    
    private let label = UILabel()
    
    private let viewModel = DependencyFactory().provideViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = viewModel.title
        view.backgroundColor = .green
        viewModel.save()
        showLoader()
        
        viewModel.fetchMovies(){ movies in
            print(movies)
            self.hideLoader()
        }
    }
    
    private func initLabel() {
        label.frame = CGRect(x: 0, y: 0, width: 200, height: 100)
    }
    
    private func showLoader() {
        
    }
    
    private func hideLoader() {
        
    }
    
}








