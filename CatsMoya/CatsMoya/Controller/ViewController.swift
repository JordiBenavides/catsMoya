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


class ViewController: UIViewController {

    let provider = MoyaProvider<CatsAPI>()
    var data: [Cats]?
    override func viewDidLoad() {
        super.viewDidLoad()
      
        provider.request(.cats) { [weak self] result in

          switch result {
          case .success(let response):
            let array: [Cats] = try! response.map(ResponseAPI.self).all
            self?.data = array
          case .failure:
            print("Error")
          }
        }
    }
}

