#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
WHITE='\033[1;37m'
DIM='\033[2m'
BOLD='\033[1m'
RESET='\033[0m'

OK="✓"
SKIP="⊘"
ERR="✗"
INFO="»"

DEBIAN_ROOT="$PREFIX/var/lib/proot-distro/installed-rootfs/debian"
TOTAL_STEPS=9

clear
echo -e "${CYAN}${BOLD}"
echo "   ____          _       _               ____ _     ___ "
echo "  / ___|   _ ___| |_ ___(_)_ __   ___   / ___| |   |_ _|"
echo " | |  | | | / __| __/ _ \ | '_ \ / _ \ | |   | |    | | "
echo " | |__| |_| \__ \ ||  __/ | | | | (_) || |___| |___ | | "
echo "  \____\__,_|___/\__\___|_|_| |_|\___/  \____|_____|___|"
echo "  ─────────────────────────────────────────────────────"
echo "          Installer  ·  Proot Debian  ·  Termux         "
echo -e "${RESET}"

read -p "  Pilih bahasa / Choose language — [1] Indonesia  [2] English : " LANG_CHOICE
[ "$LANG_CHOICE" = "2" ] && LANG="en" || LANG="id"

if [ "$LANG" = "id" ]; then
  STR_DETECT_ARCH="Mendeteksi arsitektur sistem"
  STR_ARCH_FOUND="Arsitektur terdeteksi"
  STR_ARCH_UNSUPPORTED="Arsitektur tidak didukung"
  STR_CHECK_PROOT="Memeriksa proot-distro"
  STR_PROOT_EXISTS="proot-distro sudah terinstall, dilewati"
  STR_PROOT_INSTALL="Menginstall proot-distro"
  STR_PROOT_DONE="proot-distro berhasil diinstall"
  STR_PROOT_FAIL="Gagal menginstall proot-distro"
  STR_CHECK_DEBIAN="Memeriksa instalasi Debian"
  STR_DEBIAN_EXISTS="Debian sudah terinstall, dilewati"
  STR_DEBIAN_INSTALL="Menginstall Debian"
  STR_DEBIAN_DONE="Debian berhasil diinstall"
  STR_DEBIAN_FAIL="Gagal menginstall Debian"
  STR_CHECK_CURL="Memeriksa curl di Debian"
  STR_CURL_INSTALL="Menginstall curl di Debian"
  STR_CURL_DONE="curl berhasil diinstall"
  STR_CURL_EXISTS="curl sudah tersedia, dilewati"
  STR_CHECK_CLI="Memeriksa arduino-cli di Debian"
  STR_CLI_EXISTS="arduino-cli sudah terinstall, dilewati"
  STR_CLI_VER="Versi"
  STR_DOWNLOAD="Mengunduh arduino-cli"
  STR_DOWNLOAD_FAIL="Gagal mengunduh arduino-cli"
  STR_EXTRACT="Mengekstrak file"
  STR_INSTALL_BIN="Memindahkan binary ke Debian"
  STR_CLI_DONE="arduino-cli berhasil diinstall"
  STR_CHECK_CONFIG="Memeriksa konfigurasi arduino-cli"
  STR_CONFIG_EXISTS="Konfigurasi sudah ada, dilewati"
  STR_CONFIG_INIT="Membuat konfigurasi baru"
  STR_CONFIG_DONE="Konfigurasi berhasil dibuat"
  STR_CHECK_ESP="Memeriksa URL ESP8266"
  STR_ESP_EXISTS="URL ESP8266 sudah terdaftar, dilewati"
  STR_ESP_ADD="Menambahkan URL board ESP8266"
  STR_ESP_DONE="URL ESP8266 berhasil ditambahkan"
  STR_UPDATE_INDEX="Memperbarui index board manager"
  STR_UPDATE_FAIL="Gagal memperbarui index"
  STR_UPDATE_DONE="Index berhasil diperbarui"
  STR_CHECK_CORE="Memeriksa core ESP8266"
  STR_CORE_EXISTS="Core esp8266:esp8266 sudah terinstall, dilewati"
  STR_CORE_INSTALL="Menginstall core esp8266:esp8266"
  STR_CORE_FAIL="Gagal menginstall core"
  STR_CORE_DONE="Core esp8266:esp8266 berhasil diinstall"
  STR_CHECK_CPD="Memeriksa fungsi cpd di .bashrc"
  STR_CPD_EXISTS="Fungsi cpd sudah ada, dilewati"
  STR_CPD_ADD="Menambahkan fungsi cpd ke .bashrc"
  STR_CPD_DONE="Fungsi cpd berhasil ditambahkan"
  STR_DONE="INSTALASI SELESAI"
  STR_RELOAD="Jalankan perintah ini agar cpd aktif"
