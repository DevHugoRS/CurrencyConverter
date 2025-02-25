//
//  ContentView.swift
//  CurrencyConverter
//
//  Created by Hugo Rodrigues on 25/02/25.
//

import SwiftUI

// Modelo para representar as moedas
enum Currency: String, CaseIterable {
    case usd = "USD"
    case eur = "EUR"
    case brl = "BRL"
}

// ViewModel responsável pela conversão
class CurrencyConverterViewModel: ObservableObject {
    @Published var inputAmount: String = ""
    @Published var selectedCurrency: Currency = .usd
    
    private let conversionRates: [Currency: Double] = [
        .brl: 1.0,   // Base
        .eur: 0.16,  // 1 BRL -> 0.16 EUR
        .usd: 0.19   // 1 BRL -> 0.19 USD
    ]
    
    var convertedAmount: Double {
        let amount = Double(inputAmount) ?? 0
        let rate = conversionRates[selectedCurrency] ?? 1.0
        return amount * rate
    }
}

struct ContentView: View {
    
    @StateObject private var viewModel = CurrencyConverterViewModel()
    
    var body: some View {
        VStack(spacing: 20) {
            TextField("Digite o valor em BRL", text:  $viewModel.inputAmount)
                .keyboardType(.decimalPad)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Picker("Moeda", selection: $viewModel.selectedCurrency) {
                ForEach(Currency.allCases, id: \.self) { currency in
                    Text(currency.rawValue)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            
            Text("Valor convertido: \(viewModel.convertedAmount, specifier: "%.2f") \(viewModel.selectedCurrency.rawValue)")
                .font(.title2)
                .bold()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
