//
//  CurrencyConverterView.swift
//  CurrencyConverter
//
//  Created by Hugo Rodrigues on 27/02/25.
//

import SwiftUI

struct CurrencyConverterView: View {
    @StateObject private var viewModel = CurrencyViewModel()

    var body: some View {
        VStack(spacing: 20) {
            Text("Conversor de Moedas")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            TextField("Valor", text: $viewModel.amount)
                .padding()
                .keyboardType(.decimalPad)
                .background(Color(.systemGray6))
                .overlay(
                    RoundedRectangle(cornerRadius: 10) //: Forma da Borda
                        .stroke(Color.black, lineWidth: 3) //:Cor e expessura da Borda
                )
                .cornerRadius(10)
                .padding(.horizontal)
            
            //: Selecionar Moeda
            HStack {
                Picker("De", selection: $viewModel.baseCurrency) {
                    ForEach(["USD", "EUR", "BRL"], id: \.self) { currency in
                        Text(currency)
                    }
                }
                .pickerStyle(MenuPickerStyle())
                .frame(width: 130, height: 40)
                .overlay(
                    RoundedRectangle(cornerRadius: 10) //: Forma da Borda
                        .stroke(Color.black, lineWidth: 3) //:Cor e expessura da Borda
                )
                .cornerRadius(10)
                .padding(.horizontal)
                
                Text("➡️") //: tenho que olhar melhor
                
                Picker("Para", selection: $viewModel.targetCurrency) {
                    ForEach(["USD", "EUR", "BRL"], id: \.self) { currency in
                        Text(currency)
                    }
                }
                .pickerStyle(MenuPickerStyle())
                .pickerStyle(MenuPickerStyle())
                .frame(width: 130, height: 40)
                .overlay(
                    RoundedRectangle(cornerRadius: 10) //: Forma da Borda
                        .stroke(Color.black, lineWidth: 3) //:Cor e expessura da Borda
                )
                .cornerRadius(10)
                .padding(.horizontal)
                
            }
            
            Text("Resultado: \(viewModel.convertedAmount) \(viewModel.targetCurrency)")
                .padding()
                .bold()
            
            //: Button Converter
            Button("Converter") {
                viewModel.fetchConversionRate()
                viewModel.convert()
            }
            .padding(40)
            .background(Circle().fill(.blue))
            .foregroundColor(.white)
            
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    CurrencyConverterView()
}
