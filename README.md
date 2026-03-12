# Custeino CLI

Custeino CLI adalah **script installer otomatis Arduino CLI untuk Termux + Proot Debian** yang memudahkan pengguna Android untuk meng-compile firmware Arduino langsung dari HP tanpa perlu Arduino IDE.

Custeino CLI is an **automatic installer script for Arduino CLI on Termux + Proot Debian**, designed to make compiling Arduino firmware on Android easy without needing Arduino IDE.

---

# 🇮🇩 Deskripsi (Indonesia)

Custeino CLI membantu pengguna Termux untuk dengan cepat menyiapkan environment Arduino menggunakan **Arduino CLI** di dalam **Debian Proot**.

Script ini akan secara otomatis:

- Menginstall `proot-distro`
- Menginstall **Debian Linux**
- Menginstall **Arduino CLI**
- Mengkonfigurasi Board Manager
- Menginstall **ESP8266 Core**
- Menambahkan fungsi helper untuk memindahkan file dari Termux ke Debian

Semua proses dilakukan otomatis hanya dengan satu script.

---

# 🇬🇧 Description (English)

Custeino CLI helps Termux users quickly set up an Arduino development environment using **Arduino CLI** inside **Debian Proot**.

The script automatically:

- Installs `proot-distro`
- Installs **Debian Linux**
- Installs **Arduino CLI**
- Configures the Board Manager
- Installs **ESP8266 Core**
- Adds a helper function to transfer files from Termux to Debian

Everything is done automatically using a single script.

---

# Features / Fitur

✔ Automatic Arduino CLI installer  
✔ Setup **Debian Proot environment**  
✔ Install **latest Arduino CLI**  
✔ Auto configure **ESP8266 Board Manager**  
✔ Install **ESP8266 Core**  
✔ Helper command for file transfer  
✔ Simple and lightweight setup  
✔ Works directly on Android using Termux  

---

# Supported System

- Android
- Termux environment
- CPU Architecture:
  - `arm`
  - `armv7`
  - `aarch64`

---

# Installation / Instalasi

Open **Termux** and run:

Buka **Termux** lalu jalankan:

```bash
pkg update && pkg install curl -y && curl -sL https://raw.githubusercontent.com/XZV-Developer/Custeino-CLI/main/setup-arduino.sh | bash
