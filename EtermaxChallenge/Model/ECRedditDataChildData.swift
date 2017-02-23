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

public class ECRedditDataChildData: NSObject, Mappable, NSCoding {
    
    var name: String?
    var title: String?
    var author: String?
    var created: Double?
    var thumbnail: String?
    var num_comments: UInt?
    var subreddit: String?
    
    required public init?(map: Map){
        
    }
    
    public func mapping(map: Map) {
        name <- map["name"]
        title <- map["title"]
        author <- map["author"]
        created <- map["created"]
        thumbnail <- map["thumbnail"]
        num_comments <- map["num_comments"]
        subreddit <- map["subreddit"]
    }
    
    required public init(coder decoder: NSCoder) {
        self.name = decoder.decodeObject(forKey: "name") as? String
        self.title = decoder.decodeObject(forKey: "title") as? String
        self.author = decoder.decodeObject(forKey: "author") as? String
        self.thumbnail = decoder.decodeObject(forKey: "thumbnail") as? String
        self.subreddit = decoder.decodeObject(forKey: "subreddit") as? String
        self.num_comments = decoder.decodeObject(forKey: "num_comments") as? UInt
        self.created = decoder.decodeObject(forKey: "created") as? Double
    }
    
    public func encode(with coder: NSCoder) {
        coder.encode(self.name, forKey: "name")
        coder.encode(self.title, forKey: "title")
        coder.encode(self.author, forKey: "author")
        coder.encode(self.thumbnail, forKey: "thumbnail")
        coder.encode(self.subreddit, forKey: "subreddit")
        coder.encode(self.created, forKey: "created")
        coder.encode(self.num_comments, forKey: "num_comments")
    }
}
