# Make.com — automatiseeringute juhend (Eesti keeles)

**Tüüp:** No-code automatiseerimisplatvorm — ühendab rakendusi visuaalsete "stsenaariumitega" (scenarios) ilma koodita.
**Miks Eestis:** Populaarne EE väikeettevõtetes, sest seob Montonio, Pipedrive, Merit Aktiva, Gmail, Google Sheets jne ilma programmeerimata. Hea "liim" tööriistade vahel.
**Dokumentatsioon:** https://www.make.com/en/help ja https://developers.make.com
**Põhiidee siin:** lase Claude'il / Claude Code'il **genereerida Make.com blueprint JSON fail**, mille impordid otse Make'i — nii ehitad automaatika minutitega, mitte ei lohista mooduleid käsitsi.

---

## Põhimõisted

| Mõiste | Selgitus |
|---|---|
| **Scenario** (stsenaarium) | Üks automaatika-vorm: käivitaja + sammud. Nt "uus makse → loo arve". |
| **Module** (moodul) | Üks samm stsenaariumis (nt "Gmail → saada e-mail"). |
| **Trigger** (käivitaja) | Esimene moodul — paneb stsenaariumi käima. Kaks tüüpi: *instant* (webhook) või *polling* (kontrollib iga X minuti tagant). |
| **Connection** (ühendus) | Salvestatud autentimine ühe rakenduse jaoks (OAuth / API võti). Luuakse Make'is, mitte blueprintis. |
| **Webhook** | Unikaalne URL, kuhu väline süsteem saadab andmeid (nt veebivorm → Make). |
| **Router** | Hargnemine — saadab andmed mitmesse haru. |
| **Filter** | Tingimus moodulite vahel ("ainult kui summa > 100€"). |
| **Mapping** | Eelmise mooduli väljundi sidumine järgmise sisendiga (`{{1.email}}`). |
| **Blueprint** | Kogu stsenaarium **JSON failina** — eksporditav ja imporditav. **See on see, mida me genereerime.** |

---

## Blueprint JSON struktuur

Make stsenaariumi blueprint näeb välja umbes nii (lihtsustatud):

```json
{
  "name": "Montonio makse -> Merit arve",
  "flow": [
    {
      "id": 1,
      "module": "gateway:CustomWebHook",
      "version": 1,
      "parameters": { "hook": 0, "maxResults": 1 },
      "mapper": {},
      "metadata": { "designer": { "x": 0, "y": 0 } }
    },
    {
      "id": 2,
      "module": "http:ActionSendData",
      "version": 3,
      "parameters": {},
      "mapper": {
        "url": "https://aktiva.merit.ee/api/v1/sendinvoice",
        "method": "post",
        "body": "{{1.amount}}"
      },
      "metadata": { "designer": { "x": 300, "y": 0 } }
    }
  ],
  "metadata": {
    "version": 1,
    "scenario": { "roundtrips": 1, "maxErrors": 3, "autoCommit": true },
    "designer": { "orphans": [] }
  }
}
```

**Olulised väljad:**
- `flow[]` — moodulite järjekord. Iga moodul: `id`, `module` (tüüp), `parameters` (seaded), `mapper` (sisendid + mapping), `metadata.designer` (asukoht lõuendil).
- `module` — moodli tüübi nimi, nt `gateway:CustomWebHook`, `http:ActionSendData`, `google-email:ActionSendEmail`, `util:SetVariable`.
- `{{1.field}}` — mapping eelmise mooduli (id=1) väljundist.

> ⚠️ **Aus hoiatus:** rakenduse-spetsiifiliste moodulite (Pipedrive, Gmail jne) täpsed `module` nimed ja parameetrid on Make'i sisemised ega ole avalikult täielikult dokumenteeritud. Seetõttu on **kõige usaldusväärsem töövoog:**

---

## Soovituslik töövoog (kõige usaldusväärsem)

