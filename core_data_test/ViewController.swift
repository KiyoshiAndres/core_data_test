//
//  ViewController.swift
//  core_data_test
//
//  Created by Work on 2023/07/15.
//

import UIKit
import Foundation
import CoreData

class ViewController: UIViewController {
    
    let addButton = UIButton(type: .system, primaryAction: UIAction(title: "Button Title", handler: { _ in
        
        let context = AppDelegate.sharedAppDelegate.coreDataStack.managedContext
        let newRow = NData(context: context)
        newRow.name = "Kiyoshi"
        newRow.time = Date()
        newRow.id = UUID()
        AppDelegate.sharedAppDelegate.coreDataStack.saveContext()
        print(AppDelegate.sharedAppDelegate.coreDataStack.getData().map(NDataViewModel.init))
    }))
    
    //coreData
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupButton()
    }
    
    func setupButton() {
        view.addSubview(addButton)
        
        addButton.configuration = .filled()
        addButton.configuration?.title = "Add"
        
        
        addButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            addButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            addButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    
    

}
