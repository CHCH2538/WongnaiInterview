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
    let request = ImageInfoRequest()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let anonymousFunc = { (fetchedImagesInfo: [ImagesInfo]) in
            DispatchQueue.main.async {
                self.imagesInfo = fetchedImagesInfo
                self.tableView.reloadData()
            }
        }
        
        request.fetchImageInfo(onCompletion: anonymousFunc)
        tableViewSetup()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell
        let cellData = imagesInfo[indexPath.row]
        
        cell.imageDisp?.image = UIImage(url: URL(string: "\(cellData.image_url![0])"))
        cell.nameLabel?.text = cellData.name
        cell.descriptionLabel?.text = cellData.description
        cell.positiveVoteCountLabel?.text = String(cellData.positive_votes_count!)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imagesInfo.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableViewSetup() {
        
        tableView.refreshControl = UIRefreshControl()
        tableView.refreshControl?.addTarget(self, action: #selector(callPullToRefresh), for: .valueChanged)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "Cell")
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 500
        tableView.reloadData()
    }
    
    @objc func callPullToRefresh() {
       print("called")
        let anonymousFunc = { (fetchedImagesInfo: [ImagesInfo]) in
            DispatchQueue.main.async {
                self.imagesInfo = fetchedImagesInfo
                self.tableView.reloadData()
            }
        }
        self.request.fetchImageInfo(onCompletion: anonymousFunc)
        self.tableView.reloadData()
        tableView.refreshControl?.endRefreshing()
    }
}

extension UIImage {
  convenience init?(url: URL?) {
    guard let url = url else { return nil }
            
    do {
      self.init(data: try Data(contentsOf: url))
    } catch {
      print("Cannot load image from url: \(url) with error: \(error)")
      return nil
    }
  }
}

