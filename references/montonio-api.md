# Montonio API Reference

**Type:** Payments & BNPL — bank links (Estonia, Latvia, Lithuania, Poland), card payments, Buy Now Pay Later
**Docs:** https://docs.montonio.com/introduction
**API reference:** https://docs.montonio.com/api/stargate/reference
**Base URL:** `https://stargate.montonio.com` (production) | `https://sandbox-stargate.montonio.com` (sandbox)

---

## Auth

Montonio Stargate uses **JWT (JSON Web Tokens)** signed with your Secret Key using HMAC-SHA256 (HS256).

### Credentials
1. Log in to the Montonio Partner System: https://partner.montonio.com
2. Go to Stores → your store → API Keys tab
3. Generate keys for **Sandbox** and **Production** separately
4. You get: `ACCESS_KEY` and `SECRET_KEY`

### Signing a request
```python
import jwt, time

ACCESS_KEY = "your_access_key"
SECRET_KEY = "your_secret_key"

# For GET requests — JWT in Authorization header
def get_token(payload: dict = None) -> str:
    data = {"access_key": ACCESS_KEY, "iat": int(time.time())}
    if payload:
        data.update(payload)
    return jwt.encode(data, SECRET_KEY, algorithm="HS256")

# For POST requests — JWT IS the request body (the payload itself is signed)
def post_token(payload: dict) -> str:
    payload["access_key"] = ACCESS_KEY
    payload["iat"] = int(time.time())
    return jwt.encode(payload, SECRET_KEY, algorithm="HS256")
```

Install: `pip install PyJWT`

---

## Common endpoints

```
POST /orders                  — create a payment order (returns checkout URL)
GET  /orders/{uuid}           — fetch order status
POST /orders/{uuid}/refund    — issue a refund
GET  /stores/payment-methods  — list available payment methods for your store
```

### Create a payment order
```python
import requests

payload = {
    "merchant_reference": "ORDER-001",
    "return_url": "https://yoursite.ee/thank-you",
    "notification_url": "https://yoursite.ee/webhook/montonio",
    "currency": "EUR",
    "grand_total": 49.90,
    "payment": {
        "method": "paymentInitiation",   # bank link
        "currency": "EUR",
        "amount": 49.90,
    }
}

token = post_token(payload)
r = requests.post(
    "https://stargate.montonio.com/orders",
    data=token,
    headers={"Content-Type": "text/plain"}
)
order = jwt.decode(r.text, SECRET_KEY, algorithms=["HS256"])
checkout_url = order["payment_url"]   # redirect customer here
```

---

## Payment methods

| `method` value       | Description                          |
|----------------------|--------------------------------------|
| `paymentInitiation`  | Bank link (instant bank transfer)    |
| `card`               | Visa / Mastercard                    |
| `blik`               | BLIK (Poland)                        |
| `bnpl`               | Buy Now Pay Later (installments)     |

Bank link supports: LHV, SEB, Swedbank, Luminor, Coop, Revolut (EE), and equivalents in LV/LT/PL.

---

## Webhooks

Montonio sends a signed JWT to your `notification_url` on payment events. Verify the signature:
```python
event = jwt.decode(request.body, SECRET_KEY, algorithms=["HS256"])
# event["status"] == "PAID" | "PENDING" | "CANCELLED"
```

---

## Notes

- Always test in sandbox first. Sandbox and production use separate key pairs.
- No MCP server available — script or webhook integration is the path.
- Refunds require the original order UUID.

Save credentials in `.env` as `MONTONIO_ACCESS_KEY` and `MONTONIO_SECRET_KEY`.
