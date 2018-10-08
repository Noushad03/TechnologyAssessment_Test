//
//  RequestCallback.swift
//  WebConnectSampleApp
//
//  Created by Noushad Shah on 1/10/18.
//  Copyright © 2018 Noushad Shah. All rights reserved.
//

import UIKit
import Alamofire
import SVProgressHUD

class RequestCallback: NSObject {
    
    init(param: WebParam, request: DataRequest) {
        
        request.responseString { (response:DataResponse<String>) in
            
            if SVProgressHUD.isVisible() {
                SVProgressHUD.dismiss()
            }
            if UIApplication.shared.isIgnoringInteractionEvents {
                UIApplication.shared.endIgnoringInteractionEvents()
            }

            
            switch(response.result) {
            case .success(_):
                if response.result.value != nil {
                    if param.loader != nil && param.loader.isAnimating{
                        param.loader.stopAnimating()
                        param.loader.hidesWhenStopped = true
                    }
                    if WebConnectConfiguration.debug  {
                        print(response.result.value! as Any)
                    }
                    param.callback!(true,response.result.value!)
                }
                break
            case .failure(_):
                if WebConnectConfiguration.debug  {
                    print(response.result.error! as Any)
                }
                if param.loader != nil && param.loader.isAnimating{
                    param.loader.stopAnimating()
                    param.loader.hidesWhenStopped = true
                }
                param.callback!(false,response.result.error! as? String)

                break
            }
        }
    }
    
    
}
