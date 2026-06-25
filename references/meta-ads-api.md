# Meta (Facebook / Instagram) Marketing API Reference

**Type:** Paid advertising — campaigns, ad sets, ads, audiences, insights, pixel events
**Why it matters in EE:** Meta is the dominant paid channel for Estonian SMBs (lead gen, e-commerce, local services).
**Docs:** https://developers.facebook.com/docs/marketing-apis/
**Base URL:** `https://graph.facebook.com/v21.0`

---

## Auth

Meta uses OAuth access tokens tied to a Business App. The easiest reliable path is a **System User token** (long-lived, doesn't expire like personal tokens).

### Setup
1. https://developers.facebook.com → create an app (type: **Business**)
2. Add the **Marketing API** product
3. https://business.facebook.com → Business Settings → **System Users** → create one → assign your Ad Account + Pixel → **Generate token** with scopes: `ads_read`, `ads_management`, `business_management`
4. Note your **Ad Account ID** (Ads Manager → Account Settings) — format `act_1234567890`

### `.env`
```
META_APP_ID=
META_APP_SECRET=
META_ACCESS_TOKEN=          # system user token (long-lived)
META_AD_ACCOUNT_ID=         # act_1234567890
META_PIXEL_ID=
```

---

## Connection (Python — official SDK)

The official `facebook_business` SDK is the path of least resistance.

```bash
pip install facebook_business python-dotenv
```

```python
import os
from dotenv import load_dotenv
from facebook_business.api import FacebookAdsApi
from facebook_business.adobjects.adaccount import AdAccount

load_dotenv()
FacebookAdsApi.init(
    app_id=os.getenv("META_APP_ID"),
    app_secret=os.getenv("META_APP_SECRET"),
    access_token=os.getenv("META_ACCESS_TOKEN"),
)

account = AdAccount(os.getenv("META_AD_ACCOUNT_ID"))
info = account.api_get(fields=["name", "account_status", "currency"])
print(info["name"], info["currency"])   # esimene test — kinnita ühendus
```

---

## Common reads (insights / performance)

```python
from facebook_business.adobjects.adset import AdSet

insights = AdSet(AD_SET_ID).get_insights(
    params={"date_preset": "last_7d", "level": "ad"},
    fields=["ad_name", "impressions", "clicks", "ctr", "cpc", "spend",
            "actions", "cost_per_action_type"],
)
```

Useful `date_preset` values: `today`, `yesterday`, `last_7d`, `last_14d`, `last_30d`, `this_month`, `maximum`.

Lead actions to watch in `actions[]`: `lead`, `onsite_conversion.lead_grouped`, `offsite_conversion.fb_pixel_lead`, `link_click`.

## Common writes

```
POST act_{id}/campaigns      — create campaign (objective, status=PAUSED first!)
POST act_{id}/adsets         — create ad set (targeting, budget, optimization_goal)
POST act_{id}/ads            — create ad (creative + ad set)
POST act_{id}/customaudiences — create custom/lookalike audience
```

> **Intern Rule:** always create campaigns with `status=PAUSED`, review in Ads Manager, then activate. Never let AI spend money unsupervised (see `references/3ms-framework.md` — Bike Method).

---

## Rate limits

Ad-account-level rate limiting. Watch the `X-Business-Use-Case-Usage` response header. Heavy insight pulls: batch and cache.

## Notes

- The strategy/copy framework for building campaigns lives in the **facebook-ads skill** — install with `npx skills add vercel-labs/agent-skills@facebook-ads`.
- Pixel/conversion tracking is usually wired through Google Tag Manager — see `references/gtm-api.md`.
- All monetary values are in the account currency (EUR for EE accounts), in the account's minor unit where noted.
