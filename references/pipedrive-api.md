# Pipedrive API Reference

**Type:** CRM — contacts, deals, pipelines, activities, notes
**Docs:** https://developers.pipedrive.com/docs/api/v1
**Base URL:** `https://api.pipedrive.com/v1`

---

## Auth options

### 1. Personal API Token (simplest, good for personal use)
1. In Pipedrive: avatar → Personal Preferences → API
2. Copy your token
3. Append to every request: `?api_token=YOUR_TOKEN`
   or set header: `Authorization: Bearer YOUR_TOKEN`

### 2. OAuth 2.0 (recommended for shared/production use)
- Register an app at https://developers.pipedrive.com/
- Authorization URL: `https://oauth.pipedrive.com/oauth/authorize`
- Token URL: `https://oauth.pipedrive.com/oauth/token`
- Scopes: `deals:read`, `contacts:read`, `activities:read`, etc.

---

## Common endpoints

```
GET  /persons          — list contacts
GET  /deals            — list deals (supports filter_id, stage_id)
GET  /deals/{id}       — single deal with all fields
POST /deals            — create deal
PUT  /deals/{id}       — update deal
GET  /activities       — list activities (meetings, calls, tasks)
POST /notes            — add a note to a deal/person/org
GET  /pipelines        — list pipelines and stages
GET  /stages           — list stages
```

## Filters & pagination

All list endpoints accept:
- `start=0&limit=100` — pagination (max 500)
- `filter_id=` — saved Pipedrive filter ID
- `status=open|won|lost|all_not_deleted` (deals)

Response envelope:
```json
{
  "success": true,
  "data": [...],
  "additional_data": { "pagination": { "next_start": 100 } }
}
```

---

## Rate limits (2026)

Token-Based Rate Limit (TBRL) system. Burst: 100 req/10s. Daily cap varies by plan. Check `X-RateLimit-Remaining` response header.

---

## Claude Code MCP option

```bash
claude mcp add pipedrive --url https://mcp.pipedrive.com/mcp \
  -e PIPEDRIVE_API_TOKEN=your_token
```

Check https://developers.pipedrive.com for official MCP server status.

---

## Script option (Python)

```python
import requests

API_TOKEN = "your_token"
BASE = "https://api.pipedrive.com/v1"

def get_open_deals():
    r = requests.get(f"{BASE}/deals", params={"api_token": API_TOKEN, "status": "open"})
    return r.json()["data"]
```

Save your token in `.env` as `PIPEDRIVE_API_TOKEN`.
