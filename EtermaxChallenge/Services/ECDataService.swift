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
    
    func listMore(completionHandler: @escaping (ECReddit?) -> Void) {
        
        if let savedReddit = ECPersistence.sharedInstance.get(), let savedRedditData = savedReddit.data, let savedChildren = savedRedditData.children {
            let lastElementLoaded = savedChildren.last?.data?.name ?? ""
            
            ECRequest.sharedInstance.requestTop(after: lastElementLoaded) { (response) in
                if let reddit = response, let redditData = reddit.data, let newChildren = redditData.children {
                    savedReddit.data?.children? += newChildren
                    ECPersistence.sharedInstance.save(reddit: savedReddit)
                    completionHandler(savedReddit)
                }
            }
        }
    }
}
