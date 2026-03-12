# Custeino CLI

Custeino CLI adalah **installer otomatis Arduino CLI untuk Termux + Proot Debian** yang dirancang agar proses setup Arduino environment di Android menjadi sangat mudah.

Project ini dibuat untuk pengguna **Termux** yang ingin melakukan **compile firmware Arduino / ESP8266 langsung dari HP**, tanpa perlu Arduino IDE.

Installer ini akan secara otomatis:

- Menginstall `proot-distro`
- Menginstall **Debian Linux**
- Menginstall **Arduino CLI**
- Mengkonfigurasi **Board Manager**
- Menginstall **ESP8266 Core**
- Menambahkan fungsi helper `cpd` untuk memindahkan file ke Debian

Semua proses dilakukan **secara otomatis dengan satu script**.

---

# Fitur

✔ Installer otomatis untuk Termux  
✔ Setup **Proot Debian environment**  
✔ Install **Arduino CLI terbaru**  
✔ Auto konfigurasi **Board Manager ESP8266**  
✔ Auto install **ESP8266 Core**  
✔ Multi bahasa (Indonesia / English)  
✔ Tampilan terminal modern  
✔ Fungsi helper `cpd` untuk transfer file ke Debian  

---

# Sistem yang Didukung

- Android
- Termux
- Arsitektur:
  - `arm`
  - `armv7`
  - `aarch64`

---

# Instalasi

Buka **Termux** lalu jalankan:

```bash
pkg update && pkg install curl -y && curl -sL https://raw.githubusercontent.com/XZV-Developer/Custeino-CLI/main/setup-arduino.sh | bash
