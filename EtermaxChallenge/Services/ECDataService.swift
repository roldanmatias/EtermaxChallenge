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
        ECRequest.sharedInstance.requestTop { (response) in
            completionHandler(response)
        }
    }
}
