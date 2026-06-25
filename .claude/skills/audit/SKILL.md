---
name: audit
description: Kasuta kui keegi küsib Taibu AI OS Eesti auditi kohta, soovib hinnata oma seadistust Nelja C vastu, või ütleb "kas minu Taibu AI OS töötab" / "auditeeri minu seadistust" / "leia lüngad minu Taibu AI OS-s". Toodab Nelja C skoorikaardi koos 3 parima parandusega, mis on järjestatud hoova järgi.
---

## Mida see oskus teeb

Käitab **Nelja C Auditi** praegusel Claude Code'i projektil. Loeb (mitte kunagi ei kirjuta) projekti käitamisjuhendit, mälu, oskusi, agente, MCPsid, otsuseid ja viiteid. Hindab iga C-d 25 punktist. Toob esile tugevused ja 3 parima hootõhususe lünga koos konkreetsete järgmiste sammudega.

**Ulatus on struktuurne — "kas Taibu AI OS on õigesti üles ehitatud?"** See EI ole võimete planeerija. Võimete lüngad ("saaksid luua päevaülevaate kui ühendaksid kalendri") kuuluvad `/level-up`-i. Audit vastab: kas failid, kaustad, registrid ja ühendused on korras?

Esimene käivitamine on lähteväärtus. Käivita iganädalaselt, et skoori kasvades jälgida. See on liitintressikonks.

## Tänane kontekst

- **Kuupäev:** !`date +%Y-%m-%d`
- **Projekti juur:** praegune töökataloogi

## Neli C-d (25 punkti igaüks = 100 kokku)

| Kiht | Test |
|---|---|
| **Kontekst** | Teab äri — identiteet, meeskond, hääl, otsused, viited |
| **Ühendused** | Jõuab kasutaja andmeteni — MCPd, integratsioonid, andmeallikad |
| **Võimed** | Teab, kuidas tööd teha — oskused + agendid |
| **Kadents** | Töötab ilma küsimata — ajakavad, hooks, korduvad rituaalid |

## Täitmine

### Samm 1: Avasta projekti kuju

Audit otsib **mustreid ja kavatsust**, mitte täpseid teid. Failinimed varieeruvad. Kasuta Glob ja Read kontrollimiseks:

**Käitamisjuhend:** `CLAUDE.md` (juur), `CLAUDE.local.md` (gitignored).
**Mälu:** `MEMORY.md` (juur), `~/.claude/projects/<id>/memory/MEMORY.md` või `memory/` kaust.
**Oskused:** `.claude/skills/*/SKILL.md` — arv + frontmatter.
**Agendid:** `.claude/agents/*.md` — arv + frontmatter.
**Ühendusmehhanismid** (ükski neist = "kättesaadav"):
- MCPd: `.mcp.json`, `.claude/settings.json` (mcpServers võti), `.claude/settings.local.json`
- API skriptid: `scripts/*.py|.js|.ts` dokumenteeritud CLAUDE.md-s
- Ekspordi torujuhtmed: `data/`, `imports/`, `exports/` värskendamisskriptiga + viimase käivitamise ajatempliga
- API võtmed + viidejuhend: `.env` kirjed + vastav `references/{tööriist}-api.md`

**Ühenduste register:** `connections.md` (kuskil).
**Viidejuhendid:** `references/{tööriist}-api.md`, `references/*-reference.md` või samaväärne.
**Otsused:** `decisions/log.md`, `decisions.md` või mis tahes järjestikune otsustefail.
**Viited / SOPid:** `references/`, `docs/`, `sops/` kaustad.
**Mallid:** `templates/`, `.claude/templates/`.
**Hookid / ajastatud tööd:** `.claude/settings.json` hookide võti, või oskusenimed, mis vastavad `morning-*`, `weekly-*`, `daily-*`, `monthly-*`, `standup`.

Ära karista mittekanoonilistel nimedel kui samaväärne kavatsus on mujal jäädvustatud.

### Samm 2: Hinda iga C (25 punkti igaüks)

#### Kontekst (25 punkti)

