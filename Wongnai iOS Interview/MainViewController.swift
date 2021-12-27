//
//  ViewController.swift
//  Wongnai iOS Interview
//
//  Created by Pongpubate Charoensinphutthakhun on 24/12/2564 BE.
//

import UIKit

class MainViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var tableView: UITableView!
    var imagesInfo = [ImagesInfo]()
    var listOfItem = [ImageInfoList]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let anonymousFunc = { (fetchedImagesInfo: [ImagesInfo]) in
            DispatchQueue.main.async {
                self.imagesInfo = fetchedImagesInfo
                self.tableView.reloadData()
            }
        }
        
        ImageInfoRequest.shared.fetchImageInfo(onCompletion: anonymousFunc)
        tableView.reloadData()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "Cell")
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 500
        
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 3
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    
    
    
   


}

