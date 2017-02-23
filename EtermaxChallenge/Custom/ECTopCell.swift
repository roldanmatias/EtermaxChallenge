//
//  ECTopCell.swift
//  EtermaxChallenge
//
//  Created by mts on 23/2/17.
//  Copyright © 2017 Etermax. All rights reserved.
//

import UIKit
import Kingfisher

class ECTopCell: UITableViewCell {
    
    @IBOutlet weak var thumbnail: UIImageView!
    @IBOutlet weak var author: UILabel!
    @IBOutlet weak var subreddit: UILabel!
    @IBOutlet weak var comments: UILabel!
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var title: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func loadCell(data: ECRedditDataChildData?) {
        
        if let childData = data {
            self.title.text = childData.title
            self.author.text = childData.author
            self.subreddit.text = childData.subreddit
            self.comments.text = "\(childData.num_comments ?? 0) comments"
            
            if let created = childData.created {
                let date = Date(timeIntervalSince1970: created)
                
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "MM/dd/yy HH:mm"
                
                self.time.text = dateFormatter.string(from: date)
            }else {
                self.time.text = ""
            }
            
            if let thumbnailUrl = childData.thumbnail, let url = URL(string: thumbnailUrl) {
                self.thumbnail.kf.setImage(with: ImageResource(downloadURL: url), placeholder: nil, options: nil, progressBlock: nil, completionHandler: nil)
            }else {
                self.thumbnail.image = UIImage(named: "nothumbnail")
            }
        }
    }
}