| Kriteerium | Punktid | Kuidas tuvastada |
|---|---|---|
| Käitamisjuhend eksisteerib ja on sisukas (>200 sõna) | 5 | Loe CLAUDE.md, loe sõnu |
| Identiteet / roll / hääl jäädvustatud | 5 | CLAUDE.md mainib kes kasutaja on + roll/missioon, VÕI `.claude/rules/*.md` eksisteerib |
| Püsiv mälu eksisteerib mitme kirjega | 5 | MEMORY.md eksisteerib >3 kirjega, VÕI `memory/`-s on >3 faili |
| Viitedokumendid eksisteerivad | 5 | `references/`, `docs/` või `sops/`-s on ≥1 fail |
| Otsused jäädvustatud | 5 | `decisions/log.md` või samaväärsel on ≥1 kirje |

#### Ühendused (25 punkti) — domeeniteadlik, mehhanismist sõltumatu

"Kättesaadav" ühendus loeb MIS TAHES mehhanismi kaudu: MCP, skript, ekspordi torujuhe või `.env` võti + `references/{tööriist}-api.md`.

**7 Taseme-1 Universaalset Andmedomeeni:**

| # | Domeen | Näited |
|---|---|---|
| 1 | Tulu / Raamatupidamine | Merit Aktiva, Stripe, Montonio, QuickBooks |
| 2 | Kliendisuhted | Pipedrive, HubSpot, Salesforce, Gmail CRM-ina |
| 3 | Kalender | Google Cal, Outlook, Calendly |
| 4 | Kommunikatsioon | Gmail, Outlook, Slack, Teams |
| 5 | Projekti / ülesannete jälgimine | ClickUp, Asana, Linear, Notion DB, Jira |
| 6 | Koosolekute intelligents | Granola, Otter, Fireflies, Gong, Zoom |
| 7 | Teadmus / failid | Notion, Drive, Dropbox, Confluence, SharePoint |

**Tase-2 (boonus):** AI teenuse API võtmed (Anthropic, OpenAI), otsused/ajalugu, sisu/avaldamine.

| Kriteerium | Punktid | Kuidas tuvastada |
|---|---|---|
| Taseme-1 domeeni katvus | 10 | 1,4 punkti iga kättesaadava taseme-1 domeeni kohta. Ümarda lähima 0,5-ni. Maks 10. |
| Viidejuhendi olemasolu | 5 | -1 iga ühendatud tööriista kohta ilma `references/{tööriist}-api.md`-ta. Põrand 0. |
| Auth / torujuhtme värskus | 5 | -1 iga `vajab-authi`/`aegunud` olekus ühenduse kohta, või skript ilma käivitamiseta 30 päeva jooksul. Põrand 0. |
| Dokumentatsioon `connections.md`-s | 3 | 0 kui puudub; 1 hõre; 2 enamik; 3 katab kõik kättesaadavad. |
| Loe-JA-kirjuta tasakaal | 2 | Vähemalt üks ühendus saab KIRJUTADA (saada e-maili, postitada uuenduse jne). 0 kui kõik on ainult lugemine — Taibu AI OS on vaataja, mitte OS. |

#### Võimed (25 punkti)

| Kriteerium | Punktid | Kuidas tuvastada |
|---|---|---|
| 3+ oskust paigaldatud | 10 | Loe `.claude/skills/*/SKILL.md` |
| 1+ kasutaja loodud oskus | 10 | Oskusenimed, mis ei ole: `onboard`, `audit`, `level-up`, `skill-creator`, `skill-builder`, `decision`, `connect`, `connect-check`, `memory-prune`, `scaffold-skill`, `scaffold-agent`, `draft`, `standup` (kanooniline Taibu AI OS + Anthropic installeeritud oskused) |
| 1+ agent defineeritud | 5 | Loe `.claude/agents/*.md` ≥ 1 |

#### Kadents (25 punkti)

