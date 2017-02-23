//
//  ECRedditTopTVC.swift
//  EtermaxChallenge
//
//  Created by mts on 23/2/17.
//  Copyright © 2017 Etermax. All rights reserved.
//

import UIKit

class ECRedditTopTVC: UITableViewController {

    let cellIdentifier = "cell"
    var reddit: ECReddit?
    let activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        activityIndicator.frame = CGRect(x:0.0, y:0.0, width: 40.0, height: 40.0);
        activityIndicator.center = self.view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.gray
        self.view.addSubview(activityIndicator)
        activityIndicator.startAnimating()

        ECDataService.sharedInstance.listTop { (reddit) in
            self.reddit = reddit
            self.activityIndicator.stopAnimating()
            self.tableView.reloadData()
        }
    }
    
    func loadMore() {
        self.activityIndicator.startAnimating()
        
        ECDataService.sharedInstance.listMore { (reddit) in
            
            let lastIndexPosition = self.reddit?.data?.children?.count ?? 0
            
            self.reddit = reddit
            self.activityIndicator.stopAnimating()
            self.tableView.reloadData()
            
            let when = DispatchTime.now() + 1
            DispatchQueue.main.asyncAfter(deadline: when) {
                let inx = IndexPath(row: lastIndexPosition, section: 0)
                self.tableView.scrollToRow(at: inx, at: .bottom, animated: true)
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.reddit?.data?.children?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! ECTopCell

        let data = self.reddit?.data?.children?[indexPath.row].data
        cell.loadCell(data: data)

        return cell
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        let rowsCount = 25
        let resultCount = self.reddit?.data?.children?.count ?? 0
        
        if rowsCount > resultCount && indexPath.row == (resultCount - 1) {
            loadMore()
        }
    }

}
