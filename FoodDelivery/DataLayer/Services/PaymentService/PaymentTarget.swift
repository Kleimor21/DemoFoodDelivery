//
//  PaymentTarget.swift
//  FoodDelivery
//
//  Created by MacBook on 20/07/2022.
//

import Moya

enum PaymentTarget {
    case payment
}

extension PaymentTarget: TargetType {
    var baseURL: URL {
        return URL(string: "https://us-central1-fooddelivery-2d9a9.cloudfunctions.net")!
    }
    
    var path: String {
        switch self {
        case .payment:
            return "/payment"
        }
    }
    
    var method: Method {
        switch self {
        case .payment:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .payment:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        [:]
    }
}
