# Currency Converter 💱
 
🚀 A modern and efficient currency converter built with SwiftUI and MVVM architecture, using the ExchangeRate-API to provide real-time exchange rates.

📌 Features

✅ Real-time currency conversion between different currencies.
✅ Automatic exchange rate fetching using the ExchangeRate API.
✅ Intuitive and responsive UI built with SwiftUI.

🛠️ Technologies Used
    •    SwiftUI – To create a modern and smooth user interface.
    •    MVVM (Model-View-ViewModel) – For a scalable and clean architecture.
    •    URLSession – To perform HTTP requests to the exchange rate API.

🔧 How It Works?

1️⃣ The user selects the base currency and target currency.
2️⃣ Enters the amount to be converted.
3️⃣ The app automatically fetches the latest exchange rate.
4️⃣ The converted amount is displayed instantly.

📂 Project Structure
📂 CurrencyConverterApp
 ├── 📁 Model
 │   ├── CurrencyRate.swift  # Model to represent API data
 ├── 📁 ViewModel
 │   ├── CurrencyViewModel.swift  # Conversion logic and API integration
 ├── 📁 Service
 │   ├── CurrencyService.swift  # Class responsible for fetching exchange rates
 ├── 📁 View
 │   ├── ContentView.swift  # Main app interface
 
 📜 Melhorias Futuras

📜 Future Improvements

🚀 Support for more exchange rate APIs.
🚀 Detailed conversion history.
🚀 Cryptocurrency support.
🚀 Integration with exchange rate charts.
