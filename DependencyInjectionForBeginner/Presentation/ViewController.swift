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
        
        viewModel.save()
        let movies = viewModel.fetchMovies()
        print(movies)
    }
    
    func initLabel() {
        label.frame = CGRect(x: 0, y: 0, width: 200, height: 100)
    }
}