else
  STR_DETECT_ARCH="Detecting system architecture"
  STR_ARCH_FOUND="Architecture detected"
  STR_ARCH_UNSUPPORTED="Unsupported architecture"
  STR_CHECK_PROOT="Checking proot-distro"
  STR_PROOT_EXISTS="proot-distro already installed, skipped"
  STR_PROOT_INSTALL="Installing proot-distro"
  STR_PROOT_DONE="proot-distro installed successfully"
  STR_PROOT_FAIL="Failed to install proot-distro"
  STR_CHECK_DEBIAN="Checking Debian installation"
  STR_DEBIAN_EXISTS="Debian already installed, skipped"
  STR_DEBIAN_INSTALL="Installing Debian"
  STR_DEBIAN_DONE="Debian installed successfully"
  STR_DEBIAN_FAIL="Failed to install Debian"
  STR_CHECK_CURL="Checking curl in Debian"
  STR_CURL_INSTALL="Installing curl in Debian"
  STR_CURL_DONE="curl installed successfully"
  STR_CURL_EXISTS="curl already available, skipped"
  STR_CHECK_CLI="Checking arduino-cli in Debian"
  STR_CLI_EXISTS="arduino-cli already installed, skipped"
  STR_CLI_VER="Version"
  STR_DOWNLOAD="Downloading arduino-cli"
  STR_DOWNLOAD_FAIL="Failed to download arduino-cli"
  STR_EXTRACT="Extracting files"
  STR_INSTALL_BIN="Moving binary to Debian"
  STR_CLI_DONE="arduino-cli installed successfully"
  STR_CHECK_CONFIG="Checking arduino-cli configuration"
  STR_CONFIG_EXISTS="Config already exists, skipped"
  STR_CONFIG_INIT="Creating new configuration"
  STR_CONFIG_DONE="Configuration created successfully"
  STR_CHECK_ESP="Checking ESP8266 URL"
  STR_ESP_EXISTS="ESP8266 URL already registered, skipped"
  STR_ESP_ADD="Adding ESP8266 board URL"
  STR_ESP_DONE="ESP8266 URL added successfully"
  STR_UPDATE_INDEX="Updating board manager index"
  STR_UPDATE_FAIL="Failed to update index"
  STR_UPDATE_DONE="Index updated successfully"
  STR_CHECK_CORE="Checking ESP8266 core"
  STR_CORE_EXISTS="Core esp8266:esp8266 already installed, skipped"
  STR_CORE_INSTALL="Installing core esp8266:esp8266"
  STR_CORE_FAIL="Failed to install core"
  STR_CORE_DONE="Core esp8266:esp8266 installed successfully"
  STR_CHECK_CPD="Checking cpd function in .bashrc"
  STR_CPD_EXISTS="cpd function already exists, skipped"
  STR_CPD_ADD="Adding cpd function to .bashrc"
  STR_CPD_DONE="cpd function added successfully"
  STR_DONE="INSTALLATION COMPLETE"
  STR_RELOAD="Run this command to activate cpd"
fi

print_step() {
  echo ""
  echo -e "${CYAN}${BOLD}[STEP $1/${TOTAL_STEPS}]${RESET} ${WHITE}${BOLD}$2${RESET}"
  echo -e "${DIM}──────────────────────────────────────────${RESET}"
}
print_ok()   { echo -e "  ${GREEN}${OK}${RESET} $1"; }
print_skip() { echo -e "  ${YELLOW}${SKIP}${RESET} $1"; }
print_err()  { echo -e "  ${RED}${ERR}${RESET} $1"; exit 1; }
print_info() { echo -e "  ${CYAN}${INFO}${RESET} $1"; }

