//
//  User.swift
//  MVVM
//
//  Created by apple on 25/04/19.
//  Copyright © 2019 appsmall. All rights reserved.
//

import UIKit

struct User {
    
    let name: String
    let age: Int
    let backgroundColor: UIColor
    
    
    init(name: String, age: Int, backgroundColor: UIColor) {
        self.name = name
        self.age = age
        self.backgroundColor = backgroundColor
    }
    
}
