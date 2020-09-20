//
//  NasaNetwork.swift
//  60_nasaMarsPhoto
//
//  Created by fedir on 02.09.2020.
//  Copyright © 2020 fedir. All rights reserved.
//

import Foundation
import Alamofire

class NasaNetwork {
    var key2 = "sw5CG2Hcs6FEluqpvrF0FhHdIWHPKiBdrtOFh2cm"
    var keyValue = "c803m9UfrGW3Atq19kr0QaNvR4grC1vNsGcGWXX4"
    var urlStr = "https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=16&api_key=c803m9UfrGW3Atq19kr0QaNvR4grC1vNsGcGWXX4"
    
    func getData(completion: @escaping (NetData?) -> Void){
        AF.request(urlStr)
            .validate()
            .responseDecodable(of: NetData.self) { (response) in
                if let value = response.value {
                    completion(value)
                }else{
                    completion(nil)
                }
        }
    }
}
