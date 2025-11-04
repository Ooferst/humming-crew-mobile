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
