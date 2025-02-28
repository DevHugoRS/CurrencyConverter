//
//  ContentView.swift
//  CurrencyConverter
//
//  Created by Hugo Rodrigues on 25/02/25.
//

import SwiftUI
import Combine

// Modelo para representar as moedas
enum Currency: String, CaseIterable {
    case usd = "USD"
    case eur = "EUR"
    case brl = "BRL"
}

// Serviço para buscar taxas de câmbio em tempo real
class CurrencyService {
    func fetchExchangeRates(completion: @escaping ([Currency: Double]?) -> Void) {
        let urlString = "https://v6.exchangerate-api.com/v6/ac7f4a0c880c4196d54c2182/latest/USD"
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            
            do {
                let result = try JSONDecoder().decode(ExchangeRateResponse.self, from: data)
                let rates: [Currency: Double] = [
                    .brl: 1.0,
                    .usd: result.conversionRates["USD"] ?? 0.19,
                    .eur: result.conversionRates["EUR"] ?? 0.16
                ]
                DispatchQueue.main.async {
                    completion(rates)
                }
            } catch {
                completion(nil)
            }
        }.resume()
    }
}

// Modelo para resposta da API
struct ExchangeRateResponse: Decodable {
    let conversionRates: [String: Double]
}

// ViewModel responsável pela conversão
class CurrencyConverterViewModel: ObservableObject {
    @Published var inputAmount: String = ""
    @Published var selectedCurrency: Currency = .brl
    @Published var conversionRates: [Currency: Double] = [
        .brl: 1.0,
        .usd: 0.19,
        .eur: 0.16
    ]
    
    private var currencyService = CurrencyService()
    
    var convertedAmount: Double {
        let amount = Double(inputAmount) ?? 0
        let rate = conversionRates[selectedCurrency] ?? 1.0
        return amount * rate
    }
    
    func fetchRates() {
        currencyService.fetchExchangeRates { [weak self] rates in
            if let rates = rates {
                self?.conversionRates = rates
            }
        }
    }
}

// Interface
struct ContentView: View {
    @StateObject private var viewModel = CurrencyConverterViewModel()
    
    var body: some View {
        VStack(spacing: 20) {
            TextField("Digite o valor em BRL", text: $viewModel.inputAmount)
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
            
            Button("Atualizar Taxas") {
                viewModel.fetchRates()
            }
            .padding()
        }
        .padding()
        .onAppear {
            viewModel.fetchRates()
        }
    }
}

#Preview {
    ContentView()
}
