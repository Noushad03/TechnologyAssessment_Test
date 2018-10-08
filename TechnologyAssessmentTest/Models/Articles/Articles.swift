//
//  Articles.swift
//  TechnologyAssessmentTest
//
//  Created by clickapps on 10/8/18.
//  Copyright © 2018 Noushad. All rights reserved.
//

import UIKit

class Articles: NSObject {

    
    var strId = ""
    var strArticleTitle = ""
    var strAbstract = ""
    
    var strpublished_date = ""
    
    override init() {
        
        super.init()
    }
    
    convenience init(_ data: Dictionary<String, AnyObject>) {
        
        self.init()
        
        
        if let id = data["id"] {
            
            self.strId = String.init(describing: id)
        }
        
        if let title = data["title"] as? String {
            
            self.strArticleTitle = title
        }
        if let  abstract = data["abstract"] as? String {
            
            self.strAbstract = abstract
        }
        
        if let publishDate = data["published_date"] as? String {
            
            if !(publishDate == "<null>") {
                
                self.strpublished_date = publishDate
            }
        }
    }
}
