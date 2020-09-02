//
//  ViewController.swift
//  60_nasaMarsPhoto
//
//  Created by fedir on 02.09.2020.
//  Copyright © 2020 fedir. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UITableViewDataSource,UITableViewDelegate{
    var arrayPhotos = [Photo]()
    
    @IBOutlet weak var tableview: UITableView!
    
    var network = NasaNetwork()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setupTableView()
        
        network.getData { (netData) in
            if let photos = netData?.photos {
                DispatchQueue.main.async {
                    self.arrayPhotos = photos
                    //print(self.arrPhotos)
                    self.tableview.reloadData()
                }
            }
        }
    }
    
    private func setupTableView() {
        tableview.delegate = self
        tableview.dataSource = self
        tableview.register(UINib(nibName: "RoverCell", bundle: nil), forCellReuseIdentifier: "RoverCell")
    }



    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayPhotos.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RoverCell", for: indexPath) as! RoverCell
        cell.setupCell(photoItem: arrayPhotos[indexPath.row])
        
       
        return cell
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.frame.width
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    
    
    
}

