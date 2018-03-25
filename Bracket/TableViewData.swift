//
//  TableViewData.swift
//  Bracket
//
//  Created by Brandon Kedson (student LM) on 3/14/18.
//  Copyright © 2018 Owner. All rights reserved.
//

import Foundation
import UIKit

class TableViewData: NSObject, UITableViewDataSource {
//    var tableViewPlayers:[String]
//
//    override init(){
//        self.tableViewPlayers = playersList
//    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel!.textAlignment = .center
        cell.textLabel!.text = "Enter a player"
        cell.textLabel!.font = UIFont(name: "Avenir Next", size: 50)
        cell.backgroundColor = UIColor.init(red: 0, green: 0, blue: 0, alpha: 0)
        cell.backgroundView?.alpha = 0
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settings.numPlayers!
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
}
