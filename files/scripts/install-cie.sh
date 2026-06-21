#!/usr/bin/env bash

# Esci immediatamente se un comando fallisce o trova variabili non dichiarate
set -oue pipefail

echo "=== Inizio installazione forzata Middleware CIE ==="

# 1. Installiamo Java di sistema e le dipendenze reali (librerie grafiche e smartcard)
rpm-ostree install \
    pcsc-lite \
    pcsc-lite-ccid \
    java-latest-openjdk \
    java-latest-openjdk-devel \
    qt5-qtsvg \
    openssl

# 2. Scarichiamo l'RPM della CIE nella cartella temporanea
echo "Scaricamento RPM CIE..."
curl -L -o /tmp/cie-middleware.rpm https://github.com/italia/cie-middleware-linux/releases/download/1.4.3.12/CIE-Middleware-1.4.3-12.x86_64.rpm

# 3. Estraiamo e installiamo il contenuto dell'RPM direttamente nel file system dell'immagine,
# ignorando il blocco del nome della dipendenza Java 17
echo "Estrazione e iniezione dei file CIE nel sistema..."
rpm2cpio /tmp/cie-middleware.rpm | cpio -idmv -D /

echo "=== Installazione CIE completata con successo! ==="
