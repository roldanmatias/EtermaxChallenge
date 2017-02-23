//
//  ECDataService.swift
//  EtermaxChallenge
//
//  Created by mts on 23/2/17.
//  Copyright © 2017 Etermax. All rights reserved.
//

import UIKit

class ECDataService: NSObject {

    static let sharedInstance = ECDataService()
    
    private override init() {
        super.init()
    }
    
    func listTop(completionHandler: @escaping (ECReddit?) -> Void) {
        
        if let savedReddit = ECPersistence.sharedInstance.get() {
            completionHandler(savedReddit)
        }
        
        ECRequest.sharedInstance.requestTop { (response) in
            if let reddit = response {
                ECPersistence.sharedInstance.save(reddit: reddit)
                completionHandler(response)
            }
        }
    }
}
