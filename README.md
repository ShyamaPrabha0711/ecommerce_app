#  E-Commerce Flutter App

A modern e-commerce mobile application built using Flutter, featuring a clean UI, state management with Provider,API integration

##  Flutter Version

```bash
Flutter: 3.38.3
Dart: 3.10.1
```

##  Steps to Run the Project

1. **Clone the repository**

```bash
git clone https://github.com/ShyamaPrabha0711/ecommerce_app.git
cd <project-folder>
```

2. **Install dependencies**

```bash
flutter pub get
```

3. **Run the app**

```bash
flutter run
```

##  State Management

This project uses **Provider** for state management.

### Why Provider?

* Lightweight and easy to use
* Built on top of InheritedWidget
* Efficient UI updates using `notifyListeners()`

### Usage in Project:

* `LoginProvider` → handles authentication logic
* `HomeProvider` → manages home screen data 
* `context.read()` → used for actions
* `context.watch()` / `Consumer` → used for UI updates


##  Features

*  Login functionality with API integration
*  Dynamic home screen with banners and product lists
*  Carousel banner using network imagesI
---

##  Project Structure (Simplified)

```
lib/
│
├── models/
├── providers/
├── services/
├── screens/
├── widgets/
├── utils/
```
---

##  Author
---
Developed as part of a learning/project implementation using Flutter.

---
