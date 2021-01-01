//
//  ApiStatusLogger.swift
//  alamofire-practice
//
//  Created by SIU on 2020/12/31.
//

import Foundation
import Alamofire

final class ApiStatusLogger: EventMonitor {
    
    let queue = DispatchQueue(label: "ApiStatusLogger")
    
//    func requestDidResume(_ request: Request) {
//
//        print("ApiStatusLogger - requestDidResume()")
//        debugPrint(request)
//
//    }
 
    func request(_ request: DataRequest, didParseResponse response: DataResponse<Data?, AFError>) {
        
        guard let statusCode = request.response?.statusCode else {
            return
        }
        
        print("ApiStatusLogger - statusCode : \(statusCode)")
//        debugPrint(response)

    }
    
}
