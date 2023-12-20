//
//  HomeViewController.swift
//  MVVMExampleIOS
//
//  Created by nhi.luu on 20/12/2023.
//

import UIKit
import Foundation

class HomeViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var viewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Home"
        
        let searchItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(loadAPI))

        navigationItem.rightBarButtonItem = searchItem
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(HomeTableViewCell.nib(), forCellReuseIdentifier: HomeTableViewCell.identifier)
        
        
    }
    
    @objc func loadAPI(){
        viewModel.loadAPI2{
            (done, msg) in
            if done {
                self.updateUI()
            }
            else {
                print("error: \(msg)")
            }
        }
        
    }
    
    func updateUI() {
        tableView.reloadData()
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.identifier, for: indexPath) as! HomeTableViewCell
        let item = viewModel.products[indexPath.row]
        cell.bindData(title: item.title, category: item.category, imageURL: item.images.first ?? "http://i.imgur.com/w5rkSIj.jpg")
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        180
    }
}


