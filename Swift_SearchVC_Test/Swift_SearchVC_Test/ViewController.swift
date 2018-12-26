//
//  ViewController.swift
//  Swift_SearchVC_Test
//
//  Created by shenyinghao on 2018/12/25.
//  Copyright © 2018年 shenyinghao. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate , UITableViewDataSource , UISearchBarDelegate , UISearchResultsUpdating{
    
    private var searchController : UISearchController!
    
    private var resultTableContentView : UITableView!
    var dataSources = ["我是第一个","我是第二个","我是第三个","我是第四个","我是第五个","我是第6个","我是第7个","我是第8个","我是第9个", "我是第10个"]
    
    var eidteSearchBar = false
    
    var searchAry : NSMutableArray = []
    
    
//    let nav = UIView.init(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 44))
    /// 对于tableview的indentify最好设置成不可变的常量
    let cellId = "cellid"
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
//        self.navigationController?.navigationBar.isHidden = true
//        self.creatNavbarWithTitle(title: "hello")
        
        resultTableContentView = UITableView.init(frame: CGRect.init(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height-64))
        resultTableContentView.delegate = self
        resultTableContentView.dataSource = self
        resultTableContentView.register(SearchResultCell.self, forCellReuseIdentifier: cellId)
        self.view.addSubview(resultTableContentView)
        
        
        searchController = UISearchController.init(searchResultsController: nil)
        searchController.searchResultsUpdater = self as? UISearchResultsUpdating
        searchController.searchBar.delegate = self as? UISearchBarDelegate;
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchBar.autocapitalizationType = .none
        definesPresentationContext = true
        searchController.searchBar.sizeToFit()
        searchController.searchBar.placeholder = "Search here..."
        
        
        if #available(iOS 11.0, *) {
            navigationItem.searchController = searchController
            navigationItem.hidesSearchBarWhenScrolling = false
        }
        else
        {
            resultTableContentView.tableHeaderView = searchController.searchBar
        }
//        self.view.bringSubview(toFront: nav)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}


extension ViewController
{
    /// 搜索筛选数据
    func updateSearchResults(for searchController: UISearchController) {
        let searchPredicate = NSPredicate(format: "SELF CONTAINS[c] %@", searchController.searchBar.text!)

        let arry = (self.dataSources as NSArray).filtered(using: searchPredicate)
        
        self.searchAry = NSMutableArray.init(array: arry)
        
        self.resultTableContentView.reloadData()
        
    }
    
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        self.eidteSearchBar = true
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        self.eidteSearchBar = false
    }
    
    /// tableview的代理
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.eidteSearchBar
        {
            return self.searchAry.count
        }
        return self.dataSources.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell : SearchResultCell?
        
        cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as? SearchResultCell
        if (cell == nil)
        {
            cell = SearchResultCell.init(style: UITableViewCellStyle.default, reuseIdentifier: cellId)
        }
        if eidteSearchBar {
            cell?.setupContentView(textTemp: self.searchAry[indexPath.row] as! NSString)
        }
        else
        {
            cell?.setupContentView(textTemp: self.dataSources[indexPath.row] as NSString)
        }
        
        return cell!
    }
    
}



//extension ViewController
//{
//
//    func creatNavbarWithTitle(title: NSString)
//    {

//        let labTitle = UILabel.init(frame: CGRect.init(x: 0, y: 20, width: 200, height: 30))
////        labTitle.backgroundColor = UIColor.red
//        labTitle.textAlignment = NSTextAlignment.center
//        nav.addSubview(labTitle)
//        labTitle.center.x = nav.center.x
//        labTitle.center.y = nav.center.y + 20
//        labTitle.text = title as String
//        nav.backgroundColor = UIColor.white
//        self.view.addSubview(nav)
//    }
//}












