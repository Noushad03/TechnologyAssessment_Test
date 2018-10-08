//
//  WebConnectConfiguration.swift
//  WebConnectSampleApp
//
//  Created by Noushad Shah on 1/5/18.
//  Copyright © 2018 Noushad Shah. All rights reserved.
//

import UIKit

class WebConnectConfiguration: NSObject {

   static var baseUrl = ""
   static var connectTimeout = 20
   static var readTimeout = 20
   static var debug = true
    
   private static var baseUrllocal = ""
   
    func baseUrl(baseUrl:String) -> Self {
        WebConnectConfiguration.baseUrllocal = baseUrl
            return self
        }
    
     func timeOut(connectTimeout: Int, readTimeout : Int) -> Self {
           WebConnectConfiguration.connectTimeout = connectTimeout
           WebConnectConfiguration.readTimeout = readTimeout
            return self
        }
    
     func debug(debug: Bool) -> Self {
            WebConnectConfiguration.debug = debug
            return self
        }
    
     func config() {
        WebConnectConfiguration.baseUrl = WebConnectConfiguration.baseUrllocal
    }
}
