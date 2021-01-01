//
//  Logger.swift
//  alamofire-practice
//
//  Created by SIU on 2020/12/31.
//

import Foundation
import Alamofire

final class Logger: EventMonitor {
    
    let queue = DispatchQueue(label: "Logger")
    
    func requestDidResume(_ request: Request) {
        
        print("Logger - requestDidResume()")
        debugPrint(request)
        
    }
 
    func request<Value>(_ request: DataRequest, didParseResponse response: DataResponse<Value, AFError>) {
        print("MyLogger - request.didParseResponse()")
        debugPrint(response)
    }
    
    func request(_ request: DataRequest, didParseResponse response: DataResponse<Data?, AFError>) {
        
        print("Logger - request.didParseResponse()")
        debugPrint(response)

    }
    
}

