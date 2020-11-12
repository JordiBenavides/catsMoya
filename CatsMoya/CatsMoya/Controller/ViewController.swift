//
//  ViewController.swift
//  CatsMoya
//
//  Created by Jordi Milla on 10/11/2020.
//  Copyright © 2020 Jordi Milla Catalan. All rights reserved.
//

import Foundation
import UIKit
import Moya


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var table: UITableView!
    
    let provider = MoyaProvider<CatsAPI>()
    var data: [Cats]?
   
    override func viewDidLoad() {
        super.viewDidLoad()
        setTable()
        requestMovies()
        
    }
    
    func setTable(){
        
        table.delegate = self
        table.dataSource = self
        table.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "CustomTableViewCell")
    }
    
    func requestMovies(){
        
        provider.request(.cats) { [weak self] result in
          switch result {
          case .success(let response):
            let array: [Cats] = try! response.map(ResponseAPI.self).all
            self?.data = array
            self?.table.reloadData()
          case .failure:
            print("Error")
          }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return data?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell") as? CustomTableViewCell
        let cats = data?[indexPath.row]
               cell?.configure(cats: cats)
        
        return cell ?? UITableViewCell()
    }
}

