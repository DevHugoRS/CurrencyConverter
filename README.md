# Currency Converter 💱
 
🚀 Um conversor de moedas moderno e eficiente, desenvolvido em SwiftUI com arquitetura MVVM, que utiliza a ExchangeRate-API para fornecer taxas de câmbio atualizadas em tempo real.

📌 Funcionalidades

✅ Conversão em tempo real entre diferentes moedas.
✅ Busca automática da taxa de câmbio usando a API ExchangeRate.
✅ Interface intuitiva e responsiva feita com SwiftUI.

🛠️ Tecnologias Utilizadas
    •    SwiftUI – Para criar uma interface moderna e fluida.
    •    MVVM (Model-View-ViewModel) – Para organizar o código de forma escalável.
    •    URLSession – Para realizar requisições HTTP na API de câmbio.
    •    Combine – Para gerenciamento reativo dos dados (se aplicável).

🔧 Como Funciona?

1️⃣ O usuário seleciona a moeda de origem e a moeda de destino.
2️⃣ Insere o valor a ser convertido.
3️⃣ O app busca automaticamente a taxa de câmbio mais recente.
4️⃣ O valor convertido é exibido instantaneamente.

📂 Estrutura do Projeto
📂 CurrencyConverterApp
 ├── 📁 Model
 │   ├── CurrencyRate.swift  # Modelo para representar os dados da API
 ├── 📁 ViewModel
 │   ├── CurrencyViewModel.swift  # Lógica da conversão e integração com a API
 ├── 📁 Service
 │   ├── CurrencyService.swift  # Classe responsável por buscar as taxas na API
 ├── 📁 View
 │   ├── ContentView.swift  # Interface principal do app
 
 📜 Melhorias Futuras

🚀 Suporte a mais APIs de câmbio.
🚀 Histórico detalhado de conversões.
🚀 Suporte para criptomoedas.
🚀 Integração com gráficos de variação cambial.
