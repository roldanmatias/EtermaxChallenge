//
//  ECPersistence.swift
//  EtermaxChallenge
//
//  Created by mts on 23/2/17.
//  Copyright © 2017 Etermax. All rights reserved.
//

import UIKit

class ECPersistence: NSObject {

    static let sharedInstance = ECPersistence()
    
    let redditKey = "reddit"
    
    private override init() {
        super.init()
    }
    
    func save(reddit: ECReddit?) {
        if let reddit = reddit {
            let encodedData = NSKeyedArchiver.archivedData(withRootObject: reddit)
            UserDefaults.standard.set(encodedData, forKey: redditKey)
        }
    }
    
    func get() -> ECReddit? {
        if let data = UserDefaults.standard.data(forKey: redditKey),
            let savedData = NSKeyedUnarchiver.unarchiveObject(with: data) as? ECReddit {
            return savedData
        } else {
            return nil
        }
    }
}
