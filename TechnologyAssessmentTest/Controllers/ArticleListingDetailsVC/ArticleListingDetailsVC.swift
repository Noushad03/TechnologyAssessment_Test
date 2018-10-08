//
//  ArticleListingDetailsVC.swift
//  TechnologyAssessmentTest
//
//  Created by clickapps on 10/8/18.
//  Copyright © 2018 Noushad. All rights reserved.
//

import UIKit

class ArticleListingDetailsVC: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tblArticleDetails:UITableView!
    
    @IBOutlet weak var topNavigationView:UIView!
    
    public var objArticle:Articles?

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
        
        self.tblArticleDetails.estimatedRowHeight = 44
        self.tblArticleDetails.rowHeight = UITableViewAutomaticDimension
        
        self.tblArticleDetails.register(UINib.init(nibName: "TitleTableViewCell", bundle: nil), forCellReuseIdentifier: "TitleTableViewCellIdentifire")
        
        self.tblArticleDetails.register(UINib.init(nibName: "DetailTableViewCell", bundle: nil), forCellReuseIdentifier: "DetailTableViewCellIdentifire")
        
        self.tblArticleDetails.tableFooterView = UIView.init(frame: .zero)
        
    }
    
    //MARK:- navigateBack
    @IBAction func navigateBack(_ sender: UIButton) {
        _ = self.navigationController?.popViewController(animated: true)
    }
    
    //MARK:- UITableViewDataSource
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return UITableViewAutomaticDimension
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TitleTableViewCellIdentifire") as? TitleTableViewCell
            cell?.selectionStyle = .none
            
            cell?.lblTitile.text = objArticle?.strArticleTitle
            cell?.lblDate.text = objArticle?.strpublished_date
            
            return cell!
        }
        else {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "DetailTableViewCellIdentifire") as? DetailTableViewCell
            cell?.selectionStyle = .none
            
            cell?.lblSubtitile.text = objArticle?.strAbstract
            
            return cell!
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
