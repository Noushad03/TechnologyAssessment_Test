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
    
   // var arrayArticleListing = [AllRequests]()
    var totalCount = 0
    var isLoadMoreCalled:Bool = false
    var currentPageIndex = 1
    var refreshControl: UIRefreshControl!
    
    var isFromRefresh = false
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.setupInitalSettings()
    }
    
    func setupInitalSettings()  {
        
        self.lblNoRecords.textColor = UIColor.black
        
        self.tblArticleListing.register(UINib.init(nibName: "ArticleListingTableCell", bundle: nil), forCellReuseIdentifier: "ArticleListingTableCell_identifire")
        self.tblArticleListing.tableFooterView = UIView.init(frame: .zero)
        
        NotificationCenter.default.addObserver(self, selector: #selector(showInternetConnection), name: Notification.Name("INTERNET_CONNECTED"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(noInternetConnection), name: Notification.Name("NO_INTERNET_CONNECTIVITY"), object: nil)
        
        self.refreshControl = UIRefreshControl()
        self.refreshControl.addTarget(self, action: #selector(requestList), for: .valueChanged)
        self.tblArticleListing.addSubview(refreshControl)
    }
    
    @objc func requestList() {
        
        if !App_Delegate.reachability.isReachable {
            
            self.refreshControl.endRefreshing()
            return
        }
        
        self.isFromRefresh = true
        self.currentPageIndex = 1
        self.isLoadMoreCalled = true
       // self.getRequests( pageIndex: self.currentPageIndex, showLoader: true)
    }
    
    @objc func showInternetConnection() {
        self.isLoadMoreCalled = false
    }
    
    @objc func noInternetConnection() {
        
      //  Loader.sharedManager.hideTableFooterView()
        isLoadMoreCalled = true
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 124.0
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 5//self.arrayAllRequest.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleListingTableCell_identifire") as? ArticleListingTableCell
        cell?.selectionStyle = .none
        
      //  let objAllRequest = self.arrayAllRequest[indexPath.row]
      //  cell?.lblUserName.text = objAllRequest.strClientName
        
        return cell!
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
