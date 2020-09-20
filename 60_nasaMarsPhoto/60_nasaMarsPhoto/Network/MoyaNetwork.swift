//
//  MoyaNetwork.swift
//  60_nasaMarsPhoto
//
//  Created by fedir on 15.09.2020.
//  Copyright © 2020 fedir. All rights reserved.
//

import Foundation
import Moya

var key2 = "sw5CG2Hcs6FEluqpvrF0FhHdIWHPKiBdrtOFh2cm"
var keyValue = "c803m9UfrGW3Atq19kr0QaNvR4grC1vNsGcGWXX4"
var urlBaseStr = "https://api.nasa.gov/mars-photos/api/v1"

enum MoyaTarget {
    case getPhotos
}

extension MoyaTarget: TargetType {
    
    var baseURL: URL {
        return URL(string: urlBaseStr)!
    }
    
    var path: String {
        switch self {
        case .getPhotos: return "rovers/curiosity/photos"
        }
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .getPhotos: return .requestParameters(parameters: ["sol": "16", "api_key": keyValue], encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        return nil
    }
}

class MoyaNetwork {
    
    var provider: MoyaProvider = MoyaProvider<MoyaTarget>()
    
    func getPhotos(success: @escaping (NetData) -> Void, failure: @escaping (Error) -> Void) {
        
        self.provider.request(.getPhotos) { (result) in
            
            switch result {
            case .success(let response):
                let decoder = JSONDecoder()
                do {
                    let netData = try decoder.decode(NetData.self, from: response.data)
                    success(netData)
                } catch {
                    failure(error)
                }
            case .failure(let error):
                failure(error)
            }
        }
        
    }
    
}
