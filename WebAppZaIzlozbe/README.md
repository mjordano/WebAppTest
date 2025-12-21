# Sistem za Upravljanje Izložbama Fotografija

![License](https://img.shields.io/badge/license-MIT-blue.svg)
![Python](https://img.shields.io/badge/python-3.11+-green.svg)
![React](https://img.shields.io/badge/react-18.2-blue.svg)
![FastAPI](https://img.shields.io/badge/fastapi-0.104+-green.svg)

Kompletna web aplikacija za upravljanje izložbama fotografija sa modernim, luksuznim dizajnom.

## 📋 Funkcionalnosti

### Korisnici
- 🔐 Registracija i prijava sa JWT autentifikacijom
- 👤 Korisnički profil i dashboard
- 🎫 Prijava na izložbe sa automatskim generisanjem QR koda
- 📧 Email potvrda sa kartom

### Administratori
- 📊 Admin panel za upravljanje sadržajem
- 🖼️ CRUD operacije za izložbe, lokacije i slike
- 📋 Pregled i validacija prijava
- 👥 Upravljanje korisnicima

### Galerija
- 🌐 Pretraga izložbi po nazivu i gradu
- 🖼️ Galerija slika sa lightbox funkcionalnosti
- 📱 Potpuno responzivni dizajn
- 🎨 Luksuzni crno-beli dizajn

## 🛠️ Tehnološki Stack

### Backend
- **FastAPI** - Python web framework
- **SQLAlchemy** - ORM
- **Alembic** - Migracije baze
- **PostgreSQL** - Baza podataka
- **JWT** - Autentifikacija
- **Pydantic** - Validacija podataka

### Frontend
- **React 18** (Vite)
- **Tailwind CSS** - Stilizacija
- **React Router DOM** - Rutiranje
- **Axios** - HTTP klijent
- **React Icons** - Ikonice

### DevOps
- **Docker** & **Docker Compose**
- **Nginx** - Web server za frontend

## 🚀 Pokretanje

### Zahtevi
- Docker i Docker Compose
- ili Node.js 18+ i Python 3.11+

### Sa Docker-om (Preporučeno)

```bash
# Kloniranje repozitorijuma
git clone <repo-url>
cd WebAppZaIzlozbe

# Pokretanje svih servisa
docker-compose up -d

# Popunjavanje baze test podacima
docker-compose exec backend python seed_data.py
```

Aplikacija je dostupna na:
- **Frontend**: http://localhost
- **Backend API**: http://localhost:8000
- **API Dokumentacija**: http://localhost:8000/docs
- **pgAdmin**: http://localhost:5050

### Bez Docker-a (Development)

#### Backend
```bash
cd backend

# Kreiranje virtualnog okruženja
python -m venv venv
source venv/bin/activate  # Windows: venv\Scripts\activate

# Instaliranje zavisnosti
pip install -r requirements.txt

# Pokretanje PostgreSQL baze (mora biti instaliran)
# Kreirati bazu: izlozbe_db

# Pokretanje servera
uvicorn app.main:app --reload

# Popunjavanje test podacima
python seed_data.py
```

#### Frontend
```bash
cd frontend

# Instaliranje zavisnosti
npm install

# Pokretanje dev servera
npm run dev
```

## 📁 Struktura Projekta

```
WebAppZaIzlozbe/
├── backend/
│   ├── app/
│   │   ├── models/       # SQLAlchemy modeli
│   │   ├── schemas/      # Pydantic šeme
│   │   ├── routers/      # API rute
│   │   ├── services/     # Poslovne logike
│   │   └── utils/        # Pomoćne funkcije
│   ├── alembic/          # Migracije
│   ├── requirements.txt
│   └── Dockerfile
├── frontend/
│   ├── src/
│   │   ├── components/   # React komponente
│   │   ├── pages/        # Stranice
│   │   ├── context/      # React context
│   │   └── services/     # API pozivi
│   ├── package.json
│   └── Dockerfile
├── docker-compose.yml
└── README.md
```

## 🔐 Test Nalozi

| Uloga | Korisničko ime | Lozinka |
|-------|----------------|---------|
| Admin | admin | admin123 |
| Osoblje | osoblje | osoblje123 |
| Korisnik | marko | marko123 |

## 📡 API Endpointi

### Autentifikacija
- `POST /api/auth/register` - Registracija
- `POST /api/auth/login` - Prijava
- `POST /api/auth/logout` - Odjava
- `GET /api/auth/me` - Trenutni korisnik

### Izložbe
- `GET /api/izlozbe` - Lista izložbi
- `GET /api/izlozbe/{id}` - Detalji izložbe
- `POST /api/izlozbe` - Kreiranje (Admin/Osoblje)
- `PUT /api/izlozbe/{id}` - Ažuriranje (Admin/Osoblje)
- `DELETE /api/izlozbe/{id}` - Brisanje (Admin)

### Prijave
- `GET /api/prijave/moje` - Moje prijave
- `POST /api/prijave` - Nova prijava
- `POST /api/prijave/validate` - Validacija QR koda
- `DELETE /api/prijave/{id}` - Otkazivanje

## 🎨 Dizajn

Aplikacija koristi luksuznu crno-belu paletu boja sa zlatnim akcentima:
- **Pozadina**: #0a0a0a - #1a1a1a
- **Tekst**: #fafafa
- **Akcent**: #d4af37 (zlato)

## 📝 Git Commit Strategija

1. `init: project structure with backend and frontend folders`
2. `feat(models): implement SQLAlchemy models for all 5 entities`
3. `feat(migrations): add Alembic migrations for database schema`
4. `feat(auth): implement JWT authentication with login/register`
5. `feat(api): add CRUD endpoints for locations and exhibitions`
6. `feat(api): add CRUD endpoints for images and registrations`
7. `feat(services): implement QR code generation and email simulation`
8. `feat(frontend): setup React with Vite, Tailwind, and routing`
9. `feat(components): add reusable UI components`
10. `feat(pages): implement Home, ExhibitionDetails, and auth pages`
11. `feat(pages): implement UserDashboard and AdminPanel`
12. `docs: add README with setup instructions`

## 📄 Licenca

MIT License

## 👨‍💻 Autori
Marko
