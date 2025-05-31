#!/bin/sh

# Instalacja skina E2K

##setup command=wget -q "--no-check-certificate" https://raw.githubusercontent.com/azman26/enigma2-E2K-skins/refs/heads/main/installer.sh -O - | /bin/sh

SKINS_URL="https://github.com/azman26/enigma2-E2K-skins/archive/refs/heads/main.zip"
TMP_DIR="/tmp/azman-E2K-skins"
DEST_DIR="/etc/E2Kodi/userSkins"

echo "Pobieranie skórek z $SKINS_URL..."
mkdir -p "$TMP_DIR"
cd "$TMP_DIR" || exit 1

wget -O skins.zip "$SKINS_URL"
if [ $? -ne 0 ]; then
    echo "Błąd pobierania archiwum!"
    exit 1
fi

unzip -o skins.zip
if [ $? -ne 0 ]; then
    echo "Błąd rozpakowywania archiwum!"
    exit 1
fi

if [ ! -d "$DEST_DIR" ]; then
    echo "Tworzenie katalogu docelowego $DEST_DIR..."
    mkdir -p "$DEST_DIR"
fi

echo "Kopiowanie katalogów do $DEST_DIR..."
cp -r enigma2-E2K-skins-main/azman-E2K-skins "$DEST_DIR/"
cp -r enigma2-E2K-skins-main/endriu-E2K-skins "$DEST_DIR/"
cp -r enigma2-E2K-skins-main/endriu-V2-E2K-skins "$DEST_DIR/"
cp -r enigma2-E2K-skins-main/endriu-Blu-Line-E2K-skins "$DEST_DIR/"
cp -r enigma2-E2K-skins-main/jk36-E2K-skins "$DEST_DIR/"

cd /
rm -rf "$TMP_DIR"

echo "Instalacja zakończona pomyślnie!"
sleep 2
echo "Restart GUI odbiornika"
init 4
sleep 1
init 3
