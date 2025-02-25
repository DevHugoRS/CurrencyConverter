//
//  CurrencyView.swift
//  CurrencyConverter
//
//  Created by Hugo Rodrigues on 25/02/25.
//

import SwiftUI

struct CurrencyView: View {
    @State private var inputAmount: String = ""
    @State private var fromCurrency: String = "USD"
    @State private var toCurrency: String = "EUR"
    
    let currencies = ["USD", "EUR", "BRL"]
    let exchangeRates: [String: Double] = [
        "USD_EUR": 0.92,
        "USD_BRL": 5.0,
        "EUR_USD": 1.09,
        "EUR_BRL": 5.45,
        "BRL_USD": 0.20,
        "BRL_EUR": 0.18
    ]
    
    var convertedAmount: Double {
        guard let amount = Double(inputAmount), amount > 0 else { return 0.0 }
        let key = "\(fromCurrency)_\(toCurrency)"
        return (exchangeRates[key] ?? 1.0) * amount
    }
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Conversor de Moedas")
                .font(.largeTitle)
                .bold()
                .padding()
            
            TextField("Digite o valor", text: $inputAmount)
                .keyboardType(.decimalPad)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            HStack {
                Picker("De", selection: $fromCurrency) {
                    ForEach(currencies, id: \..self) { currency in
                        Text(currency)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                
                Text("→")
                    .font(.title)
                    .padding()
                
                Picker("Para", selection: $toCurrency) {
                    ForEach(currencies, id: \..self) { currency in
                        Text(currency)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
            }
            
            Text("Valor Convertido: \(convertedAmount, specifier: "%.2f") \(toCurrency)")
                .font(.title2)
                .bold()
                .padding()
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    CurrencyView()
}
