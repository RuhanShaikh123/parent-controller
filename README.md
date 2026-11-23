# 🛡️ ParentGuard
### Real-Time Parental Monitoring & Remote Device Management Platform

**Flutter · Dart · Firebase · Riverpod · WebSockets · WebRTC · Native Android (Java)**

ParentGuard is a real-time parental monitoring and device management platform built using Flutter, Firebase, and native Android technologies.

The platform connects parent and child devices through secure pairing and real-time communication, enabling parents to monitor device availability, track location, access supported monitoring features, and manage connected devices.

ParentGuard has been developed as a complete application rather than a UI prototype. The Android release build has been tested, and the project is being prepared for distribution through the Google Play Store.

<details>
<summary><strong>📥 Download ParentGuard for Android</strong></summary>

**Latest available release: v1.0.5**

[⬇️ Download ParentGuard APK](https://github.com/RuhanShaikh123/parent-controller/releases/download/v1.0.5/app-release.apk)

[View All Releases](https://github.com/RuhanShaikh123/parent-controller/releases)

</details>

---

## 📌 Project & Source Code Availability

ParentGuard is a privately developed software product.

This GitHub repository serves as a **public product showcase and technical portfolio**, not as an open-source distribution of the complete application.

The complete source code, internal implementation, backend components, and certain configuration files are intentionally maintained privately to protect the application's intellectual property and product infrastructure.

Interested recruiters, developers, and users can download and explore the actual Android application using the APK provided above.

The repository provides an overview of the product, its technical stack, architecture, engineering approach, and implemented capabilities.

---

# 🚀 Core Product Capabilities

## 1. Real-Time Device Monitoring
- Live child device online/offline status.
- Real-time device connectivity synchronization.
- Device information and monitoring dashboard.
- Firebase-based real-time updates.
- Background communication support.

## 2. Secure Device Pairing
- Unique device pairing codes.
- QR-code-based pairing workflow.
- Firebase-backed device association.
- Real-time pairing status synchronization.
- Parent and child device connection management.

## 3. Live Location Tracking
- Real-time device location tracking.
- Location updates synchronized with Firebase.
- Address resolution through geocoding.
- Location information accessible through the parent application.

## 4. Live Audio Communication
- Remote microphone audio streaming.
- WebSocket-based real-time communication.
- Low-latency audio transmission.
- Background audio service support.
- Dedicated backend communication infrastructure.

## 5. Android Permission Monitoring

Monitoring of important Android permissions and system-level access:

- Camera permission
- Microphone permission
- Location permission
- Accessibility service
- Notification access
- Usage access
- Overlay permission
- Battery optimization status

## 6. Remote Device Management
- Connected device information.
- Device status monitoring.
- Remote communication architecture.
- Device management modules.
- Support for additional monitoring capabilities.

---

# 🏗️ Technical Architecture & Engineering

ParentGuard is developed using a modular, Feature-First architecture with separation of concerns.

### Application Architecture

The Flutter application is organized around independent feature modules.

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

### Feature-Level Architecture

Each feature maintains its own responsibilities and application logic.

```text
feature_name/
│
├── data/
│   └── datasource/
│
├── repository/
│   ├── repository.dart
│   └── repository_provider.dart
│
├── providers/
│
├── presentation/
│   ├── screens/
│   └── widgets/
│
└── service/
```

### State Management & Application Design

- Riverpod for reactive state management.
- StateNotifierProvider for state-driven workflows.
- Repository Pattern for data abstraction.
- Dependency Injection.
- GoRouter for application navigation.
- Feature-based modular organization.
- Separation of presentation, business logic, and data responsibilities.

---

# 🔥 Backend & Real-Time Infrastructure

ParentGuard integrates Firebase services with dedicated real-time communication infrastructure.

### Firebase Integration

| Service | Responsibility |
|---|---|
| Firebase Authentication | User authentication |
| Cloud Firestore | Application data management |
| Firebase Realtime Database | Real-time synchronization |
| Firebase Storage | File and media storage |

### WebSocket Infrastructure

A dedicated Node.js WebSocket backend supports real-time audio communication between connected devices.

**Backend deployment:** Render

The architecture supports persistent communication between the Flutter application and the backend service.

### Android Native Integration

The project combines Flutter with native Android development to support platform-specific functionality.

- Java-based Android implementation.
- Android foreground services.
- Background execution management.
- Runtime permission handling.
- Accessibility service integration.
- Native device functionality through platform-level APIs.

---

# 🧰 Technology Stack

| Category | Technologies |
|---|---|
| Mobile Framework | Flutter |
| Programming Languages | Dart, Java, JavaScript |
| State Management | Riverpod |
| Navigation | GoRouter |
| Authentication | Firebase Authentication |
| Database | Cloud Firestore, Firebase RTDB |
| Backend | Node.js |
| Real-Time Communication | WebSockets |
| Media Communication | WebRTC |
| Background Services | Android Foreground Services |
| Location | Geolocator, Geocoding |
| Architecture | Feature-First, Repository Pattern |
| Development | Android Studio, Git, GitHub |
| Backend Hosting | Render |

---

# 🔄 Application Workflow

The platform follows a parent-child device communication workflow.

```text
       PARENT APPLICATION
               |
               |
        User Authentication
               |
               |
         Device Pairing
               |
               |
        Firebase Backend
               |
               |
       CHILD APPLICATION
               |
               |
       Device Permissions
               |
               |
      Background Services
               |
               |
       Real-Time Updates
               |
               |
       Parent Dashboard
               |
               |
       Monitoring Features
```

The architecture combines Firebase synchronization, application services, and dedicated real-time communication infrastructure.

---

# 📦 Release & Distribution

| Information | Details |
|---|---|
| Product | ParentGuard |
| Repository | parent-controller |
| Platform | Android |
| Available Release | v1.0.5 |
| Distribution | GitHub Releases |
| Testing | Release build tested |
| Google Play | Distribution planned |

### Download

[Download ParentGuard Android APK – v1.0.5](https://github.com/RuhanShaikh123/parent-controller/releases/download/v1.0.5/app-release.apk)

[Browse Release History](https://github.com/RuhanShaikh123/parent-controller/releases)

### Installation

1. Download the APK on your Android device.
2. Open the downloaded APK.
3. Allow installation from the relevant source if Android requests permission.
4. Complete the installation.
5. Launch ParentGuard and follow the application setup.

---

# 🔐 Security, Privacy & Permissions

ParentGuard uses authentication, device pairing, and permission-based Android functionality.

Monitoring features involving location, microphone, camera, and other device capabilities require appropriate permissions and informed consent from the device user.

The application is designed for authorized parental monitoring and responsible device management.

---

# 🛣️ Product Roadmap

Ongoing development areas include:

- Advanced WebRTC communication.
- Live camera streaming improvements.
- Screen-sharing capabilities.
- Enhanced device management.
- Application blocking.
- Usage statistics and activity monitoring.
- Background service reliability.
- Performance and security improvements.
- Google Play Store distribution.

---

# 👨‍💻 Developer & Project Ownership

**Ruhan Shaikh**

Flutter Developer | Mobile Application Developer

Specializing in Flutter, Dart, Firebase, Riverpod, REST APIs, real-time communication, and Android native development.

- **GitHub:** [RuhanShaikh123](https://github.com/RuhanShaikh123)
- **LinkedIn:** [Ruhan Shaikh](https://www.linkedin.com/in/ruhanshaikh-dev/)
- **Email:** shaikhruhan555@gmail.com

---

*ParentGuard represents end-to-end mobile application development, integrating Flutter, Firebase, native Android functionality, backend services, and real-time communication into a single product.*

**Built with Flutter. Engineered for real-time device communication.**
