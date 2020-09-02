//
//  ModelPhoto.swift
//  60_nasaMarsPhoto
//
//  Created by fedir on 02.09.2020.
//  Copyright © 2020 fedir. All rights reserved.
//

import Foundation

struct Rover: Codable {
    var id: Int
    var name: String
    var landing_date: String
    var launch_date: String
    var status: String
}

struct Camera: Codable {
    var id: Int
    var name: String
    var rover_id: Int
    var full_name: String
}

struct Photo {
    var id: Int
    var sol: Int
    var camera: Camera
    var img_src: String
    var earth_date: String
    var rover: Rover
}
