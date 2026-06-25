# Ühendused

Register kõikidest süsteemidest, millele sinu Taibu AI OS ligi pääseb. Täidetud `/onboard` poolt K4-K7 vastuste põhjal; laiendatakse aja jooksul uute tööriistade ühendamisel. `/audit` kontrollib seda faili domeenide katvuse ja värskuse osas.

| # | Domeen | Tööriist | Mehhanism | Auth | Viimati kontrollitud |
|---|---|---|---|---|---|
| 1 | Tulu / Raamatupidamine | _täidetud /onboard poolt_ | pole veel ühendatud | — | — |
| 2 | Kliendisuhted | _täidetud /onboard poolt_ | pole veel ühendatud | — | — |
| 3 | Kalender | _täidetud /onboard poolt_ | pole veel ühendatud | — | — |
| 4 | Kommunikatsioon | _täidetud /onboard poolt_ | pole veel ühendatud | — | — |
| 5 | Projektid / ülesanded | _täidetud /onboard poolt_ | pole veel ühendatud | — | — |
| 6 | Koosolekud / märkmed | _täidetud /onboard poolt_ | pole veel ühendatud | — | — |
| 7 | Teadmus / failid | _täidetud /onboard poolt_ | pole veel ühendatud | — | — |

**Mehhanismi valikud:** `mcp` (MCP server), `skript` (Python/Bash API kaudu, `scripts/` kaustas), `eksport` (CSV/JSON dump), `võti+viide` (`.env` võti + `references/{tööriist}-api.md` juhend), `pole veel ühendatud`.

**Eesti turu soovitused ja valmis ühenduse juhendid:**

| Domeen | Tööriist | Juhend | Mehhanism |
|---|---|---|---|
| Tulu / Raamatupidamine | Merit Aktiva | [merit-aktiva-api.md](references/merit-aktiva-api.md) | `skript` + `.env` |
| Maksed | Montonio | [montonio-api.md](references/montonio-api.md) | `skript` + `.env` |
| CRM / müük | Pipedrive | [pipedrive-api.md](references/pipedrive-api.md) | `skript` / `mcp` |
| Reklaam (suurim EE kanal) | Meta (Facebook/Instagram) Ads | [meta-ads-api.md](references/meta-ads-api.md) | `skript` + `.env` |
| Reklaam (otsing) | Google Ads | [google-ads-api.md](references/google-ads-api.md) | `skript` + `.env` |
| Analüütika / jälgimine | Google Tag Manager | [gtm-api.md](references/gtm-api.md) | `skript` (teenusekonto) |
| Kommunikatsioon | Gmail | [gmail-api.md](references/gmail-api.md) | `mcp` (lihtne) / `skript` |
| Teadmus / failid | Google Drive | [google-drive-api.md](references/google-drive-api.md) | `mcp` (lihtne) / `skript` |

Lihtne reegel: **Gmail ja Drive** ühenda esmalt MCP kaudu (paari klikiga, võtmeid pole vaja). **Merit, Montonio, Pipedrive, Meta, Google Ads, GTM** vajavad API võtmeid → `.env` fail.

Mandaadid lähevad `.env` faili (vt `.env.example`). Vastavad turundusoskused (strateegia + copy) paigalda nõudmisel — vt `EXPANSIONS.md` jaotist "Soovituslikud oskused Eesti ärile". Uue tööriista ühendamisel salvesta ka `references/{tööriist}-api.md` — dokumenteeri API lõpp-punktid, auth ja tüüpilised päringud üks kord, kasuta igavesti.
