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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        ECDataService.sharedInstance.listTop { (reddit) in
            self.reddit = reddit
            self.tableView.reloadData()
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
}
