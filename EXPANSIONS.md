# LAIENDUSED — mida lisada kasvades

Tööriistakomplekt on tahtlikult minimaalne. Kolm oskust, kuus kausta, üks raamistiku viide. See on kõik. Kasutades hakkad alusest välja kasvama — see juhend ütleb, mida lisada, millal ja miks.

Taibu AI OS struktuur peaks sarnanema hästi juhitud väikeettevõttele. Mitte hoiuruumile.

---

## Mis on komplektis (ära eemalda)

| Kaust / fail | Eesmärk |
|---|---|
| `context/` | Sinust, sinu ärist, sinu prioriteetidest. Täidetud `/onboard` poolt. |
| `references/` | Raamistikud, häälenäidised, API juhendid, SOPid kasvades. |
| `decisions/log.md` | Otsuste logi. |
| `archives/` | Vanad failid. Ära kustuta — tõsta siia. |
| `connections.md` | Register kõikidest ühendatud süsteemidest. |
| `.claude/skills/` | Oskused: `/onboard`, `/audit`, `/level-up`. Lisa juurde `/level-up` kaudu. |
| `aios-intake.md` | `/onboard` allikas. Muuda ja käivita uuesti igal ajal. |
| `CLAUDE.md` | Peamine käitamisjuhend. Täidetud `/onboard` poolt. Muuda kui roll/hääl muutub. |

---

## Mida lisada kasvades

| Kaust / fail | Lisa siis, kui | Miks |
|---|---|---|
| `projects/` | Juhid 2+ käimasolevat projekti oma kontekstiga | Aktiivsed projektid vajavad eraldatud konteksti |
| `templates/` | Kopeerid samu prompte või dokumendimalle | Korduvkasutatavad lähtepunktid; vähendab kaldumist |
| `brand-assets/` | Lood visuaalset sisu (karussellid, slaidid, pildid) | Tsentraliseerib logod, värvid, fondid — AI ulatub siia, mitte ei arva |
| `references/sops/` | Dokumenteerid korduvate protsesside toimimist | SOPid, mida AI loeb asjade järjepidevaks tegemiseks |
| `references/{tööriist}-api.md` | Ühendad uue API või MCP ja saad aru, kuidas see töötab | Uuritud üks kord, salvestatud igavesti. `/audit` premeerib seda. |
| `scripts/` | Kirjutad Python/Bash skripte API-de jaoks | Enamiku inimeste teine ühendus on skript, mitte MCP |
| `.claude/agents/` | Vajad abilist korduvateks mitme-sammuliseks uurimiseks/kirjutamiseks | Agendid töötavad odavamatel mudelitel oma kontekstis — hoia põhiseanss kerge |
| Ala-OS kaustad (nt `youtube-os/`) | Sul on vertikaalimine oma andmete, tabelite, transkriptsioonidega | Eraldamise muster — vertikaalsed töövood saavad oma käitamisjuhendi |

---

## Soovituslikud kadentsid

Millal iga pind rutiinselt puutub:

- `decisions/log.md` — iga tähenduslik otsus (`/level-up` 2. faas jäädvustab need automaatselt)
- `archives/` — kvartalipuhastus; tõsta aegunud projektid, aegunud oskused, vanad sisestusversioonid
- `references/sops/` — kui protsess käivitatakse uue inimese poolt, kirjuta SOP
- `connections.md` — iga kord, kui uus tööriist ühendatakse, lisa rida
- `references/{tööriist}-api.md` — samal ajal `connections.md` uuendamisega; jäädvusta API üks kord
- `CLAUDE.md` — kvartalireview; kirjuta persona/prioriteetide osa pärast `/level-up` K90 ümber

---

## Eesti turu laiendusrajad

Komplekt sisaldab juba EE finantsvirna API juhendeid (`references/merit-aktiva-api.md`, `montonio-api.md`, `pipedrive-api.md`). Siin on tüüpilised järgmised sammud Eesti väikeettevõttele, prioriteetsuse järjekorras:

| Vajadus | Tööriist Eestis | Mehhanism | Kust alustada |
|---|---|---|---|
| Raamatupidamine + e-arve | Merit Aktiva | `skript` + `.env` | `references/merit-aktiva-api.md` |
| Maksed (pangalink) | Montonio | `skript` + `.env` | `references/montonio-api.md` |
| CRM / müügitoru | Pipedrive | `skript` või `mcp` | `references/pipedrive-api.md` |
| Reklaam (suurim kanal EE-s) | Meta (Facebook/Instagram) Ads | `skript` | `npx skills find facebook ads` |
| Analüütika / jälgimine | Google Tag Manager + GA4 | `skript` (teenusekonto) | `npx skills find tag manager` |
| E-arve operaator | Omniva / Telema / Unifiedpost | `skript`/`eksport` | operaatori dokumentatsioon |
| Riiklikud andmed | Äriregister, EMTA/KMKR | `skript` | avaandmete API |

