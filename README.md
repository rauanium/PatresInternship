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
<img src="[https://github.com/rauanium/IOS-homeworks/assets/3612493/ee1f90ce-d71f-40c6-b463-9701920195ed](https://github.com/user-attachments/assets/5bdde221-68cb-47aa-b68c-bb0dd573ee44)" width="231" height="500">

> Скриншоты находятся в папке `/screenshots/`. Добавьте свои изображения, если еще не добавлены.

---

## ⚙️ Использованные технологии

- Swift + UIKit
- MVVM архитектура
- CoreData (оффлайн-режим)
- Alamofire (работа с сетью)
- JSONPlaceholder API (в качестве мок-сервиса)
- Auto Layout + programmatic UI
- Pull to Refresh
- Кеширование данных
- NavigationController

---

## 🛠 Инструкция по сборке проекта

1. Клонируйте репозиторий:
   ```bash
   git clone git@github.com:rauanium/PatresInternship.git
