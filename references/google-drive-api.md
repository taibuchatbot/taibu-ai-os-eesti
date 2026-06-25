# Google Drive Reference

**Type:** Knowledge / files (Domain 7) — search, read, create docs & files
**Why it matters:** Where contracts, offers, meeting notes, and spreadsheets live. Connecting it lets Taibu AI OS answer "what did we agree in that proposal?" without you digging.

Two ways to connect. **Start with MCP.**

---

## Option A — MCP connector (recommended, no code)

Claude has a first-party Google Drive connector. Once enabled, Taibu AI OS can search files, read document content, and create files directly.

**Enable it:**
- **Claude Code:** add the Google Drive MCP connector and complete Google OAuth.
- **Claude.ai (desktop/web):** Settings → Connectors → enable **Google Drive** → authorize.

**What you get (typical tools):**
- `search_files`, `list_recent_files` — find documents
- `read_file_content`, `download_file_content` — pull text/data into context
- `get_file_metadata`, `get_file_permissions` — check ownership/sharing
- `create_file`, `copy_file` — generate new docs

> This is usually a **read-first** connection — let the AI retrieve and summarize before you grant write-heavy workflows.

---

## Option B — Drive API (script, for automation)

**Docs:** https://developers.google.com/drive/api/guides/about-sdk
**Auth:** OAuth 2.0, or a **service account** (clean for unattended jobs — share the target folder with the service account email).

### Setup
1. https://console.cloud.google.com → enable **Google Drive API**
2. Service-account path: create a service account → JSON key (save as `*-service-account.json`, gitignored) → share the Drive folder with its email
3. OAuth path: OAuth client (Desktop) → `credentials.json`

```bash
pip install google-api-python-client google-auth
```

```python
from google.oauth2 import service_account
from googleapiclient.discovery import build

creds = service_account.Credentials.from_service_account_file(
    "drive-service-account.json",
    scopes=["https://www.googleapis.com/auth/drive.readonly"])
drive = build("drive", "v3", credentials=creds)

files = drive.files().list(q="name contains 'pakkumine'", pageSize=10,
                           fields="files(id, name, modifiedTime)").execute()
```

Common scopes:
- `https://www.googleapis.com/auth/drive.readonly` — search/read
- `https://www.googleapis.com/auth/drive.file` — access files the app creates
- `https://www.googleapis.com/auth/drive` — full access (use sparingly)

### `.env` (Option B only)
```
GDRIVE_SERVICE_ACCOUNT_JSON=drive-service-account.json
```

---

## Which to use?

Start with **A** (MCP) for interactive retrieval. Use **B** when you need a scheduled job (e.g. "every Monday, read new files in /Meetings and append summaries to the decisions log"). Pairs well with a meeting-notes tool (Granola/Otter/Fireflies) writing into Drive.
