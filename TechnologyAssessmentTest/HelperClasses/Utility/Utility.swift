//
//  Utility.swift
//  TechnologyAssessmentTest
//
//  Created by Noushad Shah on 7/3/18.
//  Copyright © 2018 Noushad Shah. All rights reserved.
//

import UIKit
import SystemConfiguration
import MobileCoreServices

class Utility: NSObject {
    
    class var sharedInstance: Utility {
        struct Singleton {
            static let instance: Utility = Utility()
        }
        return Singleton.instance
    }
    
    
    let formatter = DateFormatter.init()
    var keyboardHeight = 0.0
    
    class func showNotificationOverlay(message:String?,controller:UIViewController,type:NotificationMessageType) {
        
        if controller.view != nil {
            
            NotificationView.shared.showOnView(controller.view, with: message!, ofType: type, andDirection: 1)
        }
    }
    
    class func parseResponseAndReturnJsonDict(response:String?, httpStatus:Bool, completionHandler:(Bool,Dictionary<String,AnyObject>) -> Void) {
        if httpStatus == true {
            let jsonData = response?.data(using: .utf8)!
            let jsonParsed =  try? JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableLeaves) as! Dictionary<String, AnyObject>
            if let json = jsonParsed {
                if let success = json["status"] as? String {
                    if success == "OK" {
                        completionHandler(true, json)
                    } else {
                        if let errorMessage = json["message"] as? String {
                            completionHandler(false, ["message":errorMessage as AnyObject])
                        }
                    }
                } else {
                    completionHandler(false, ["message":"There might be some error, Please try later." as AnyObject])
                }
            } else {
                completionHandler(false, ["message":"There might be some error, Please try later." as AnyObject])
            }
        } else {
            completionHandler(false, ["message":"There might be some error, Please try later." as AnyObject])
        }
    }
    
    

}
