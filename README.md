# PatresInternship

📱 Мобильное iOS-приложение, разработанное в рамках проекта **Patres Internship**. Цель — продемонстрировать архитектурный подход, работу с API, CoreData и современными инструментами разработки под iOS.

---

## 🧩 Архитектура проекта

Проект построен с использованием **MVVM** (Model-View-ViewModel) архитектуры.

- `Model` — содержит бизнес-логику и структуры данных (`PostModel`, `UserModel` и т.д.)
- `ViewModel` — управляет состоянием данных, обрабатывает бизнес-логику, взаимодействует с API и CoreData
- `ViewController` — отвечает за отображение интерфейса, использует данные из ViewModel
- `CoreDataManager` — отвечает за сохранение и загрузку данных в оффлайн-режиме
- `NetworkManager` — отдельный слой для работы с сетью (API, Alamofire)

---

## 📸 Скриншоты

<img width="231" height="500" alt="Simulator Screenshot - iPhone 15 Pro - 2025-07-11 at 18 45 36" src="https://github.com/user-attachments/assets/a60eb5ec-6678-4385-97a7-8b269c71e919" />

---

## ⚙️ Использованные технологии

- Swift + UIKit
- MVVM архитектура
- CoreData (оффлайн-режим)
- Alamofire (работа с сетью)
- JSONPlaceholder API (в качестве мок-сервиса)
- Для картинок Picsum
- Auto Layout
- Pull to Refresh
- Кеширование данных
- NavigationController

---

## 🛠 Инструкция по сборке проекта

1. Клонируйте репозиторий:
   ```bash
   git clone git@github.com:rauanium/PatresInternship.git
2. Откройте .xcodeproj файл в Xcode:
   cd PatresInternship
   open PatresInternship.xcodeproj
3. Убедитесь, что выбран симулятор или устройство.
4. Нажмите Cmd + R для запуска приложения.

