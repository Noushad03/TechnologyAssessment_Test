//
//  ArticleListingVC.swift
//  TechnologyAssessmentTest
//
//  Created by clickapps on 10/8/18.
//  Copyright © 2018 Noushad. All rights reserved.
//

import UIKit

class ArticleListingVC: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tblArticleListing:UITableView!
    
    @IBOutlet weak var lblNoRecords:UILabel!
    @IBOutlet weak var topNavigationView:UIView!

    var arrayArticleListing = [Articles]()
    var totalCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.setupInitalSettings()
    }
    
    //MARK:- setUpInitialSettings
    func setupInitalSettings()  {
        
        self.topNavigationView.layer.shadowOpacity = 0.50
        ///self.layer.shadowOffset = CGSize.zero//CGSize(width: 0, height: 5)
        self.topNavigationView.layer.shadowOffset = CGSize(width: -2, height: 2)
        
        self.topNavigationView.layer.shadowRadius = 2
        self.topNavigationView.layer.shadowColor = UIColor.lightGray.cgColor
        self.topNavigationView.layer.masksToBounds = false
        
        self.lblNoRecords.textColor = UIColor.black
        
        self.tblArticleListing.register(UINib.init(nibName: "ArticleListingTableCell", bundle: nil), forCellReuseIdentifier: "ArticleListingTableCell_identifire")
        self.tblArticleListing.tableFooterView = UIView.init(frame: .zero)
        
        
        self.getArticleList()
    }
    
    //MARK:- Get Article List
    
    func getArticleList() {
        
        var param:[String:String] = Dictionary()
        param["api-key"] = "994e78cfb18248f4af3fe07bf98891c4"
        WebConnect.get()
            .url(url: API.kArticleList)
            .queryParam(queryParam: param)
            .showCustomLoader(showLoader: true)
            .callback { (status, response) in
                
                Utility.parseResponseAndReturnJsonDict(response: response, httpStatus: status, completionHandler: { (apiStatus, json) in
                    if apiStatus == true {
                        
                        self.tblArticleListing.tableFooterView = UIView.init(frame: .zero)
                        
                        if let responseArray = json["results"] as? [AnyObject] {
                            
                            if responseArray.count > 0 {
                                for dict in responseArray {
                                    
                                    self.arrayArticleListing.append(Articles.init(dict as! Dictionary<String, AnyObject>))
                                }
                                self.lblNoRecords.isHidden = true
                                self.tblArticleListing.reloadData()
                                return
                            }
                            else {
                                
                                self.lblNoRecords.isHidden = false
                                self.tblArticleListing.reloadData()
                            }
                            
                        }
                    } else {
                        //we have encountered error
                        Utility.showNotificationOverlay(message: json["message"] as? String, controller: self, type: .Error)
                    }
                })
            }.connect()
    }
    
    //MARK:- UITableViewDataSource
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 124.0
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.arrayArticleListing.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleListingTableCell_identifire") as? ArticleListingTableCell
        cell?.selectionStyle = .none
        
        let objArticles = self.arrayArticleListing[indexPath.row]
        
        cell?.lblTitle.text = objArticles.strArticleTitle
        cell?.lblSubtitile.text = objArticles.strAbstract
        cell?.lblDate.text = objArticles.strpublished_date

        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        
        if let articleListingDetailsVC = storyboard.instantiateViewController(withIdentifier: "ArticleListingDetailsVC") as? ArticleListingDetailsVC {
            
            articleListingDetailsVC.objArticle = arrayArticleListing[indexPath.row]
            self.navigationController?.pushViewController(articleListingDetailsVC, animated: true)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
