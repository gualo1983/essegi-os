#!/usr/bin/env bash

# Esci immediatamente se un comando fallisce o trova variabili non dichiarate
set -oue pipefail

echo "=== Inizio installazione Middleware CIE con Java di Sistema ==="

# 1. Installazione dell'OpenJDK disponibile su Fedora e dei servizi Smart Card (PC/SC)
# 2. Aggiunta delle librerie grafiche e crittografiche necessarie
rpm-ostree install \
    pcsc-lite \
    pcsc-lite-ccid \
    java-latest-openjdk \
    java-latest-openjdk-devel \
    qt5-qtsvg \
    openssl

# 3. Scaricamento e installazione dell'RPM ufficiale del Ministero
echo "Download e installazione dell'RPM CIE..."
rpm-ostree install https://github.com/italia/cie-middleware-linux/releases/download/1.4.3.12/CIE-Middleware-1.4.3-12.x86_64.rpm

echo "=== Installazione CIE completata con successo ==="
