# humming_crew

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


1. Widget Tree dan Hubungan Parent-Child
Widget Tree adalah struktur hierarkis yang menggambarkan hubungan antara widget-widget dalam aplikasi Flutter. 
Setiap aplikasi Flutter adalah sebuah pohon widget dimana:
 Parent widget mengontrol properti, constraints, dan layout child widget-nya
 Child widget menerima data dan constraints dari parent-nya
 Data mengalir dari parent ke child melalui constructor parameters
 Events mengalir dari child ke parent melalui callback functions

2. Widget yang Digunakan dan Fungsinya
Widget	       		Fungsi
MaterialApp		Root widget yang menyediakan material design theme
Scaffold		Kerangka layout dasar dengan appBar dan body
AppBar			Bar atas aplikasi dengan judul
Column			Menyusun widget secara vertikal
Row				Menyusun widget secara horizontal
GridView		Menampilkan widget dalam bentuk grid
Card			Container dengan elevation/shadow untuk info cards
Material		Base material design widget untuk MenuCard
InkWell			Memberikan efek ripple ketika di-tap
Container		Widget untuk layout dan padding
Icon			Menampilkan ikon material
Text			Menampilkan teks
SizedBox		Memberikan spacing antara widget
Expanded		Mengisi ruang yang tersedia di Column/Row
Center			Memusatkan child widget

3. Fungsi MaterialApp sebagai Widget Root
MaterialApp adalah widget yang:
	Menyediakan material design theme untuk seluruh aplikasi
	Mengatur navigasi dengan Navigator
	Mengelola routes dan halaman
	Menyediakan localization dan theme data
Mengapa digunakan sebagai root:
	Mengatur title aplikasi
	Memberikan foundation material design yang konsisten
	Mengatur struktur navigasi yang proper
	Menyediakan context untuk theme dan media queries
	Required untuk menggunakan material components
	
4. Perbedaan StatelessWidget vs StatefulWidget
StatelessWidget							StatefulWidget
Immutable - tidak bisa berubah		Mutable - bisa berubah state-nya
Build sekali saja					Bisa rebuild berkali-kali
Tidak punya State object			Punya State object terpisah
Contoh: Text, Icon, Container		Contoh: TextField, Checkbox

StatelessWidget: Ketika widget tidak perlu berubah (static content)
StatefulWidget: Ketika widget perlu update (form input, animasi, data berubah)
Dalam proyek ini semua widget menggunakan StatelessWidget karena kontennya statis.

5. BuildContext
BuildContext adalah:
	Handle/location widget dalam widget tree
	Mengidentifikasi posisi widget dalam hierarki
	Media untuk mengakses inherited widgets (Theme, MediaQuery)

Penting karena:
	Mengakses theme data dan media queries
	Navigasi antara halaman
	Menampilkan dialog/snackbar
	Mendapatkan parent widget data
	
6. Hot Reload vs Hot Restart

Hot Reload								Hot Restart
Mempertahankan state aplikasi		Reset state aplikasi
Cepat (beberapa detik)				Lebih lambat (10-30 detik)
Hanya update code changes			Restart seluruh Dart VM
State tetap terjaga					State direset ke awal

Hot Reload digunakan saat develop untuk melihat perubahan cepat tanpa kehilangan state current. 
Hot Restart digunakan ketika perubahan membutuhkan reset state aplikasi.


Tugas 8

1. Perbedaan Navigator.push() vs Navigator.pushReplacement()
push(): Tambah halaman baru, bisa back ke sebelumnya
pushReplacement(): Ganti halaman saat ini, ga bisa back

Di Football Shop:

push(): Buat tombol "Add Products" (bisa back)

pushReplacement(): Buat drawer navigation

2. Pemanfaatan Hierarchy Widget
Manfaat:
	Scaffold: Layout dasar dengan app bar, drawer, dan body
	AppBar: Konsisten di semua halaman dengan judul dan warna brand
	Drawer: Navigasi yang sama di seluruh aplikasi
	Konsistensi UX dan memudahkan maintenance
	
3. Kelebihan Layout Widget untuk Form
Padding: Memberikan jarak antar elemen form untuk readability
SingleChildScrollView: Mencegah overflow ketika keyboard muncul dan form panjang
ListView: Scrollable content untuk drawer navigation

4. Penyesuaian Warna Tema
Konsistensi Brand:
	AppBar: Color.fromARGB(255, 21, 129, 218)
	Button: Warna biru konsisten
	Drawer header: Warna brand yang sama
	Card: Warna biru untuk konsistensi visual
Hasil: Aplikasi memiliki identitas visual yang kuat dan konsisten dengan brand Football Shop.

Tugas 9

