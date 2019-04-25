//
//  RootVC.swift
//  MVVM
//
//  Created by apple on 25/04/19.
//  Copyright © 2019 appsmall. All rights reserved.
//

import UIKit

class RootVC: UIViewController {

    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var activirtyIndicator: UIActivityIndicatorView!
    
    var rootViewModel : RootViewModel! {
        didSet {
            navigationItem.title  = "\(rootViewModel.user.name), \(rootViewModel.user.age)"
            self.view.backgroundColor = rootViewModel.user.backgroundColor
        }
    }
    
    
    // MARK:- VIEW CONTROLLER LIFE CYCLE METHODS
    override func viewDidLoad() {
        super.viewDidLoad()

        let user = User(name: "Alex", age: 36, backgroundColor: .orange)
        self.rootViewModel = RootViewModel(user: user)
        self.rootViewModel.rootViewModelDelegate = self
    }
    
    // MARK:- IBACTIONS
    @IBAction func resetButtonPressed(_ sender: UIBarButtonItem) {
        messageLabel.text = "Tap 'Fetch' to retreive the message"
    }
    
    @IBAction func fetchButtonPressed(_ sender: UIBarButtonItem) {
        self.rootViewModel.fetchMessage()
    }
    
}

// MARK:- ROOT VIEW-MODEL DELEGATE METHODS
extension RootVC: RootViewModelDelegate {
    func didStartFetchingMessage(_ message: String) {
        self.messageLabel.text = message
        self.activirtyIndicator.startAnimating()
    }
    
    func didFinishFetchingMessage(_ message: String?) {
        self.messageLabel.text = message
        self.activirtyIndicator.stopAnimating()
    }
}
