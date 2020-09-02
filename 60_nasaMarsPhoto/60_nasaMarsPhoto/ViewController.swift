//
//  ViewController.swift
//  60_nasaMarsPhoto
//
//  Created by fedir on 02.09.2020.
//  Copyright © 2020 fedir. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableview: UITableView!
    
    
    var key = "c803m9UfrGW3Atq19kr0QaNvR4grC1vNsGcGWXX4"
    var urlStr = "https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=16&api_key=c803m9UfrGW3Atq19kr0QaNvR4grC1vNsGcGWXX4"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setupTableView()
    }
    
    private func setupTableView() {
  
        tableview.delegate = self
        tableview.dataSource = self
        tableview.register(UINib(nibName: "RoverCell", bundle: nil), forCellReuseIdentifier: "RoverCell")
    }


}

extension UIViewController: UITableViewDelegate,UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RoverCell", for: indexPath) as! RoverCell
        cell.backgroundColor = #colorLiteral(red: 0.4392156899, green: 0.01176470611, blue: 0.1921568662, alpha: 1)
        cell.layer.cornerRadius = 10
        return cell
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
    
}

