# 🎌 Anime Verse


## Identity
- **Nama: Jeremy Alphares Napitupulu**  
- **NIM: 231401051**  
- **Lab: 5**  


## Project Description
**Anime Verse** adalah aplikasi katalog anime berbasis **Flutter** yang menampilkan daftar anime, detail anime, dan informasi pendukung lainnya. Aplikasi dibangun dengan struktur widget Flutter yang responsif sehingga dapat berjalan pada berbagai platform seperti Android, iOS, dan Windows.
**Fitur Utama:**
- Mendukung Login dan Registrasi menggunakan **Firebase Auth** dan **Google Sign-In** untuk kemudahan akses.
- Menampilkan daftar anime
- Halaman detail anime
- Membuat list favorite anime sendiri dan menambahkan anime ke dalam list tersebut 
- UI responsif dengan Material Design
- Support multiplatform (Android / iOS / Windows)


## Tech Stack
**Frontend:**
- Flutter & Dart
- Provider (State Management)
- go_router (Navigation)
- cached_network_image (Image caching)
- flutter_svg (SVG support)
**Backend & Services:**
- Firebase Authentication (Google Sign-In)
- Cloud Firestore (Database)
- [Jikan API](https://jikan.moe/) (MyAnimeList data)


## Project Structure
```
lib/
├── config/           # Navigation Logic
│   ├── routes.dart
├── models/           # Data models
│   ├── anime.dart
├── repositories/          
│   ├── anime_repository.dart
├── provider/        # Providers
│   ├── app_state_provider.dart
│   ├── auth_provider.dart
├── screens/          # UI screens
│   ├── home_screen.dart
│   ├── detail_screen.dart
│   ├── favorite_screen.dart
│   ├── profile_screen.dart
│   ├── signin_screen.dart
│   └── signup_screen.dart
├── services/         # Business logic
│   ├── auth/ 
│       ├── auth_service.dart  # Firebase Authentication
│   └── firestore_service.dart   # Firestore operations
├── widgets/          # Reusable components
└── main.dart         # App entry point
```


## Application Demo Video
Berikut adalah demonstrasi penggunaan aplikasi Anime Verse (GDrive). Silakan klik link berikut ini untuk menonton: **[Demo Aplikasi](https://drive.google.com/drive/folders/10ontC_lLTMl-_Wo3xWHbvADpqGxwmmpz)**


##  Get Started
### 1. Clone Repository
```bash
git clone https://github.com/ALPHARESZ/anime_verse.git
cd anime_verse
```
### 2. Install Dependencies
```bash
flutter pub get
```
### 3. Create Firebase Project for Flutter
#### 1️⃣ Buat Project Firebase
1. Buka halaman Firebase Console: [Firebase Console](https://console.firebase.google.com)
2. Klik **Create Project**
3. Masukkan **Project Name** → contoh: `anime-verse-app`
4. Matikan **Google Analytics** (opsional)
5. Klik **Create Project**
#### 2️⃣ Daftarkan Aplikasi Android di Firebase
1. Masuk ke Firebase Project → klik **Add App**
2. Pilih ikon **Android**
3. Isi data berikut:
   - **Android Package Name**  
     Harus sama dengan `namespace` di:
     ```
     android/app/build.gradle.kts
     ```
   - **App nickname** (opsional)
   - **SHA-1 / SHA-256** (akan ditambahkan setelah digenerate)
4. Klik **Register App**
#### 3️⃣ Download `google-services.json`
Firebase akan menampilkan tombol download.
1. Klik **Download google-services.json**
2. Letakkan file tersebut pada folder:
   ```
   android/app/
   ```
#### 4️⃣ Generate & Tambahkan SHA-1 / SHA-256 ke Firebase
##### Jalankan perintah berikut:
```bash
cd android
./gradlew signingReport
```
##### Output akan menampilkan:
```
SHA1:  XX:XX:XX:XX:...
SHA256: XX:XX:XX:XX:...
```
##### Tambahkan ke Firebase:
Masuk ke:
```
Firebase Console → Project Settings → Android App → SHA Certificate Fingerprints
```
Tambahkan:
- SHA-1
- SHA-256

**Setelah menambah SHA, download ulang file `google-services.json`**  
dan replace file lama di:
```
android/app/
```
#### 5️⃣ Konfigurasi Firebase pada Android
##### Edit file:
```
android/settings.build.gradle.kts
```

Tambahkan pada bagian `plugins`:
```
id("com.google.gms.google-services") version("4.3.15") apply false
```
##### Edit file:
```
android/app/build.gradle.kts
```
Tambahkan pada bagian `plugins`:
```
id("com.google.gms.google-services")
```
### 4. Integrate Firebase to Flutter
Install plugin:
```bash
flutter pub add firebase_core; flutter pub add firebase_auth; flutter pub add google_sign_in; flutter pub add cloud_firestore;
```
Inisialisasi Firebase pada file `main.dart`
### 5. Run The App
#### Run App
```bash
flutter run
```