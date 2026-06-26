# Google Tag Manager API Reference

**Type:** Tag management & tracking — controls all site tags, triggers, variables (pixels, GA4, conversion tracking)
**Why it matters in EE:** One container manages Meta Pixel + Google Ads + GA4 tracking for your site. Central to measuring ad performance.
**Docs:** https://developers.google.com/tag-platform/tag-manager/api/v2
**Mechanism:** `script` — Python hitting Tag Manager API v2 via a **service account** (no browser auth flow).

---

## Auth — service account

### 1. Google Cloud project + enable API
1. https://console.cloud.google.com → create a project (or reuse one)
2. APIs & Services → Library → search **"Tag Manager API"** → **Enable**

### 2. Create a service account + key
1. APIs & Services → Credentials → **Create Credentials → Service account**
2. Name it (e.g. `taibu-gtm`). Create.
3. Open it → **Keys** → **Add Key → Create new key → JSON** → download
4. Save the file as **`gtm-service-account.json`** in the project root (it is gitignored)
5. Copy the service account **email** (e.g. `taibu-gtm@yourproject.iam.gserviceaccount.com`)

### 3. Grant access in GTM
1. GTM → **Admin** → (Account) **User Management** → **+** → add the service account email
2. Give **Account: User** and **Container: Publish** (Publish lets it create + publish versions; use **Edit** to block publishing)

### `.env`
```
GTM_SERVICE_ACCOUNT_JSON=gtm-service-account.json
GTM_ACCOUNT_ID=
GTM_CONTAINER_ID=GTM-XXXXXXX
```

---

## Required scopes (all three)

- `https://www.googleapis.com/auth/tagmanager.edit.containers` — read/create/edit/delete tags, triggers, variables
- `https://www.googleapis.com/auth/tagmanager.edit.containerversions` — **required for `create_version`** (without it, 403 "insufficient authentication scopes")
- `https://www.googleapis.com/auth/tagmanager.publish` — publish a version live

---

## Connection (Python)

```bash
pip install google-api-python-client google-auth python-dotenv
```

```python
import os
from dotenv import load_dotenv
from google.oauth2 import service_account
from googleapiclient.discovery import build

load_dotenv()
SCOPES = [
    "https://www.googleapis.com/auth/tagmanager.edit.containers",
    "https://www.googleapis.com/auth/tagmanager.edit.containerversions",
    "https://www.googleapis.com/auth/tagmanager.publish",
]
creds = service_account.Credentials.from_service_account_file(
    os.getenv("GTM_SERVICE_ACCOUNT_JSON"), scopes=SCOPES)
tm = build("tagmanager", "v2", credentials=creds)

# Read-only first: list accounts → containers → workspaces → tags
accounts = tm.accounts().list().execute()
```

---

## Workflow & safety

GTM changes affect **all** site tracking. Always follow: **inspect → change in a workspace → verify in Preview → publish.** Publishing is the only hard-to-reverse step (rollback = republish a prior version).

Constraints worth remembering:
- Custom HTML tags must be **ES5** JavaScript.
- GTM regex is **RE2** (not PCRE).

> The "Regional Access Boundary … Precondition check failed" line some auth libraries print on every call is harmless noise — operations still succeed.

## Notes

- A full GTM skill (tags, triggers, variables, dataLayer, debugging references) is installable: `npx skills add vercel-labs/agent-skills@google-tagmanager` (if available) or `npx skills find tag manager`.
