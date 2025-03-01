//
//  CurrencyRate.swift
//  CurrencyConverter
//
//  Created by Hugo Rodrigues on 28/02/25.
//

import Foundation

struct CurrencyRate: Codable {
    let conversion_rates: [String: Double]
}
