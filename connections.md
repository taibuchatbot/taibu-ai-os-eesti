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

**Eesti turu soovitused:**
- Tulu/Raamatupidamine: [Merit Aktiva](references/merit-aktiva-api.md) — Eesti populaarseim raamatupidamistarkvara
- Maksed: [Montonio](references/montonio-api.md) — pangalink, kaardimaksed, järelmaks
- CRM: [Pipedrive](references/pipedrive-api.md) — Eestis asutatud CRM, globaalselt kasutusel

Uue tööriista ühendamisel salvesta ka `references/{tööriist}-api.md` — dokumenteeri API lõpp-punktid, auth ja tüüpilised päringud üks kord, kasuta igavesti.
