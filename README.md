# Flutter Device Features Mini Project

A comprehensive Flutter application demonstrating progressive native hardware and device feature integration using **Clean Architecture**, **flutter_bloc**, and **go_router**.

---

## 📱 Features & Functional Requirements

### Phase 1 — Device Info: Show Device Model & OS Version
- Retrieves and displays basic hardware and software details at runtime.
- Centered card text displaying device model name and OS version.
- **Package**: `device_info_plus`

### Phase 2 — Media Access: Image Picker Gallery
- In-app gallery displaying picked images inside a `ListView`.
- "Pick Image" button below the `ListView` allowing multi-image selection from device gallery.
- Selected images render seamlessly in the list.
- **Package**: `image_picker`

### Phase 3 — Google Maps & GPS: Display Map with Marker
- Page with title **Google Map** in the `AppBar`.
- Full-screen interactive Google Map.
- Red marker placed on Cairo Governorate, Egypt (Lat: 30.0444, Lng: 31.2357).
- **Package**: `google_maps_flutter`

### Phase 4 — Biometric Authentication: Fingerprint Profile Access (Bonus)
- Secure profile access via top-right profile icon in the app bar.
- Triggers fingerprint / biometric authentication prompt prior to navigation.
- Profile page displays user profile image, full name, and email upon successful authentication.
- **Package**: `local_auth`

### Phase 5 — Audio: Record & Playback Voice (Bonus)
- Dedicated audio recorder screen to capture voice recordings.
- "Record Audio" toggle button to start and stop recording.
- "Play Audio" button appears once a recording exists, allowing audio playback.
- **Packages**: `record` & `audioplayers`

---

## 🔒 Permissions Used

### Android (`android/app/src/main/AndroidManifest.xml`)
| Permission | Description / Purpose |
|---|---|
| `android.permission.INTERNET` | Required for Google Maps tile loading & online resources. |
| `android.permission.ACCESS_FINE_LOCATION` | Required by Google Maps for location features. |
| `android.permission.ACCESS_COARSE_LOCATION` | Required by Google Maps for general location detection. |
| `android.permission.RECORD_AUDIO` | Required by `record` package to record voice audio. |
| `android.permission.USE_BIOMETRIC` | Required by `local_auth` for biometric fingerprint authentication. |
| `android.permission.USE_FINGERPRINT` | Legacy fingerprint permission fallback for older Android devices. |
| `android.permission.READ_MEDIA_IMAGES` | Required on Android 13+ (API 33+) to read media images from gallery. |
| `android.permission.READ_EXTERNAL_STORAGE` | Required on Android 12 and below to access photos. |

### iOS (`ios/Runner/Info.plist`)
| Usage Key | Description / Purpose |
|---|---|
| `NSPhotoLibraryUsageDescription` | Access photo gallery to select multiple images for the gallery screen. |
| `NSCameraUsageDescription` | Camera access usage description for media picker fallback. |
| `NSMicrophoneUsageDescription` | Access microphone to record voice messages in audio recorder screen. |
| `NSFaceIDUsageDescription` | Use Face ID / Touch ID for biometric verification prior to profile access. |
| `NSLocationWhenInUseUsageDescription` | Location access description for Google Maps location display. |

---

## 🏗️ Architecture & Project Structure

The project strictly follows **Clean Architecture** principles categorized by feature modules:

```text
lib/
├── core/
│   ├── constants/
│   │   └── app_constants.dart
│   ├── router/
│   │   └── app_router.dart           # go_router configuration
│   └── theme/
│       └── app_theme.dart            # Material 3 theme definition
├── features/
│   ├── audio_recorder/
│   │   ├── data/
│   │   ├── domain/
│   │   └── presentation/
│   │       ├── bloc/
│   │       ├── screens/
│   │       └── widgets/
│   ├── auth_profile/
│   │   ├── data/
│   │   ├── domain/
│   │   └── presentation/
│   │       ├── bloc/
│   │       ├── screens/
│   │       └── widgets/
│   ├── device_info/
│   │   ├── data/
│   │   ├── domain/
│   │   └── presentation/
│   │       ├── bloc/
│   │       ├── screens/
│   │       └── widgets/
│   ├── google_maps/
│   │   └── presentation/
│   │       ├── bloc/
│   │       ├── screens/
│   │       └── widgets/
│   ├── media_gallery/
│   │   ├── data/
│   │   ├── domain/
│   │   └── presentation/
│   │       ├── bloc/
│   │       ├── screens/
│   │       └── widgets/
│   └── navigation/
│       └── presentation/
│           ├── screens/
│           └── widgets/
└── main.dart                          # App entry point & Bloc providers
```

---

## 🚀 Getting Started

1. **Clone Repository**:
   ```bash
   git clone <repository-url>
   cd device_features_mini_project_final
   ```

2. **Install Dependencies**:
   ```bash
   flutter pub get
   ```

3. **Configure Google Maps API Key**:
   - For Android: Set your API key in `android/app/src/main/AndroidManifest.xml` under `<meta-data android:name="com.google.android.geo.API_KEY" .../>`.

4. **Format & Analyze**:
   ```bash
   dart format .
   flutter analyze
   ```

5. **Run Application**:
   ```bash
   flutter run
   ```