download_with_bar() {
  local url="$1"
  local out="$2"
  local label="$3"
  print_info "$label"
  curl -L \
    --progress-bar \
    --write-out "\n  ${GREEN}${OK}${RESET} Size: %{size_download} bytes  |  Speed: %{speed_download} B/s  |  Time: %{time_total}s\n" \
    "$url" -o "$out"
}

run_debian() {
  proot-distro login debian -- bash -c "$1"
}

# ── STEP 1: ARCHITECTURE ─────────────────────────────────────
print_step "1" "$STR_DETECT_ARCH"

ARCH=$(uname -m)
print_info "$STR_ARCH_FOUND: ${WHITE}${ARCH}${RESET}"

case "$ARCH" in
  aarch64|arm64)  CLI_ARCH="Linux_ARM64";  BITS="64-bit (ARM64)"  ;;
  armv8l)         CLI_ARCH="Linux_ARMv7";  BITS="32-bit (ARMv8l)" ;;
  armv7l|armv7)   CLI_ARCH="Linux_ARMv7";  BITS="32-bit (ARMv7)"  ;;
  armv6l|armv6)   CLI_ARCH="Linux_ARMv6";  BITS="32-bit (ARMv6)"  ;;
  x86_64)         CLI_ARCH="Linux_64bit";  BITS="64-bit (x86_64)" ;;
  i686|i386)      CLI_ARCH="Linux_32bit";  BITS="32-bit (x86)"    ;;
  *) print_err "$STR_ARCH_UNSUPPORTED: $ARCH" ;;
esac

print_ok "$BITS — $CLI_ARCH"

# ── STEP 2: PROOT-DISTRO ─────────────────────────────────────
print_step "2" "$STR_CHECK_PROOT"

if command -v proot-distro &>/dev/null; then
  print_skip "$STR_PROOT_EXISTS"
else
  print_info "$STR_PROOT_INSTALL"
  pkg install proot-distro -y
  command -v proot-distro &>/dev/null && print_ok "$STR_PROOT_DONE" || print_err "$STR_PROOT_FAIL"
fi

# ── STEP 3: DEBIAN ───────────────────────────────────────────
print_step "3" "$STR_CHECK_DEBIAN"

if [ -d "$DEBIAN_ROOT" ]; then
  print_skip "$STR_DEBIAN_EXISTS"
else
  print_info "$STR_DEBIAN_INSTALL"
  proot-distro install debian
  [ -d "$DEBIAN_ROOT" ] && print_ok "$STR_DEBIAN_DONE" || print_err "$STR_DEBIAN_FAIL"
fi

# ── STEP 4: CURL DI DEBIAN ───────────────────────────────────
print_step "4" "$STR_CHECK_CURL"

if run_debian "command -v curl" &>/dev/null; then
  print_skip "$STR_CURL_EXISTS"
else
  print_info "$STR_CURL_INSTALL"
  run_debian "apt-get update -qq && apt-get install -y curl -qq"
  print_ok "$STR_CURL_DONE"
fi

# ── STEP 5: ARDUINO-CLI ──────────────────────────────────────
print_step "5" "$STR_CHECK_CLI"

if run_debian "command -v arduino-cli" &>/dev/null; then
  VER=$(run_debian "arduino-cli version 2>/dev/null" | awk '{print $3}')
  print_skip "$STR_CLI_EXISTS"
  print_info "$STR_CLI_VER: ${WHITE}${VER}${RESET}"
else
  FILENAME="arduino-cli_latest_${CLI_ARCH}.tar.gz"
  DOWNLOAD_URL="https://downloads.arduino.cc/arduino-cli/${FILENAME}"

  download_with_bar "$DOWNLOAD_URL" "/tmp/arduino-cli.tar.gz" "$STR_DOWNLOAD ($BITS)"

  if [ $? -ne 0 ] || [ ! -f /tmp/arduino-cli.tar.gz ]; then
    print_err "$STR_DOWNLOAD_FAIL"
  fi

  print_info "$STR_EXTRACT"
  tar xf /tmp/arduino-cli.tar.gz -C /tmp/

  print_info "$STR_INSTALL_BIN"
  cp /tmp/arduino-cli "$DEBIAN_ROOT/usr/local/bin/arduino-cli"
  chmod +x "$DEBIAN_ROOT/usr/local/bin/arduino-cli"
  rm -f /tmp/arduino-cli.tar.gz /tmp/arduino-cli

  run_debian "command -v arduino-cli" &>/dev/null && print_ok "$STR_CLI_DONE" || print_err "$STR_DOWNLOAD_FAIL"
