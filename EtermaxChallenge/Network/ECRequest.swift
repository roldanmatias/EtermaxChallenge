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
    
    let urlString = "https://www.reddit.com/top/.json?count=25"
    //https://www.reddit.com/top/?count=25&after=t3_5vi950
    
    private override init() {
        super.init()
    }
    
    func requestTop(completionHandler: @escaping (ECReddit?) -> Void) {

        Alamofire.request(urlString, method: .get, parameters: nil, headers: nil).responseObject { ( response : DataResponse <ECReddit>) in

            completionHandler(response.result.value)
        }
    }
}
