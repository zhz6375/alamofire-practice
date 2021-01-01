//
//  ViewController.swift
//  alamofire-practice
//
//  Created by SIU on 2020/12/31.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
//        let url = API.BASE_URL + "search/photos"
//        let queryParam = ["query": "cat", "client_id": API.CLIENT_ID]
        
//        AF.request(url, method: .get, parameters: queryParam).responseJSON { response in
//            debugPrint(response)
//        }
        
        var urlTocall : URLRequestConvertible?
        
        var search = "Photos"
        var userInput = "cat"
        
        switch search {
        case "Photos":
            urlTocall = SearchRouter.searchPhotos(term: userInput)
        case "Users":
            urlTocall = SearchRouter.searchUsers(term: userInput)
        default:
            print("default")
        }
        
        if let urlConvertible = urlTocall {
            
            AlamofireManager
                .shared
                .session
                .request(urlConvertible)
                .validate(statusCode: 200..<401)
                .responseJSON { (response) in
    //                debugPrint(response)
                }
            
        }
        
    }

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // 인증 실패 노티피케이션 등록
    
        NotificationCenter.default.addObserver(self, selector: #selector(showErrorPopup(notification:)), name: NSNotification.Name(rawValue: NOTIFICATION.API.AUTH_FAIL), object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        // 인증 실패 노티피케이션 등록 해제
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name(rawValue: NOTIFICATION.API.AUTH_FAIL), object: nil)
    }
    
    //MARK : - objc methods
    
    @objc func showErrorPopup(notification: NSNotification){
        print("VC - showErrorPopup()")
        
        if let data = notification.userInfo?["statusCode"] {
            
            print("showErrorPopup() data : \(data)")
            
        }
        
    }

}