fi

# ── STEP 6: CONFIG ───────────────────────────────────────────
print_step "6" "$STR_CHECK_CONFIG"

CONFIG_PATH="$DEBIAN_ROOT/root/.arduino15/arduino-cli.yaml"

if [ -f "$CONFIG_PATH" ]; then
  print_skip "$STR_CONFIG_EXISTS"
else
  print_info "$STR_CONFIG_INIT"
  run_debian "arduino-cli config init"
  print_ok "$STR_CONFIG_DONE"
fi

# ── STEP 7: ESP8266 URL ──────────────────────────────────────
print_step "7" "$STR_CHECK_ESP"

ESP_URL="http://arduino.esp8266.com/stable/package_esp8266com_index.json"

if grep -q "esp8266" "$CONFIG_PATH" 2>/dev/null; then
  print_skip "$STR_ESP_EXISTS"
else
  print_info "$STR_ESP_ADD"
  run_debian "arduino-cli config add board_manager.additional_urls $ESP_URL"
  print_ok "$STR_ESP_DONE"
fi

# ── STEP 8: UPDATE INDEX + CORE ──────────────────────────────
print_step "8" "$STR_UPDATE_INDEX"

run_debian "arduino-cli core update-index"
[ $? -ne 0 ] && print_err "$STR_UPDATE_FAIL"
print_ok "$STR_UPDATE_DONE"

print_info "$STR_CHECK_CORE"
if run_debian "arduino-cli core list" 2>/dev/null | grep -q "esp8266:esp8266"; then
  print_skip "$STR_CORE_EXISTS"
else
  print_info "$STR_CORE_INSTALL"
  run_debian "arduino-cli core install esp8266:esp8266"
  [ $? -ne 0 ] && print_err "$STR_CORE_FAIL"
  print_ok "$STR_CORE_DONE"
fi

# ── STEP 9: CPD FUNCTION ─────────────────────────────────────
print_step "9" "$STR_CHECK_CPD"

BASHRC="$HOME/.bashrc"

if grep -q "cpd()" "$BASHRC" 2>/dev/null; then
  print_skip "$STR_CPD_EXISTS"
else
  print_info "$STR_CPD_ADD"
  cat >> "$BASHRC" << 'EOF'

cpd() {
  DEST="$PREFIX/var/lib/proot-distro/installed-rootfs/debian/root/"
  cp -r "$@" "$DEST"
  echo "✔ File dipindahkan ke Debian root"
}
EOF
  print_ok "$STR_CPD_DONE"
fi

# ── DONE ─────────────────────────────────────────────────────
CLI_VER_FINAL=$(run_debian "arduino-cli version 2>/dev/null" | awk '{print $3}')
CORE_VER=$(run_debian "arduino-cli core list 2>/dev/null" | grep esp8266 | awk '{print $2}')

echo ""
echo -e "${GREEN}${BOLD}"
echo "  ╔══════════════════════════════════════════╗"
printf "  ║        ✓  %-30s║\n" "${STR_DONE}"
echo "  ╠══════════════════════════════════════════╣"
printf "  ║  %-40s║\n" "arduino-cli : ${CLI_VER_FINAL:-installed}"
printf "  ║  %-40s║\n" "Core ESP8266: ${CORE_VER:-installed}"
printf "  ║  %-40s║\n" "Arch        : $BITS"
echo "  ╚══════════════════════════════════════════╝"
echo -e "${RESET}"
echo -e "  ${YELLOW}⚠${RESET}  ${STR_RELOAD}:"
echo -e "     ${WHITE}source ~/.bashrc${RESET}"
echo ""
