//
//  Utils.swift
//  ClearScoreIOSTechnicalTask
//
//  Created by YORK CHAN on 12/3/2022.
//

import Foundation

func getBaseUrlString() -> String? {
    guard let urlString = Bundle.main.object(forInfoDictionaryKey: "API_BASE_URL") as? String else {
        return nil
    }
    return urlString
}
