#!/bin/bash
# Deploy skripta za Photo Exhibition System
# Pokreni na serveru 192.168.1.66

set -e

echo "========================================"
echo "  Deployment - Galerija Izložbi"
echo "========================================"

# Kreiranje direktorijuma
echo "[1/6] Kreiranje direktorijuma..."
mkdir -p /opt/izlozbe
cd /opt/izlozbe

# Provera da li postoji Docker
echo "[2/6] Provera Docker-a..."
if ! command -v docker &> /dev/null; then
    echo "Docker nije instaliran. Instaliram..."
    curl -fsSL https://get.docker.com -o get-docker.sh
    sh get-docker.sh
    systemctl enable docker
    systemctl start docker
fi

if ! command -v docker-compose &> /dev/null; then
    echo "Docker Compose nije instaliran. Instaliram..."
    curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    chmod +x /usr/local/bin/docker-compose
fi

echo "[3/6] Docker verzija:"
docker --version
docker-compose --version

# Gašenje starih kontejnera
echo "[4/6] Gašenje postojećih kontejnera..."
docker-compose down 2>/dev/null || true

# Build i pokretanje
echo "[5/6] Build i pokretanje kontejnera..."
docker-compose up -d --build

# Čekanje da se baza pokrene
echo "[6/6] Čekanje na bazu podataka..."
sleep 10

# Seed data
echo "Popunjavanje baze test podacima..."
docker-compose exec -T backend python seed_data.py

echo ""
echo "========================================"
echo "  Deployment završen!"
echo "========================================"
echo ""
echo "Aplikacija je dostupna na:"
echo "  Frontend:  http://192.168.1.66"
echo "  Backend:   http://192.168.1.66:8000"
echo "  API Docs:  http://192.168.1.66:8000/docs"
echo "  pgAdmin:   http://192.168.1.66:5050"
echo ""
echo "Test nalozi:"
echo "  Admin:    admin / admin123"
echo "  Korisnik: marko / marko123"
echo "========================================"
