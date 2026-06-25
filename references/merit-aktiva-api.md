# Merit Aktiva API Reference

**Type:** Accounting & invoicing (Estonia's most-used accounting software, 83k+ companies)
**Docs:** https://api.merit.ee/merit-aktiva-api/
**Auth reference:** https://api.merit.ee/connecting-robots/reference-manual/authentication/
**Base URL:** `https://aktiva.merit.ee/api/v1/` (EE) or `https://aktiva.meritsolutions.pl/api/v1/` (PL)

---

## Auth

Merit uses HMAC-SHA256 signature auth — no OAuth, no bearer tokens. Every request is signed.

### Credentials
1. In Merit Aktiva: Settings → API Settings
2. Generate your **API ID** and **API Key** — keep both secret

### Signature calculation (per request)
```python
import hashlib, hmac, base64, time, json

def merit_signature(api_id: str, api_key: str, payload: str) -> tuple[str, str]:
    timestamp = str(int(time.time()))
    data_to_sign = api_id + timestamp + payload
    sig = hmac.new(api_key.encode(), data_to_sign.encode(), hashlib.sha256).digest()
    return base64.b64encode(sig).decode(), timestamp

# Usage
payload = json.dumps({"...": "..."})
signature, ts = merit_signature(API_ID, API_KEY, payload)

headers = {
    "Content-Type": "application/json",
    "ApiId": API_ID,
    "Timestamp": ts,
    "Signature": signature
}
```

---

## Common endpoints

```
POST /getinvoices        — fetch sales invoices (filter by date range)
POST /sendinvoice        — create + send a sales invoice
POST /getpurchases       — fetch purchase invoices
POST /sendpurchase       — create a purchase invoice
POST /getcustomers       — list customers
POST /sendcustomer       — create/update a customer
POST /getitems           — list products/services
POST /getaccounts        — chart of accounts
POST /getvatcodes        — VAT codes (important for Estonian VAT compliance)
```

All endpoints are POST with a JSON body. No GET endpoints.

### Example — fetch invoices for a date range
```json
{
  "PeriodStart": "20240101",
  "PeriodEnd":   "20240131",
  "UnPaid": true
}
```

---

## Notes

- All amounts in cents (integer). `12345` = 123.45 EUR.
- Dates are `YYYYMMDD` strings, not ISO-8601.
- Estonian e-invoice (e-arve) export supported via `/sendinvoice` with `SendEInvoice: true`.
- No official MCP server exists — script connection is the path.

---

## Script option (Python)

```python
import hashlib, hmac, base64, time, json, requests

API_ID  = "your_api_id"
API_KEY = "your_api_key"
BASE    = "https://aktiva.merit.ee/api/v1"

def call(endpoint: str, body: dict) -> dict:
    payload = json.dumps(body)
    ts = str(int(time.time()))
    sig_data = API_ID + ts + payload
    sig = base64.b64encode(
        hmac.new(API_KEY.encode(), sig_data.encode(), hashlib.sha256).digest()
    ).decode()
    r = requests.post(
        f"{BASE}/{endpoint}",
        data=payload,
        headers={
            "Content-Type": "application/json",
            "ApiId": API_ID,
            "Timestamp": ts,
            "Signature": sig,
        }
    )
    return r.json()

# Example
invoices = call("getinvoices", {"PeriodStart": "20240101", "PeriodEnd": "20240131"})
```

Save credentials in `.env` as `MERIT_API_ID` and `MERIT_API_KEY`.
