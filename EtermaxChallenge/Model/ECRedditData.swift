//
//  ECRedditData.swift
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

public class ECRedditData: Mappable {
    
    var children: [ECRedditDataChild]?
    
    required public init?(map: Map){
        
    }
    
    public func mapping(map: Map) {
        children <- map["children"]
    }
}
