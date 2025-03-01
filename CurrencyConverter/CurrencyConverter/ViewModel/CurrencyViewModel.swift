//
//  CurrencyViewModel.swift
//  CurrencyConverter
//
//  Created by Hugo Rodrigues on 28/02/25.
//

import Foundation

class CurrencyViewModel: ObservableObject {
    private let currencyService = CurrencyService()
    
    @Published var amount: String = ""
    @Published var baseCurrency: String = "USD"
    @Published var targetCurrency: String = "EUR"
    @Published var convertedAmount: String = ""
    @Published var exchangeRate: Double = 0.0
    
    func fetchConversionRate() {
        currencyService.fetchRates(for: baseCurrency) { result in
            switch result {
            case .success(let currencyRate):
                if let rate = currencyRate.conversion_rates[self.targetCurrency] {
                    self.exchangeRate = rate
                } else {
                    self.exchangeRate = 0.0
                }
            case .failure(let error):
                print("Erro ao buscar taxa de câmbio: \(error.localizedDescription)")
            }
        }
    }
    
    func convert() {
        guard let amountValue = Double(amount) else {
            convertedAmount = "Valor inválido"
            return
        }
        let result = amountValue * exchangeRate
        convertedAmount = String(format: "%.2f", result)
    }
}
