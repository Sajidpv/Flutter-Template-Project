# 📱 Flutter-bloc-with-dio Template

A production-ready Flutter app template using **BLoC** for state management and **Dio** for networking.

---

## 🚀 Features

- ✅ Flutter 3.29 compatible
- ✅ Clean and scalable architecture
- ✅ BLoC/Cubit for reactive state management
- ✅ Dio for robust HTTP handling
- ✅ Structured folder organization
- ✅ Logging and error handling
- ✅ Utility files added for ease
- ✅ Easily extendable for real projects

---

## 📂 Project Structure

```
lib/
├── cores/             # Global config files and widgets
├── data/              # Dio API files and Network files and Utils
├── features/          # App features such as auth, home, user etc.. 
├── routes/            # Named routes and route configs
├── services/          # Bloc observer and bloc provider, DI, firebase services and websocket
├── utils/             # Many more utility functions and theming
├── main.dart          # App entry point
```

---

## 🛠️ Getting Started

1. **Clone the repository**

```bash
git clone https://github.com/sajidpv/flutter-bloc-with-dio.git
cd flutter-bloc-with-dio
```

2. **Install dependencies**

```bash
flutter pub get
```

3. **Run the app**

```bash
flutter run
```

---

## 📦 Dependencies

| Package              | Description                              |
|----------------------|------------------------------------------|
| `flutter_bloc`       | State management                         |
| `dio`                | HTTP requests and interceptors           |
| `equatable`          | Value comparison for state management    |
| `get_it`             | Dependency injection                     |

---



## 📄 Example: Dio + BLoC Integration

```dart
final response = await dio.get('/users');
```

With built-in error handling via custom exceptions and interceptors.

---

## ✅ Recommended Tools

- [Flutter DevTools](https://docs.flutter.dev/tools/devtools/overview)
- [Postman](https://www.postman.com/) or [Hoppscotch](https://hoppscotch.io/)
- [BLoC Extension for VS Code](https://marketplace.visualstudio.com/items?itemName=FelixAngelov.bloc)

---

## 📜 License

This project is licensed under the [MIT License](LICENSE).

---

## 🙌 Contribution

Feel free to fork and contribute! PRs are welcome to enhance this starter template.

---

## 📬 Contact

For questions or feedback, contact [sajidpv7@gmail.com].
