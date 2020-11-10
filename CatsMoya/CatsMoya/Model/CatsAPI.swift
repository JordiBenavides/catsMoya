//
//  Cats.swift
//  CatsMoya
//
//  Created by Jordi Milla on 10/11/2020.
//  Copyright © 2020 Jordi Milla Catalan. All rights reserved.
//

import Foundation
import Moya

enum CatsAPI {
    case cats
}

extension CatsAPI:TargetType,AccessTokenAuthorizable {
    public var baseURL: URL {  return URL(string: "https://cat-fact.herokuapp.com/")!}
    
    public var path: String {
        switch self {
        case .cats:
            return "facts"
        }
        
    }
    
    var method: Moya.Method {
        switch self {
        case .cats:
            return .get
        }
    }
    
    var authorizationType: AuthorizationType {
        switch self {
        case .cats:
            return .bearer
        }
    }
    
    public var task: Task {
        switch self {
        case .cats:
            return .requestPlain
        }
    }
    
    public var validationType: ValidationType {
        return .none
    }
    
    public var sampleData: Data {
        return "".data(using: String.Encoding.utf8)!
    }
    
    public var headers: [String: String]? {
        return nil
    }
}
