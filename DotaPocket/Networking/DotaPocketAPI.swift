//
//  DotaPocketAPI.swift
//  DotaPocket
//
//  Created by M Hanif Sugiyanto on 24/06/20.
//  Copyright © 2020 M Hanif Sugiyanto. All rights reserved.
//

import Moya

public enum DotaPocketAPI {
  case heroStats
}

extension DotaPocketAPI: TargetType {
  public var baseURL: URL {
    return URL(string: "https://api.opendota.com/api")!
  }
  
  public var path: String {
    switch self {
    case .heroStats:
      return "/herostats"
    }
  }
  
  public var method: Moya.Method {
    switch self {
    default:
      return .get
    }
  }
  
  public var sampleData: Data {
    return Data()
  }
  
  public var task: Task {
    switch self {
    default:
      return .requestParameters(parameters: parameters ?? [:], encoding: parameterEncoding)
    }
  }
  
  public var headers: [String : String]? {
    return nil
  }
  
  public var parameterEncoding: ParameterEncoding {
    switch self.method {
    case .post, .put:
      return JSONEncoding.default
    default:
      return URLEncoding.default
    }
  }
  
  public var parameters: [String: Any]? {
    switch self {
    default:
      return nil
    }
  }
}
