//
//  CurrencyService.swift
//  CurrencyConverter
//
//  Created by Hugo Rodrigues on 28/02/25.
//

import Foundation

class CurrencyService {
    private let apiKey = "ac7f4a0c880c4196d54c2182"
    private let baseURL = "https://v6.exchangerate-api.com/v6/"

    func fetchRates(for baseCurrency: String, completion: @escaping (Result<CurrencyRate, Error>) -> Void) {
        guard let url = URL(string: "\(baseURL)\(apiKey)/latest/\(baseCurrency)") else {
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else {
                print("Nenhum dado recebido")
                completion(.failure(NSError(domain: "InvalidData", code: -1, userInfo: nil)))
                return
            }
            
            // Imprimindo JSON para depuração
            if let jsonString = String(data: data, encoding: .utf8) {
                print("Resposta da API: \(jsonString)")
            }

            do {
                let result = try JSONDecoder().decode(CurrencyRate.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(result))
                }
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
