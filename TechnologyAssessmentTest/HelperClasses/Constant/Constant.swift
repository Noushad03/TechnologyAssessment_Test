//
//  Constant.swift
//  TechnologyAssessmentTest
//
//  Created by Noushad Shah on 7/3/18.
//  Copyright © 2018 Noushad Shah. All rights reserved.
//

import Foundation
import UIKit

let App_Delegate = UIApplication.shared.delegate as! AppDelegate

struct API {
    
    static let kBaseUrl = "http://api.nytimes.com/svc/mostpopular/v2/"
    
    static let kArticleList  =       "mostviewed/all-sections/30.json?"

}
