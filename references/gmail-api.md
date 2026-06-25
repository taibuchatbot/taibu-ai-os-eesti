# Gmail Reference

**Type:** Communication (Domain 4) — read, search, draft, label email
**Why it matters:** For most EE solopreneurs and small teams, email *is* the CRM and the to-do list. Connecting it is the single highest-leverage move.

There are two ways to connect Gmail. **Start with MCP** — it's far simpler.

---

## Option A — MCP connector (recommended, no code)

Claude has a first-party Gmail connector. Once enabled, Taibu AI OS can search threads, read messages, create drafts, and manage labels directly — no API keys, no `.env`.

**Enable it:**
- **Claude Code:** `claude mcp add` the Google/Gmail connector, or enable it from the connectors UI, and complete the Google OAuth sign-in.
- **Claude.ai (desktop/web):** Settings → Connectors → enable **Gmail** → authorize with Google.

**What you get (typical tools):**
- `search_threads`, `get_thread` — find and read mail
- `create_draft` — draft a reply (review before sending — **AI drafts, you send**)
- `list_labels`, `label_thread`, `create_label` — triage and organize

> **Intern Rule (see `references/3ms-framework.md`):** keep Gmail at **draft level** first. Let the AI draft, you hit send. Promote to auto-send only after you trust it.

---

## Option B — Gmail API (script, for automation)

Use this when you need scheduled/automated email handling outside a chat session.

**Docs:** https://developers.google.com/gmail/api
**Auth:** OAuth 2.0 (user consent) or a service account with domain-wide delegation (Google Workspace only).

### Setup
1. https://console.cloud.google.com → enable **Gmail API**
2. Create an **OAuth client ID** (Desktop) → download `credentials.json` (gitignored)
3. Run the OAuth flow once → store the token

```bash
pip install google-api-python-client google-auth-oauthlib
```

```python
from google.oauth2.credentials import Credentials
from googleapiclient.discovery import build

service = build("gmail", "v1", credentials=creds)
msgs = service.users().messages().list(userId="me", q="is:unread newer_than:1d").execute()
```

Common scopes:
- `https://www.googleapis.com/auth/gmail.readonly` — search/read
- `https://www.googleapis.com/auth/gmail.compose` — create drafts
- `https://www.googleapis.com/auth/gmail.modify` — labels, archive

### `.env` (Option B only)
```
GMAIL_CREDENTIALS_JSON=credentials.json
GMAIL_TOKEN_JSON=gmail-token.json
```

---

## Which to use?

| | MCP (A) | API script (B) |
|---|---|---|
| Setup effort | Minutes, click-through | OAuth flow + code |
| Best for | Interactive use in Claude | Scheduled/automated jobs |
| Credentials | None in repo | `credentials.json` (gitignored) |

Start with **A**. Move to **B** only when you need unattended automation (e.g. a nightly "summarize new leads" job).
