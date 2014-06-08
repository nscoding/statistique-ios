//
//  MemoryDataSource.swift
//  Statistique
//
//  Created by Patrick Chamelo on 08/06/14.
//  Copyright (c) 2014 Patrick Chamelo. All rights reserved.
//

import Foundation
import UIKit

class MemoryDataSource : NSObject, UITableViewDataSource, UITableViewDelegate
{
    // MARK: UITableView Delegate
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int
    {
        return 4
    }
    
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell!
    {
       return UITableViewCell()
    }
}