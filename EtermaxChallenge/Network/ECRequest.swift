//
//  ECRequest.swift
//  EtermaxChallenge
//
//  Created by mts on 23/2/17.
//  Copyright © 2017 Etermax. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper
import AlamofireObjectMapper.Swift
import Foundation
import ObjectMapper

class ECRequest: NSObject {

    static let sharedInstance = ECRequest()
    
    let urlString = "https://www.reddit.com/top/.json?limit=10&after="
    
    private override init() {
        super.init()
    }
    
    func requestTop(after: String? = nil, completionHandler: @escaping (ECReddit?) -> Void) {

        var apiRequest = urlString
        
        if let after = after {
            apiRequest.append(after)
        }
        
        Alamofire.request(apiRequest, method: .get, parameters: nil, headers: nil).responseObject { ( response : DataResponse <ECReddit>) in

            completionHandler(response.result.value)
        }
    }
}
