# Google Ads API Reference

**Type:** Paid search & display advertising — campaigns, keywords, performance, conversions
**Why it matters in EE:** Second-biggest paid channel after Meta; strong for high-intent search (e.g. "raamatupidaja Tallinn").
**Docs:** https://developers.google.com/google-ads/api/docs/start
**Library:** `google-ads` (official Python client)

---

## Auth

Google Ads uses OAuth 2.0 **plus** a developer token. This is the most involved setup of the EE stack — budget ~30 min.

### Setup
1. **Developer token:** Google Ads → Tools → API Center → apply for a token (Basic access is enough to start; test tokens work against test accounts immediately)
2. **OAuth client:** https://console.cloud.google.com → APIs & Services → Credentials → create **OAuth client ID** (type: Desktop)
3. **Refresh token:** run Google's OAuth flow once to mint a long-lived refresh token (see the `google-ads` library's `generate_user_credentials.py` helper)
4. **Customer ID:** your 10-digit Google Ads account ID (no dashes)

### `.env`
```
GOOGLE_ADS_DEVELOPER_TOKEN=
GOOGLE_ADS_CLIENT_ID=
GOOGLE_ADS_CLIENT_SECRET=
GOOGLE_ADS_REFRESH_TOKEN=
GOOGLE_ADS_LOGIN_CUSTOMER_ID=     # MCC/manager account, if applicable
GOOGLE_ADS_CUSTOMER_ID=           # the account you query (10 digits, no dashes)
```

---

## Connection (Python)

```bash
pip install google-ads python-dotenv
```

The client reads a `google-ads.yaml` OR env vars. Env-var style:

```python
import os
from dotenv import load_dotenv
from google.ads.googleads.client import GoogleAdsClient

load_dotenv()
client = GoogleAdsClient.load_from_dict({
    "developer_token": os.getenv("GOOGLE_ADS_DEVELOPER_TOKEN"),
    "client_id": os.getenv("GOOGLE_ADS_CLIENT_ID"),
    "client_secret": os.getenv("GOOGLE_ADS_CLIENT_SECRET"),
    "refresh_token": os.getenv("GOOGLE_ADS_REFRESH_TOKEN"),
    "login_customer_id": os.getenv("GOOGLE_ADS_LOGIN_CUSTOMER_ID"),
    "use_proto_plus": True,
})
```

---

## Querying — GAQL (Google Ads Query Language)

Reads use a SQL-like language:

```python
ga_service = client.get_service("GoogleAdsService")
query = """
    SELECT campaign.name, metrics.impressions, metrics.clicks,
           metrics.cost_micros, metrics.conversions
    FROM campaign
    WHERE segments.date DURING LAST_7_DAYS
    ORDER BY metrics.cost_micros DESC
"""
for row in ga_service.search(customer_id=os.getenv("GOOGLE_ADS_CUSTOMER_ID"), query=query):
    print(row.campaign.name, row.metrics.clicks, row.metrics.cost_micros / 1_000_000)
```

> **Cost is in micros:** `cost_micros / 1_000_000` = EUR. So `5_230_000` = €5.23.

---

## Notes

- Mutations (create/pause campaigns) use `*Operation` objects + service `mutate_*`. Always start `PAUSED`.
- Conversion tracking is typically set up via GTM — see `references/gtm-api.md`.
- Test account first: Google Ads API has a sandbox-like test-account model before you need production access approval.
