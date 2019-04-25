//
//  DispatchQueueHelper.swift
//  MVVM
//
//  Created by apple on 25/04/19.
//  Copyright © 2019 appsmall. All rights reserved.
//

import Foundation


class DispatchQueueHelper {
    
    fileprivate init() {}
    
    public static func delay(bySeconds seconds: Double, dispatchLevel: DispatchLevel = .main, completion: @escaping () -> ()) {
        let dispatchTime = DispatchTime.now() + seconds
        dispatchLevel.dispatchQueue.asyncAfter(deadline: dispatchTime, execute: completion)
    }
    
    public enum DispatchLevel {
        case main
        case userInteractive
        case userInitiated
        case utility
        case background
        
        var dispatchQueue : DispatchQueue {
            switch self {
            case .main:
                return DispatchQueue.main
            
            case .userInitiated:
                return DispatchQueue.global(qos: .userInitiated)
                
            case .userInteractive:
                return DispatchQueue.global(qos: .userInteractive)
                
            case .utility:
                return DispatchQueue.global(qos: .utility)
                
            case .background:
                return DispatchQueue.global(qos: .background)
                
            }
        }
    }
    
}
