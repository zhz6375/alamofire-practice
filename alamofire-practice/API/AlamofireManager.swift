//
//  AlamofireManager.swift
//  alamofire-practice
//
//  Created by SIU on 2020/12/31.
//

import Foundation
import Alamofire

// override 못하게 방지
final class AlamofireManager {
    
    // 싱글턴 적용
    
    static let shared = AlamofireManager()
    
    // 인터셉터
    
    let intercepters = Interceptor(interceptors:[BaseInterceptor()])
    
    // 로거 설정
    
    let monitors = [Logger(), ApiStatusLogger()] as [EventMonitor]
    
    // 세션 설정
    
    var session = Session.default
    
    private init() {
        
        session = Session(interceptor: intercepters, eventMonitors: monitors)
        
    }
    
}
