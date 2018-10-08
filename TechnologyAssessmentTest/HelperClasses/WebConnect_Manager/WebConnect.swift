//
//  WebConnect_Manager.swift
//  WebConnectSampleApp
//
//  Created by Noushad Shah on 1/2/18.
//  Copyright © 2018 Noushad Shah. All rights reserved.
//

import UIKit

class WebConnect: NSObject {
    
   class func get() -> Builder.GetBuilder{
        return Builder.GetBuilder(type: "GET")
    }
    
    class func post() -> Builder.PostBuilder{
        return Builder.PostBuilder(type: "POST")
    }
    
    class func put() -> Builder.PutBuilder{
        return Builder.PutBuilder(type: "PUT")
    }

    class func delete() -> Builder.DeleteBuilder{
        return Builder.DeleteBuilder(type: "DELETE")
    }
    
    class func download() -> Builder.DownloadBuilder{
        return Builder.DownloadBuilder(type: "GET")
    }
    
    class func upload() -> Builder.UploadBuilder{
        return Builder.UploadBuilder(type: "POST")
    }
}
