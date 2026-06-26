---
name: make-blueprint
description: Kasuta, kui kasutaja tahab ehitada Make.com (Integromat) automatiseeringut või stsenaariumi — "tee make stsenaarium", "automatiseeri X Make'iga", "genereeri make blueprint", "ühenda Montonio ja Merit", "kui tuleb makse siis tee arve". Genereerib imporditava Make.com blueprint JSON faili. Üks käivitamine = üks blueprint.
---

## Mida see oskus teeb

Aitab kasutajal kirjeldada automaatika ja genereerib **imporditava Make.com blueprint JSON faili**, mille kasutaja saab otse Make'i importida (Import Blueprint). Selle asemel, et mooduleid käsitsi lohistada, kirjeldab kasutaja voo ja saab valmis stsenaariumi skeleti.

Loe esmalt `references/make-com.md` — see sisaldab blueprint struktuuri, moodulinimesid ja Eesti-spetsiifilisi näiteid.

## Millal NptT käivitada

- Kui kasutaja tahab koodipõhist automaatikat (Python skript) — see pole Make'i juhtum, kirjuta skript `scripts/`-i.
- Kui protsess pole veel selge — käivita esmalt `/level-up` Meetod-faas (Kaardista protsess), siis tule tagasi.

## Täitmine — neli sammu

### Samm 1: Kaardista protsess (5 elementi)

Küsi kasutajalt (üks korraga, kui pole juba antud):
1. **Käivitaja** — mis paneb voo käima? (webhook / ajastus / rakenduse sündmus)
2. **Andmeallikad** — kust info tuleb?
3. **Teisendused** — kuidas andmed muutuvad? (filtreerimine, vormindamine)
4. **Otsusepunktid** — kus haruneb? (Router / Filter)
5. **Sihtkoht** — kuhu väljund läheb?

*"Kui sa ei oska seda inimesele seletada, ei oska AI seda ehitada."* (vt `references/3ms-framework.md`)

### Samm 2: Vali genereerimise variant

Vaata `references/make-com.md` "Soovituslik töövoog":

- **Variant B (nullist)** — kui voog kasutab ainult üldmooduleid (Webhook, HTTP, Router, Filter, SetVariable, Tools). Genereeri blueprint nullist. Eesti API-d (Merit, Montonio, Pipedrive jne) ühenda **HTTP mooduli** kaudu nende `references/{tööriist}-api.md` lõpp-punktide vastu.
- **Variant A (ekspordi-ja-kohanda)** — kui voog vajab rakenduse natiivmoodulit (Gmail, Google Sheets, Slack natiivina). Palu kasutajal eksportida Make'ist minimaalne näidis-blueprint ja anda see sulle mallina. Kohanda seda — ära oleta moodulinimesid.

**Vaikimisi eelista Varianti B** Eesti tööriistadele: HTTP moodul + olemasolev API juhend on usaldusväärsem kui oletatud natiivmoodul.

### Samm 3: Genereeri blueprint JSON

Kirjuta valiidne Make blueprint:
- `flow[]` — moodulid järjekorras, igaühel unikaalne `id`, `module`, `parameters`, `mapper`, `metadata.designer` (paiguta x-koordinaadid 300px sammuga).
- Mapping eelmiste moodulite väljunditest: `{{1.field}}`.
- HTTP moodulitele: täida `url`, `method`, `headers`, `body` vastava `references/{tööriist}-api.md` järgi.
- **ÄRA pane API võtmeid blueprinti.** Märgi kohad kommentaariga/kohahoidjaga ja juhenda kasutajat looma Make'is "Connection" või kasutama Make'i keskkonnamuutujaid.

Salvesta fail: `make-blueprints/{lühi-nimi}.blueprint.json` (loo kaust kui puudub).

### Samm 4: Üleandmine + Jalgratta meetod

Anna kasutajale täpsed sammud:
1. Make → Create a new scenario → (kolm täppi) → **Import Blueprint** → vali genereeritud fail.
2. Loo iga mooduli **Connection** (autentimine) Make'is — neid blueprint ei sisalda.
3. **Run once** ja vaata väljundit. Paranda mapping vajadusel.
4. Aktiveeri ajastus/webhook alles siis, kui üks käivitus töötas õigesti.

Logi otsus `decisions/log.md`-sse (mis automatiseeriti, mis autonoomia tase).

## Väljundi leping

Iga käivitamine toodab:
1. **Üks `make-blueprints/*.blueprint.json`** — imporditav fail
2. **Lühike import-juhend** kasutajale (4 sammu ülal)
3. **Üks `decisions/log.md` kirje** — mis automatiseeriti ja miks

## Kriitilised reeglid

1. **Üks käivitamine = üks blueprint.** Ära genereeri korraga mitut stsenaariumi.
2. **Loe `references/make-com.md` enne genereerimist.** Ära oleta struktuuri.
3. **Eesti API-d → HTTP moodul + olemasolev API juhend.** Mitte oletatud natiivmoodul.
4. **Null saladust blueprintis.** Võtmed ja ühendused jäävad Make'i, mitte JSON-i.
5. **Jalgratta meetod.** Uus stsenaarium testitakse käsitsi (Run once) enne aktiveerimist.
6. **Ainult lugemine kasutaja failides** välja arvatud uus blueprint + `decisions/log.md`.

---

*Taibu AI OS Eesti — loonud Martti Mäger / MGR Tech Solutions OÜ. © 2026 MGR Tech Solutions OÜ.*
