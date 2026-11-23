# 🛡️ ParentGuard – Parental Control Application

**Flutter | Dart | Firebase | Riverpod | WebSockets | Android Native**

ParentGuard is a Flutter-based parental control application designed to help parents securely connect with and monitor their children's devices through real-time communication.

The project demonstrates my experience building cross-platform mobile applications, integrating Firebase services, implementing real-time communication, managing application state, and working with Android platform-level functionality.

> **📌 Important – Public Repository Notice**
>
> This repository is a **public showcase/demo version** of ParentGuard. It does not contain the complete application source code.
>
> Some implementation files, advanced features, backend components, and internal configurations have intentionally not been published. The repository provides selected code and project structure to demonstrate the technologies, architecture, and development approach used in the project.
>
> The complete application is larger than the publicly available code in this repository.

## ✨ Project Overview

ParentGuard consists of a parent application and a child-side application that communicate through Firebase and real-time communication services.

The system is designed around device pairing, real-time status synchronization, location tracking, and remote monitoring capabilities.

### Key Features

- **Authentication:** Firebase Authentication with persistent login sessions.
- **Parent Dashboard:** Child device status, device information, and dashboard statistics.
- **Device Pairing:** Secure pairing using pairing codes and QR codes.
- **Live Location:** Real-time location tracking and address resolution.
- **Live Audio:** Low-latency audio communication using WebSockets.
- **Permission Monitoring:** Monitoring important Android permissions and access settings.
- **Device Communication:** Real-time synchronization between connected devices.

## 🏗️ Architecture

The Flutter application follows a Feature-First architecture with separation of responsibilities.

```text
lib/
│
├── apk/
│
├── features/
│   ├── auth/
│   ├── onboarding/
│   ├── parent/
│   ├── child/
│   ├── pairing/
│   ├── location/
│   ├── live_audio/
│   ├── live_camera/
│   └── settings/
│
└── main.dart
```

### Feature Structure

Individual features are organized into separate layers:

```text
feature_name/
│
├── data/
├── repository/
├── providers/
├── presentation/
│   ├── screens/
│   └── widgets/
└── service/
```

This structure helps maintain modularity, separation of concerns, and scalability.

## 🧠 State Management

- Riverpod
- StateNotifierProvider
- Repository Pattern
- Dependency Injection
- Reactive UI Updates

## 🔥 Technology Stack

| Category | Technologies |
|---|---|
| Framework | Flutter, Dart |
| Backend | Firebase |
| Authentication | Firebase Authentication |
| Database | Cloud Firestore |
| Storage | Firebase Storage |
| State Management | Riverpod |
| Navigation | GoRouter |
| Real-Time Communication | WebSockets |
| Location | Geolocator, Geocoding |
| Android Development | Java, Native Android APIs |
| Development Tools | Android Studio, Git, GitHub |

## 📱 Application Modules

The project includes development work across multiple modules:

- Parent application
- Child application
- Device pairing and synchronization
- Location monitoring
- Live audio communication
- Permission monitoring
- Remote device communication

Some modules and their complete implementations are not included in this public repository.

## 🚧 Development Status

ParentGuard is an ongoing project. Development includes expanding monitoring capabilities, improving background operations, strengthening device communication, and refining the overall application experience.

Future development areas include:

- WebRTC-based communication
- Live camera streaming
- Screen sharing
- Device and application management
- Usage statistics
- Remote device commands
- Background synchronization

## ⚙️ Running the Public Sample

The repository contains selected project files for demonstration purposes.

```bash
git clone https://github.com/RuhanShaikh123/parent-controller.git

cd parent-controller

flutter pub get

flutter run
```

**Note:** The public repository may not run as a complete application without the unpublished source files, Firebase configuration, backend services, and other required components.

## 🔐 Privacy and Permissions

ParentGuard is intended for authorized parental monitoring.

Features involving location, microphone, camera, and other device permissions require appropriate authorization and informed consent from the device user.

## 👨‍💻 Developer

**Ruhan Shaikh**

Flutter Developer | Dart | Firebase | Riverpod | REST APIs

- GitHub: https://github.com/RuhanShaikh123
- LinkedIn: https://www.linkedin.com/in/ruhanshaikh-dev/
- Email: shaikhruhan555@gmail.com

---

*This repository represents selected work from a larger application developed as part of my mobile application development experience.*
