//
//  ViewController.swift
//  TutorialInstagramAccount
//
//  Created by Eirik Madland on 12.07.15.
//  Copyright (c) 2015 Eirik Madland. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController, UITableViewDataSource {

    var results:[JSON]? = []
    let client_id = "<YOUR_INSTAGRAM_CLIENT_ID>"
    let user_id = "<THE_USER_ID_TO_BE_DISPLAYED>"
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadInstaData()
    }
    
    func loadInstaData() {
        let url = "https://api.instagram.com/v1/users/\(user_id)/media/recent?client_id=\(client_id)&count=33"
        Alamofire.request(.GET, url).responseJSON { (request, response, json, error) in
            if (json != nil) {
                var jsonObj = JSON(json!)
                if let data = jsonObj["data"].arrayValue as [JSON]? {
                    self.results = data
                    self.tableView.reloadData()
                }
            }
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.results?.count ?? 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("cell") as! TableViewCell
        
        cell.entry = self.results?[indexPath.row]
        
        return cell
    }
    
}

