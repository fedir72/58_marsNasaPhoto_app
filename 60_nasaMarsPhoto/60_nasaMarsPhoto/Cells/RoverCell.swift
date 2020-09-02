//
//  RoverCell.swift
//  60_nasaMarsPhoto
//
//  Created by fedir on 02.09.2020.
//  Copyright © 2020 fedir. All rights reserved.
//

import UIKit
import SDWebImage

class RoverCell: UITableViewCell {
    
    let identifier = "RoverCell"
    
    @IBOutlet weak var earthDataLabel: UILabel!
    @IBOutlet weak var solMissionLabel: UILabel!
    @IBOutlet weak var cameraNamelabel: UILabel!
    @IBOutlet weak var roverNameLabel: UILabel!
    
    @IBOutlet weak var photoLabel: UIImageView!
    
    func setupCell(photoItem: Photo) {
        earthDataLabel.text = "date: " + photoItem.earth_date
        roverNameLabel.text = photoItem.rover.name
        cameraNamelabel.text = "camera: " + photoItem.camera.name
        solMissionLabel.text = "sol mission: " + String(photoItem.sol)
        print("urlString: ",photoItem.img_src)
        if let urlImage = URL(string: photoItem.img_src) {
            photoLabel.sd_setImage(with: urlImage, completed: nil)} 
    }
    
}
