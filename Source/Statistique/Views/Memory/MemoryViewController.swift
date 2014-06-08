//
//  MemoryViewController.swift
//  Statistique
//
//  Created by Patrick Chamelo on 08/06/14.
//  Copyright (c) 2014 Patrick Chamelo. All rights reserved.
//

import Foundation
import UIKit

class MemoryViewController: UIViewController
{
    var tableView: UITableView!
    var dataSource: MemoryDataSource!

    // MARK: Initializers
    init(nibName nibNameOrNil: String!, bundle nibBundleOrNil: NSBundle!)
    {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    convenience init()
    {
        self.init(nibName: nil, bundle: nil)
    }

    // MARK: Overrides
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.buildAndConfigureDataSource()
        self.buildAndConfigureTableView()
    }
    
    // MARK: Build And Configure
    func buildAndConfigureDataSource()
    {
        self.dataSource = MemoryDataSource()
    }

    func buildAndConfigureTableView()
    {
        self.tableView = UITableView(frame: self.view.bounds)
        self.tableView.delegate = self.dataSource;
        self.tableView.dataSource = self.dataSource;
        self.view.addSubview(tableView);
    }

}
