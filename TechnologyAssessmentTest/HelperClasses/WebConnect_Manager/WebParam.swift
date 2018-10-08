//
//  WebParam.swift
//  WebConnectSampleApp
//
//  Created by Noushad Shah on 1/3/18.
//  Copyright © 2018 Noushad Shah. All rights reserved.
//

import UIKit

class WebParam: NSObject {
    
    var url : String = ""
    var baseUrl : String = ""
    var header = Dictionary<String, String>()
    var queryParam = Dictionary<String, String>()
    var bodyParam = Dictionary<String, AnyObject>()
    var callback:((Bool,_ response:String?)-> Void)?
    var connectTimeOut = 60
    var readTimeOut = 60
    var loader:UIActivityIndicatorView!
    var type = String()
    var filePath = String()
    var downloadCallBack: ((Bool,_ response:Any)-> Void)?
    var progress: ((_ progress:Double) -> Void)?
    var uploadprogress: ((_ progress:Double) -> Void)?
    var dataParams = Dictionary<String,Data>()
    var isShowCustomLoader = false

}