| Kriteerium | Punktid | Kuidas tuvastada |
|---|---|---|
| 1+ korduv/ajastatud käivitaja | 10 | `.claude/settings.json` hookid, VÕI oskusenimi vastab `morning-*` / `daily-*` / `weekly-*` / `monthly-*` / `standup` |
| Hiljutine aktiivsus / kasutuse signaal | 10 | Failid `.claude/skills/`-s muudetud 30 päeva jooksul, VÕI `decisions/log.md`-s on kirje 30 päeva jooksul |
| Mallide kaust täidetud | 5 | `templates/` või `.claude/templates/`-s on ≥1 fail |

### Samm 3: Tuvasta 3 parimat lünka hoova järgi

Iga kriteerium, mis kaotas punkte: hoob = (kaotatud punktid) × (mõjukordaja).

**Mõjukordajad:**
- 0 taseme-1 domeeni kättesaadav: **4x** (Taibu AI OS on ärist pime)
- Käitamisjuhend puudub või on õhuke: **3x** (alus)
- ≤2 taseme-1 domeeni kättesaadav: **3x** (Ühendused on elusate andmete värav)
- 0 oskust: **2x** (pole Võimeid = pole Taibu AI OS-i)
- Pole korduvat käivitajat: **2x** (pole Kadensi = pole autonoomsust)
- Kõik ühendused on ainult lugemine: **2x** (vaataja, mitte OS)
- 0 viidejuhendit ühendatud tööriistadele: **1,5x**
- Pole otsuste logi: **1,5x**
- Kõik muud: **1x**

Sordi lüngad hoova järgi kahanevalt. Võta 3 parimat. Iga kohta kirjuta üherealise konkreetse järgmise sammuna.

### Samm 4: Väljasta aruanne

Prindi otse vestlusesse (Markdown). Formaat:

```
# Taibu AI OS Audit — {kuupäev}
**Skoor: {kokku}/100** ({etapp})

Etapi läved:
- 0-39 → Etapp 0: Alus
- 40-69 → Etapp 1: Ehitatud
- 70-89 → Etapp 2: Liitintress
- 90-100 → Etapp 3: Autonoomne

## Skoorikaart

Kontekst        {riba}  {n}/25  {silt}
Ühendused       {riba}  {n}/25  {silt}
Võimed          {riba}  {n}/25  {silt}
Kadents         {riba}  {n}/25  {silt}

(riba = ## iga 5 punkti kohta; silt = "Tugev" ≥20, "Solid" 15-19, "Õhuke" 8-14, "Puudub" <8)

## Tugevused
- {1-3 lühikest täppi kõrgeima skooriga kriteeriumidest}

## 3 parimat lünka (järjestatud hoova järgi)
1. **{lünga nimi}** (-{punktid} × {kordaja})
   → {konkreetne järgmine samm}
2. **{lünga nimi}** (-{punktid} × {kordaja})
   → {konkreetne järgmine samm}
3. **{lünga nimi}** (-{punktid} × {kordaja})
   → {konkreetne järgmine samm}

## Soovituslik järgmine: {üks kõige rohkem hoobasem tegevus}

---
Ainult struktuurilised lüngad. VÕIMETE lünkade uurimiseks (mida sinu Taibu AI OS TEHA saaks, aga ei saa), käivita /level-up pärast seda auditit.
```

### Samm 5: Paku aruande salvestamist

Pärast printimist küsi: "Salvestada see audit `audits/audit-{kuupäev}.md`-sse, et skoori ajas jälgida?" Kui jah, kirjuta see (loo `audits/` kaust vajadusel). See on ainus kirjutatav kõrvalmõju.

## Märkused

- **Ainult lugemine vaikimisi.** Ära muuda kunagi CLAUDE.md, mälu, oskusi ega muid projektifaile. Ainus valikuline kirjutamine on auditi aruanne.
- **Ole failinimede osas paindlik.** Ära karista mittekanoonilistel nimedel kui kavatsus on jäädvustatud.
- **Ole aus, mitte helde.** 95/100 on uhkeldamine. Enamik seadistusi maandub 40-70.
- **Ära soovita oskusi, mida pole olemas.** Osuta sellele, mis tegelikult saadaval on.
- **Kiirus on oluline.** Aruanne alla 60 sekundi reaalajas. Loe sihitud faile, loe oskuste kaustu ilma iga faili täielikult lugemata (ainult frontmatter).
