# Kiln

**Ship backends that feel finished.**

Kiln is a production-oriented full-stack SaaS starter:

- FastAPI backend with real auth, feature flags, Stripe-ready billing, and legal endpoints
- React + TypeScript + Tailwind frontend with a polished, commercial dark UI
- SQLite by default, Postgres-ready
- One-command local start

---

## Quick Start

### Backend

```bash
cd kiln
python -m venv .venv

# Windows
.venv\Scripts\activate

# macOS / Linux
source .venv/bin/activate

pip install -r requirements.txt
python -m app.db.init_db
uvicorn app.main:app --reload --host 0.0.0.0 --port 8000
```

Or on Windows simply double-click `start-kiln.bat`.

Backend runs at: **http://localhost:8000**  
Interactive docs: **http://localhost:8000/docs**

### Frontend

```bash
cd kiln/frontend
npm install
npm run dev
```

Frontend runs at: **http://localhost:5173**

---

## What’s included

### Backend
- JWT authentication (register, login, /me)
- Email verification + password reset flows
- Feature flags with live toggle API
- Stripe-ready (Checkout, Customer Portal, webhooks)
- Subscription + plan models
- Legal endpoints (Terms, Privacy, Refund)
- Rate limiting scaffolding
- SQLite (default) or Postgres

### Frontend
- Polished dark marketing landing
- Auth (login / register) with toast feedback
- Dashboard with live feature flag controls
- Pricing page
- Account / settings page
- Legal pages
- Protected routes + loading states

---

## Stripe (optional)

1. Add keys to `.env`:
   ```
   STRIPE_SECRET_KEY=sk_...
   STRIPE_PUBLISHABLE_KEY=pk_...
   STRIPE_WEBHOOK_SECRET=whsec_...
   ```
2. Replace placeholder Price IDs in `app/services/stripe_service.py`
3. Point a webhook to `POST /api/v1/billing/webhook`

---

## Production notes

- Change `SECRET_KEY`
- Set `CORS_ORIGINS` to your real domain
- Switch `DATABASE_URL` to Postgres
- Add a real email provider in `app/services/email_service.py`
- Run behind HTTPS

---

Kiln is designed to be the foundation you actually ship on — not a disposable demo.
