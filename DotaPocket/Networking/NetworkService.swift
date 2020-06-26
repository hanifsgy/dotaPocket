//
//  NetworkService.swift
//  DotaPocket
//
//  Created by M Hanif Sugiyanto on 24/06/20.
//  Copyright © 2020 M Hanif Sugiyanto. All rights reserved.
//

import Foundation
import Moya
import RxSwift

public struct NetworkService {
  public static let instance = NetworkService()
  let provider: MoyaProvider<MultiTarget>
  
  init() {
    self.provider = MoyaProvider<MultiTarget>(requestClosure: { (endpoint, closure) in
      var request = try! endpoint.urlRequest()
      request.httpShouldHandleCookies = false
      closure(.success(request))
    })
  }
}

extension NetworkService {
  public func request<T: TargetType, C: Decodable>(_ t: T, c: C.Type) -> Single<C> {
    return self.provider.rx.request(MultiTarget(t))
      .subscribeOn(ConcurrentDispatchQueueScheduler(qos: .background))
      .filterSuccessfulStatusAndRedirectCodes()
      .map(c.self)
      .catchError { (error) in
        guard let errorResponse = error as? MoyaError else {
          return Single.error(NetworkError.IncorrectDataReturned)
        }
        switch errorResponse {
        case .underlying(let error, _):
          return Single.error(error)
        case .parameterEncoding(let error):
          return Single.error(error)
        default:
          return Single.error(NetworkError.IncorrectDataReturned)
        }
    }
  }
}

