//
//  CurrencyConverterView.swift
//  CurrencyConverter
//
//  Created by Hugo Rodrigues on 27/02/25.
//

import SwiftUI

struct CurrencyConverterView: View {
    
    @State private var amount: String = ""
    @State private var baseCurrent: String = "🇧🇷BRL"
    @State private var targetCurrency: String = "🇪🇺EUR"
    
    let currencies = ["🇧🇷BRL", "🇺🇸USD", "🇪🇺EUR", "🇬🇧GBP", "🇯🇵JPY", "🇨🇦CAD"]

    var body: some View {
        VStack(spacing: 20) {
            Text("Conversor de Moedas")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            TextField("Valor", text: $amount)
                .padding()
                .keyboardType(.decimalPad)
                .background(Color(.systemGray6))
                .overlay(
                    RoundedRectangle(cornerRadius: 40) //: Forma da Borda
                        .stroke(Color.black, lineWidth: 2) //:Cor e expessura da Borda
                )
                .cornerRadius(40)
                .padding(.horizontal)
            
            //: Selecionar Moeda
            HStack {
                Picker("De", selection: $baseCurrent) {
                    ForEach(currencies, id: \.self) { currency in
                        Text(currency)
                    }
                }
                .pickerStyle(MenuPickerStyle())
                
                Text("➡️") //: tenho que olhar melhor
                
                Picker("Para", selection: $targetCurrency) {
                    ForEach(currencies, id: \.self) { currency in
                        Text(currency)
                    }
                }
                .pickerStyle(MenuPickerStyle())
                
            }
            
            //: Button Converter
            Button("Converter") {
                print("Botão pressionado")
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(40)
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    CurrencyConverterView()
}
