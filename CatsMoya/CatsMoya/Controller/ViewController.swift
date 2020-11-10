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
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        provider.request(.cats) { [weak self] result in

          switch result {
          case .success(let response):
            print("Success")
          case .failure:
            print("Error")
          }
        }
    }


}

