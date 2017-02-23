//
//  ECRedditDataChildData.swift
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

public class ECRedditDataChildData: Mappable {
    
    var title: String?
    var author: String?
    var created: Double?
    var thumbnail: String?
    var num_comments: UInt?
    var subreddit: String?
    
    required public init?(map: Map){
        
    }
    
    public func mapping(map: Map) {
        title <- map["title"]
        author <- map["author"]
        created <- map["created"]
        thumbnail <- map["thumbnail"]
        num_comments <- map["num_comments"]
        subreddit <- map["subreddit"]
    }
}
