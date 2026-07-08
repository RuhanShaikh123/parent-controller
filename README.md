# 🛡️ Parent Controller

![Flutter](https://img.shields.io/badge/Flutter-3.x-blue?logo=flutter)
![Dart](https://img.shields.io/badge/Dart-3.x-blue?logo=dart)
![Firebase](https://img.shields.io/badge/Firebase-Backend-orange?logo=firebase)
![Riverpod](https://img.shields.io/badge/Riverpod-State%20Management-green)
![GoRouter](https://img.shields.io/badge/GoRouter-Navigation-blue)
![Platform](https://img.shields.io/badge/Platform-Android-success)
![Status](https://img.shields.io/badge/Status-Active%20Development-yellow)
![License](https://img.shields.io/badge/License-MIT-lightgrey)
A modern Flutter-based parental control application built with a scalable Feature-First architecture. The application enables parents to securely connect with a child's device, monitor its status, track live location, and control supported features through Firebase and real-time communication.

> **Status:** 🚧 Active Development

---

# ✨ Features

## 🔐 Authentication
- Login & Registration
- Firebase Authentication
- Persistent Login Session

---

## 👨‍👧 Parent Dashboard

- Child Online / Offline Status
- Child Information
- Dashboard Statistics
- Quick Action Cards
- Recent Activity
- Modern Material UI

---

## 🔗 Child Pairing

- Pair Code
- QR Code Pairing
- Secure Firebase Pairing
- Real-Time Device Connection

---

## 📍 Live Location

- Real-Time Location Tracking
- Address Resolution
- Firestore Synchronization
- Google Maps Ready

---

## 🎤 Live Microphone

- Low Latency Audio Streaming
- WebSocket Communication
- Background Audio Support
- Render Hosted WebSocket Server

---

## 🔒 Permission Monitoring

Monitor Child Permissions

- Camera
- Microphone
- Location
- Accessibility
- Notification Access
- Usage Access
- Overlay Permission
- Battery Optimization

---

## ⚙️ Settings

- Logout
- Account Information
- Device Management

---

# 🏗️ Project Architecture

The project follows a scalable **Feature-First Clean Architecture**.

```
lib
│
├── apk
│
├── features
│   │
│   ├── auth
│   ├── onboarding
│   ├── parent
│   ├── child
│   ├── pairing
│   ├── location
│   ├── live_audio
│   ├── live_camera
│   └── settings
│
└── main.dart
```

---

# 📂 Feature Structure

Every feature follows the same architecture for better scalability and maintainability.

```
feature_name
│
├── data
│     └── datasource
│
├── repository
│     ├── repository.dart
│     └── repository_provider.dart
│
├── providers
│     └── state providers
│
├── presentation
│     ├── screens
│     └── widgets
│
└── service
      └── feature_service.dart
```

Example

```
live_audio
│
├── data
│     └── live_audio_datasource.dart
│
├── repository
│     ├── live_audio_repository.dart
│     └── live_audio_repository_provider.dart
│
├── providers
│     └── live_audio_provider.dart
│
├── presentation
│     └── screens
│           └── live_audio_screen.dart
│
└── service
      └── parent_live_audio_service.dart
```

---

# 🧠 State Management

Riverpod

- Provider
- StateNotifierProvider
- Repository Pattern
- Dependency Injection
- Reactive UI Updates

---

# 🔥 Tech Stack

### Framework

- Flutter
- Dart

### Backend

- Firebase Authentication
- Cloud Firestore
- Firebase Storage

### State Management

- Riverpod

### Navigation

- GoRouter

### Real-Time Communication

- WebSocket

### Location

- Geolocator
- Geocoding

### Development

- Android Studio
- Git
- GitHub

---

# 📸 Screenshots

Coming Soon

- Login
- Register
- Parent Dashboard
- Pair Child
- Live Location
- Permission Status
- Live Microphone

---

# 🚀 Upcoming Features

## Live Monitoring

- Live Camera Streaming
- Live Screen Sharing
- WebRTC Integration

## Device Management

- Battery Percentage
- Device Information
- Installed Applications

## Controls

- App Blocking
- Website Blocking
- Screen Time Management
- Remote Commands

## Monitoring

- Notification Monitoring
- Activity Logs
- Usage Statistics

## Performance

- Foreground Services
- Background Synchronization
- Push Notifications

---

# ⚙️ Installation

```bash
git clone https://github.com/RuhanShaikh123/parent-controller.git

cd parent-controller

flutter pub get

flutter run
```

---

# 📋 Requirements

- Flutter 3.x
- Dart 3.x
- Firebase Project
- Android Studio
- Android Device

---

# ⚠️ Disclaimer

This application is intended for educational purposes and authorized parental monitoring.

Location, microphone, camera, and other monitoring features require the appropriate permissions and the informed consent of the device user.

---

# 👨‍💻 Author

**Ruhan Shaikh**

Flutter Developer

GitHub:
https://github.com/RuhanShaikh123

Email:
shaikhruhan555@gmail.com
