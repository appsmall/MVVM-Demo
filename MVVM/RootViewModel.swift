//
//  RootViewModel.swift
//  MVVM
//
//  Created by apple on 25/04/19.
//  Copyright © 2019 appsmall. All rights reserved.
//

import UIKit


protocol RootViewModelDelegate {
    func didStartFetchingMessage(_ message: String)
    func didFinishFetchingMessage(_ message: String?)
}

class RootViewModel {
    
    let user : User
    
    var rootViewModelDelegate: RootViewModelDelegate?
    
    init(user: User) {
        self.user = user
    }
    
    func fetchMessage() {
        rootViewModelDelegate?.didStartFetchingMessage("Fetching...")
        
        DispatchQueueHelper.delay(bySeconds: 3.0, dispatchLevel: .background) {
            
            var  message: String? = "Hello there!"
            
            if message == nil {
                message = "Failed to retrieve fetched message."
            }
            
            DispatchQueueHelper.delay(bySeconds: 0.0, completion: { [unowned self] in
                self.rootViewModelDelegate?.didFinishFetchingMessage(message)
            })
            
        }
    }
    
}
