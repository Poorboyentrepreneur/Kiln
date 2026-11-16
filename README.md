# Kiln

Kiln is a full-stack SaaS starter with a FastAPI API, React/TypeScript frontend, account registration and login, feature-flag dashboard, Stripe subscription checkout/portal/webhook scaffolding, and legal-page placeholders.

## Run locally

Requirements: Python 3.12+, Node.js 20+, and npm.

1. Copy `.env.example` to `.env`. Set a random `SECRET_KEY` (for example, `python -c "import secrets; print(secrets.token_hex(32))"`). The defaults are for local development only.
2. Start the API from the repository root:

   ```bash
   python -m venv .venv
   # macOS/Linux: source .venv/bin/activate
   # Windows: .venv\Scripts\activate
   pip install -r requirements.txt
   uvicorn app.main:app --reload --host 127.0.0.1 --port 8000
   ```

   Tables are created on startup. API docs are at http://localhost:8000/docs.
3. In another terminal, start the frontend:

   ```bash
   cd frontend
   npm install
   npm run dev
   ```

   Open http://localhost:5173. Vite proxies `/api` requests to the local API.

SQLite is used by default. To use PostgreSQL, set `DATABASE_URL` to an async SQLAlchemy URL such as `postgresql+asyncpg://user:password@host:5432/kiln`.

## Included features

- Email/password registration and JWT login.
- Authenticated feature-flag listing, creation, and toggling.
- Stripe Checkout, Customer Portal, and signed webhook scaffolding. Configure Stripe secrets and a recurring Price ID before enabling billing.
- Terms, privacy, and refund pages with placeholder text.

Email verification and password-reset flows are not implemented. Add an email provider and secure token lifecycle before relying on those flows. Replace the legal placeholders with reviewed, product-specific policies before launch.

## Deployment checklist

- Use managed PostgreSQL and set `DATABASE_URL` and a long random `SECRET_KEY` as platform secrets. Never deploy `.env` or use development defaults.
- Set `CORS_ORIGINS` to a JSON array containing only your public frontend origin(s), and set `FRONTEND_URL` to the public frontend URL.
- Configure Stripe live-mode secrets, `STRIPE_PRICE_ID`, and the HTTPS webhook endpoint ending in `/api/v1/billing/webhook`. Test checkout, portal, and webhook events before launch.
- Build the frontend with `npm ci && npm run build`, deploy `frontend/dist` to a static host, and set `VITE_API_URL` to the public API origin if the frontend and API are not served from the same origin.
- Run the API with `uvicorn app.main:app --host 0.0.0.0 --port 8000`. Terminate HTTPS at your hosting platform or reverse proxy.
- Add database migrations, email verification/password reset, monitoring, backups, and reviewed legal text before production use. Avoid SQLite on ephemeral container storage.
