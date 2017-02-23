//
//  ECRedditDataChild.swift
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

public class ECRedditDataChild: NSObject, Mappable, NSCoding {
    
    var data: ECRedditDataChildData?
    
    required public init?(map: Map){
        
    }
    
    public func mapping(map: Map) {
        data <- map["data"]
    }
    
    required public init(coder decoder: NSCoder) {
        self.data = decoder.decodeObject(forKey: "data") as? ECRedditDataChildData
    }
    
    public func encode(with coder: NSCoder) {
        coder.encode(self.data, forKey: "data")
    }
}