1. Mengapa perlu membuat model Dart saat mengambil/mengirim data JSON?
Alasan menggunakan Dart models:

 Type Safety: Model memberikan compile-time type checking, mencegah runtime errors
 Null Safety: Handle null values dengan proper null safety features Dart
 IntelliSense: IDE support untuk autocomplete dan error detection
 Maintainability: Struktur jelas memudahkan modifikasi dan debugging
 Data Validation: Validasi built-in saat parsing JSON data
 
Konsekuensi menggunakan Map<String, dynamic> langsung:
 
 No compile-time error checking
 Runtime errors sulit dilacak
 Tidak ada IDE autocomplete
 Sulit maintain dan refactor
 Tidak ada validasi tipe data
 Rentang terhadap typo field names

2. Fungsi package http vs CookieRequest
Package http:

 Membuat HTTP requests (GET, POST, PUT, DELETE) ke Django backend
 Handle request headers dan body formatting
 Manage network communication secara general

Package CookieRequest (pbp_django_auth):

 Manage authentication state dan session persistence
 Automatically include cookies/tokens dalam requests
 Handle login, logout, dan session management
 Store credentials locally menggunakan shared preferences

Perbedaan peran:
http -> Network communication handler
CookieRequest -> Authentication state manager

3. Mengapa CookieRequest perlu dibagikan ke semua komponen?
Alasan shared CookieRequest instance:

 Consistent Authentication State: Semua komponen pakai session yang sama
 Avoid Multiple Instances: Prevent conflicting token storage
 Centralized Management: Semua auth logic terpusat di satu tempat
 Automatic Credential Inclusion: Setiap request otomatis include cookies
 State Synchronization: Perubahan login/logout sync across seluruh app
 
4. Konfigurasi Konektivitas Flutter-Django
Konfigurasi yang diperlukan:

 10.0.2.2 di ALLOWED_HOSTS: Android emulator menggunakan ini untuk akses localhost
 CORS Enabled: Allow Flutter app komunikasi dengan Django dari different origin
 SameSite/Cookie Settings: Ensure cookies work properly di cross-origin requests
 Internet Permission: Allow Flutter app akses network (AndroidManifest.xml)
 
Konsekuensi jika konfigurasi salah:

 Connection refused errors
 CORS policy violations
 Authentication failures (cookies tidak terkirim)
 App tidak bisa komunikasi dengan backend sama sekali
 
5. Mekanisme Pengiriman Data dari Input ke Tampilan
Flow lengkap:

User Input -> Data diinput di Flutter forms
Serialization -> Data di-convert ke JSON format
HTTP Request -> Request dikirim ke Django API endpoint
Django Processing -> Django proses data, simpan ke database
JSON Response -> Django return response dalam format JSON
Dart Parsing -> Flutter parse JSON ke Dart models menggunakan fromJson()
State Update -> Widget tree rebuild dengan data baru
UI Display -> Data ditampilkan di Flutter widgets

6. Mekanisme Autentikasi Lengkap
Register Flow:
 User input data di Flutter register form
 Data dikirim ke Django /auth/register/ endpoint
 Django validasi data, create user account
 Return success response ke Flutter
 Flutter redirect ke login page

Login Flow:
 User input credentials di Flutter login form
 Data dikirim ke Django /auth/login/ endpoint
 Django authenticate credentials
 Jika valid, create session dan return authentication token
 Flutter simpan token di shared preferences
 Flutter redirect ke main menu dengan user data

Logout Flow:
 User klik logout button
 Flutter kirim request ke Django /auth/logout/
 Django clear session server-side
 Flutter clear local token dan user data
 Redirect ke login page
 
7. Step-by-Step Implementation
Phase 1: Django Setup
 Install django-cors-headers dan configure CORS settings
 Buat app authentication dengan views untuk login, register, logout
 Configure ALLOWED_HOSTS dengan 10.0.2.2 untuk emulator
 Setup session dan CSRF settings untuk cross-origin

Phase 2: Flutter Authentication
 Install provider dan pbp_django_auth packages
 Setup Provider di main.dart untuk share CookieRequest instance
 Buat login.dart dan register.dart screens dengan form validation
 Integrasi dengan Django auth endpoints menggunakan CookieRequest

Phase 3: Data Models & Integration
 Buat Dart models (ProductEntry) menggunakan Quicktype dari JSON response
 Implement fetch data dari Django JSON endpoints
 Buat UI components: ProductsEntryCard untuk list view
 Buat ProductsDetailPage untuk detail view dengan semua attributes

Phase 4: Advanced Features
 Implement create product form dengan Flutter-Django integration
 Add filter functionality untuk show user's products only
 Setup image proxy untuk handle external images
 Implement logout functionality dengan proper session cleanup

Phase 5: Polish & Documentation
Fix UI issues dan improve user experience
Test semua functionality end-to-end
Document implementation di README.md
Git add-commit-push ke repository