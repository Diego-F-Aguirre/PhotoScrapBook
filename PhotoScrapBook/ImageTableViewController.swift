//
//  ImageTableViewController.swift
//  PhotoScrapBook
//
//  Created by Diego Aguirre on 8/8/16.
//  Copyright © 2016 home. All rights reserved.
//

import UIKit

class ImageTableViewController: UITableViewController {
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        let nc = NSNotificationCenter.defaultCenter()
        nc.addObserver(self, selector: #selector(scrapsWereUpdated), name: ScrapControllerDidRefreshNotification, object: nil)
    }
    
    func scrapsWereUpdated(notification: NSNotification) {
        self.tableView.reloadData()
    }
    
    // MARK: - Table view data source
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return PhotoScrapController.sharedController.photoScraps.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCellWithIdentifier("scrapCell", forIndexPath: indexPath) as? PhotoScrapTableViewCell else { return UITableViewCell() }
        
        let photoScrap = PhotoScrapController.sharedController.photoScraps[indexPath.row]
        
        cell.updateCell(photoScrap)
        
        return cell
    }
}