**Mandaadid:** kõik võtmed lähevad `.env` faili (vt `.env.example` — kopeeri see `.env`-ks ja täida). `.env` on `.gitignore`-s, nii et võtmeid ei laeta kunagi GitHubi.

---

## Oskuste leidmine ja lisamine (`/find-skills`)

Komplekt jääb tahtlikult minimaalseks — 3 põhioskust + `find-skills`. Selle asemel et kõik oskused ette laadida, **tõmba neid nõudmisel**:

```bash
npx skills find facebook ads        # otsi oskust märksõna järgi
npx skills add <owner/repo@oskus>   # paigalda oskus
npx skills check                    # kontrolli uuendusi
```

Või küsi lihtsalt Claude'ilt "leia mulle oskus X jaoks" ja `/find-skills` oskus juhendab. Sirvi: https://skills.sh

### Soovituslikud oskused Eesti ärile

Need on üldised, läbiproovitud oskused (`vercel-labs/agent-skills`, 100k+ paigaldust). **Me ei kaasa neid malli** — neid hoitakse upstreamis värskena ja sa paigaldad ainult need, mida vajad. Üks käsk:

```bash
npx skills add vercel-labs/agent-skills@copywriting      # müügiteksti kirjutamine (avaleht, maandumisleht)
npx skills add vercel-labs/agent-skills@cro              # konversioonimäära optimeerimine
npx skills add vercel-labs/agent-skills@ab-testing       # A/B testide planeerimine
npx skills add vercel-labs/agent-skills@facebook-ads     # Meta reklaamikampaaniate strateegia + copy
npx skills add vercel-labs/agent-skills@modern-web-design # veebidisaini juhend
```

Paaritu need vastavate API juhenditega: `facebook-ads` oskus + `references/meta-ads-api.md` ühenduseks; `cro`/`copywriting` + `references/gtm-api.md` mõõtmiseks.

**Näide reaalsest instantsist:** näidisettevõte (Z500) ehitas selle malli peale just sellise turundusvirna — ülaltoodud oskused pluss Meta Marketing API ja GTM skriptid `scripts/` kaustas. Skriptid ise olid **instantsi-spetsiifilised** (kõvakodeeritud reklaamikontod, GTM konteiner) — seetõttu malli kaasame **ühenduse juhendid** (`references/*-api.md`), mitte kõvakodeeritud skripte. Sinu ettevõte kirjutab skriptid oma kontode vastu juhendi põhjal.

---

## Automaatne commit + push (valikuline)

Kui tahad, et muudatused salvestuksid GitHubi automaatselt (et sa ei unustaks pärast redigeerimist), saad lisada Claude Code "Stop" hook'i. **See on võimas mehhanism — käivitab `git push` automaatselt**, seega aktiveeri see teadlikult ja ainult oma masinal `.claude/settings.local.json` kaudu (mitte jagatud `settings.json`-is). Vt README jaotist "Automaatne salvestamine".

---

## Mida MITTE lisada

Antimustrid. Need tunduvad kasulikud, kuid rikuvad struktuuri:

- **Ära dumpi tooreid e-maile/Slacki arhiive `references/`-sse.** Wiki ei ole dokumendikuhi. Ainult tõlgendatud faktid.
- **Ära ehita kaustade-kaustades organiseerimisteatrit.** Lame hea nimetusega parem kui sügav pesastamine.
- **Ära lisa `notes/`, `misc/`, `tmp/` ega `inbox/`.** Kalmistud. Kasuta `archives/` kui see on vana, kirjuta õige fail õigesse kohta kui see on uus.
- **Ära loo eelnevalt kaustu, mida pole veel vaja.** Tühjad kaustad on müra.
- **Ära hoia paralleelselt `decisions.md` ja `decisions/log.md`.** Vali üks.
- **Ära harutu käitamisjuhendit.** Üks `CLAUDE.md` juurtes.

---

## Kuidas tead, millal on aeg kausta lisada

Küsi kolm küsimust:

1. **Kas see on kontseptuaalselt uus?** Või sobib see kuskile olemasolevasse?
2. **Kas puutan seda 3+ korda järgmise kuu jooksul?** Kui mitte, on see ennatlik.
3. **Kas `/level-up` saaks tulevase oskuse siia suunata loomulikult?** Kui jah, kasutab AI seda.

Kaks "jah" = lisa. Üks "jah" = oota.

---

> *Sinu Taibu AI OS struktuur peaks sarnanema hästi juhitud väikeettevõttele — mitte hoiuruumile. Kui ei leia midagi üles, on see signaal konsolideerida, mitte lisada veel üks kaust.*