### Variant A — Ekspordi-ja-kohanda (rakenduse-spetsiifiliste moodulite jaoks)
1. Ehita Make'is **minimaalne** stsenaarium käsitsi (lisa õiged moodulid, ära seadista lõpuni).
2. Stsenaariumi menüü (kolm täppi all) → **Export Blueprint** → salvesta JSON.
3. Anna see JSON Claude'ile kui **näidismall** ja palu: "kohanda see nii, et… / lisa samm, mis…".
4. Claude tagastab muudetud blueprint JSON-i → **Import Blueprint** Make'is.

See annab Claude'ile täpsed moodulinimed ja parameetrid, mida kohandada — null oletamist.

### Variant B — Nullist skelett (lihtsate üldmoodulite jaoks)
Webhook → HTTP → Router → Filter → SetVariable moodulid on stabiilsed ja üldised. Neist saab Claude blueprinte nullist genereerida usaldusväärselt. Hea muster:
**Webhook (trigger) → HTTP päring sinu API-le → tingimuslik haru.**
Nt Montonio webhook → HTTP POST Merit Aktiva `sendinvoice` lõpp-punkti (vt `references/merit-aktiva-api.md`).

**Reegel:** rakenduse natiivmoodul = Variant A. Üldine HTTP/webhook loogika = Variant B.

---

## Ühendus (Make API — valikuline)

Enamasti ehitad stsenaariume Make'i veebiliideses ja impordid blueprinte käsitsi. Kui tahad Make'i **programmaatiliselt** juhtida (stsenaariume luua/käivitada API kaudu):

- **Dokumentatsioon:** https://developers.make.com/api-documentation
- **Auth:** API token (Make → Profile → API → Generate token)
- **Baas-URL sõltub tsoonist:** `https://eu1.make.com/api/v2` või `https://eu2.make.com/api/v2` (vaata oma konto URL-i)

```
POST /scenarios            — loo stsenaarium (blueprint kehas)
POST /scenarios/{id}/run   — käivita stsenaarium
GET  /scenarios/{id}       — loe stsenaariumi
```

### `.env`
```
MAKE_API_TOKEN=
MAKE_ZONE=eu2                 # eu1 / eu2 / us1 — vaata oma Make URL-i
MAKE_TEAM_ID=
```

---

## Eesti-spetsiifilised automaatika-näited

Tüüpilised stsenaariumid EE väikeettevõttele (genereeri blueprint `/make-blueprint` oskusega):

| Käivitaja | Tegevus | Seotud juhend |
|---|---|---|
| Montonio makse õnnestus (webhook) | Loo + saada arve Merit Aktivas | `montonio-api.md`, `merit-aktiva-api.md` |
| Veebivorm täidetud (webhook) | Loo lead Pipedrive'is + teavita Gmailis | `pipedrive-api.md`, `gmail-api.md` |
| Pipedrive tehing võidetud | Loo Merit Aktiva arve + Slack/Gmail teade | `pipedrive-api.md`, `merit-aktiva-api.md` |
| Uus Merit arve | Lisa rida Google Sheetsi (tuluraport) | `merit-aktiva-api.md` |
| Iga päev kl 8 (ajastus) | Kogu Meta + Google Ads kulu → e-mail kokkuvõte | `meta-ads-api.md`, `google-ads-api.md` |

---

## Turvalisus ja Jalgratta meetod

- **Testi alati esmalt.** Pärast blueprinti importi käivita stsenaarium käsitsi (Run once) ja vaata väljundit, enne kui aktiveerid ajastuse.
- **Käivitaja PAUSED.** Hoia uus stsenaarium välja lülitatud, kuni oled ühe käivituse üle vaadanud (vt `references/3ms-framework.md` — Jalgratta meetod, L0→L4).
- **Ühendused jäävad Make'i.** Blueprint EI sisalda sinu API võtmeid — ühendused (OAuth/võtmed) lood Make'is eraldi. Seega on blueprint JSON-i ohutu jagada ja versioonihaldusesse panna.
- Salvesta genereeritud blueprintid `make-blueprints/` kausta (oskus loob selle).
