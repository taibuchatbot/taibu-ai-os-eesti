---
name: onboard
description: Kasuta Taibu AI OS Eesti 1. päeval, kui keegi ütleb "seadista mind", "alustame", "täida minu Taibu AI OS" või on just repo klooninud. Kombineeritud viisard — käitab 7-küsimuse intervjuu JA seadistab 1. päeva failistruktuuri lõpus. Idempotentne — käivita uuesti igal ajal pärast aios-intake.md muutmist.
---

## Mida see oskus teeb

Üks kombineeritud viisard. Loeb või kirjutab `aios-intake.md` (kanooniline sisestus), viib läbi 7-küsimuse intervjuu kui fail pole täidetud, seejärel seadistab 1. päeva failistruktuuri. Eraldi `/scaffold-from-intake` oskust pole — see on üks voog.

**Vau-moment:** lõpus soovita sulgemisprompt *"Proovi seda — küsi minult: millele peaksin sel nädalal keskenduma?"* Kasutaja käivitab selle üks kord. See on vau. Prompt ise istutab Mõtteviisi raamistiku (Vaikimisi Nihe) nende jaoks, et nad selle sisestaksid.

## Millal MITTE käivitada

- Kui kasutaja on juba onboardinud ja tahab värskendada: ikka käivita, aga jäta juba vastatud küsimused vahele (idempotentne).
- Kui kasutaja soovib lisada uue ühenduse: see pole onboarding — suuna nad otse `connections.md` muutmisele.

## Täitmine

### Samm 1: Loe sisestust

Loe `aios-intake.md`. Kontrolli, millised K1-K7 sektsioonid on täidetud vs. `[Sinu vastus siia]` kohahoidjatega.

- **Kõik täidetud** → jäta Samm 2 vahele, mine Samm 3-sse (seadistus).
- **Mõned täidetud** → küsi kasutajalt: "Näen, et K1, K3, K4 on vastatud. Kas täita ülejäänud nüüd, või seadistada olemasolevaga?" Nende otsus.
- **Mitte midagi täidetud (värske kloon)** → käivita Samm 2 vestluslikult.

### Samm 2: Intervjuu (7 küsimust, kõva piir)

Küsi ükshaaval. Kirjuta iga vastus kohe `aios-intake.md`-sse (et kasutaja saaks katkestuse korral jätkata).

**K1 — Kes sa oled, mida müüd, kellele müüd?**
Identiteet, pakkumine, ideaalne klient. Üks lõik kummagi kohta on sobiv.

**K2 — Kleebi 1-2 asja, mida oled hiljuti kirjutanud. Ära muuda neid.**
*See on ainus küsimus kõva reegli. Häälenäidised PEAVAD olema kleebitud, mitte vestluse käigus kirjutatud. Kui kasutaja hakkab kirjutama uut proosat, keeldu:*

> *"Stopp — kleebi see toorelt. Kui kirjutad selle siia meie vestluse ajal, on näidis juba meie vestluse poolt kujundatud. Ava oma viimane e-mail või LinkedIn postitus teises vahekaardis ja kleebi muutmata tekst. See on ainus reegel, mida ei saa paindada."*

Küsi kaht näidist. Üks e-mail, üks postitus. Või kaks kummaski.

**K3 — Mis on sinu 2-3 suurimat prioriteeti järgmiseks 90 päevaks?**
Kvartaliprioriteedid. Lükka tagasi, kui nad ütlevad "kasvatada äri" — pane nad nimetama arv, tähtaeg või tulemus.

**K4 — Kuhu tulu tegelikult laekub ja kus seda jälgitakse?**
Mitu vastust sobib. Kaardista Taseme-1 domeeni 1-sse (Tulu/Raamatupidamine).
Eesti valikud: Merit Aktiva (arveldus + raamatupidamine), Montonio (pangalink maksed).

**K5 — Kus räägid klientide, meeskonna ja välismaailmaga igapäevaselt?**
E-mail (Gmail/Outlook), Slack/Teams, DM-id. Kaardista domeenidesse 2 + 4.
Eesti valikud: Pipedrive CRM-iks.

**K6 — Kus asuvad koosolekusalvestused, märkmed ja olulised dokumendid?**
Kaardista domeenidesse 6 + 7.

**K7 — Mis ülesanne sööb sinu nädala ära ja kus jälgid tööd praegu?**
Jäädvusta top_pain (kasutatakse `/level-up` 14. päeval) + domeen 5 (ülesanded).

Domeen 3 (Kalender) järeldatakse automaatselt K5-st: Gmail → Google Cal; Outlook → Outlook Cal. Kinnita Samm 3-s.

### Samm 3: Seadista 1. päeva failistruktuur

Kui sisestus on valmis, genereeri need failid (või uuenda uuesti käivitamisel). Varukoopiad originaalidest `archives/intake-{AAAA-KK-PP-HHMM}/` kui need eksisteerivad.

1. **`context/about-me.md`** — K1-st (identiteet, roll) + K7-st (top_pain). Üks lühike lõik kummagi kohta.
2. **`context/about-business.md`** — K1-st (pakkumine, ideaalne klient) + K4-st (tulumuodel). Üks lõik.
3. **`context/priorities.md`** — K3-st. Nummerdatud loend, üks rida prioriteedi kohta.
4. **`references/voice.md`** — K2-st. Kleebi näidised sõna-sõnalt lühikese päisega, mis selgitab nende kasutust ("Kasuta seda registrit mustandites; ära võltsida häält välise sisu jaoks ilma mulle näitamata").
5. **`connections.md`** — täida 7-rea tabel K4-K7 vastustest. Iga rida saab `mehhanism: pole veel ühendatud`, `auth: —`, `viimati kontrollitud: —`. Kasutaja ühendab tööriistad 2. päeval.
6. **`CLAUDE.md`** — täida kõik `{{...}}` kohahoidjad. Asenda kasutaja nimi, prioriteet, hääleregistri kokkuvõte, ühenduste lühikokkuvõte ja keel (küsi kui pole mainitud — "Eesti või inglise?").
7. **`.env`** — kui faili veel pole, loo see `.env.example` koopiana (`cp .env.example .env`). Ära küsi võtmeid Day-1-l — fail jääb tühjade kohahoidjatega. Seejärel **juhenda kasutajat lühidalt**: ütle, millised read tema K4-K7 vastuste põhjal täita tuleb (nt "Sa nimetasid Merit Aktiva ja Pipedrive — täida `MERIT_*` ja `PIPEDRIVE_*` read `.env`-s, ülejäänu jäta tühjaks"). Iga tööriista võtme hankimise juhend on vastavas `references/{tööriist}-api.md` failis. `.env` on `.gitignore`-s — võtmeid ei laeta kunagi GitHubi.

### Samm 4: Sulgemisekraan

Prindi üks ekraan. Maksimaalselt kolm rida:

```
✓ 1. päev tehtud. Sinu Taibu AI OS teab, kes sa oled, mida müüd, mis on prioriteedid ja kuidas kõlad.

Täna: küsi minult — "millele peaksin sel nädalal keskenduma?"
Homme: täida .env vajalike võtmetega ja ühenda üks tööriist connections.md-st (Gmail/Drive = MCP paari klikiga; Merit/Montonio/Pipedrive = API võti references/{tööriist}-api.md juhendi järgi).
7. päev: käivita /audit, et näha oma skoori.
```

Kui kasutaja käivitab sulgemispromoti ("millele peaksin sel nädalal keskenduma?"), vasta kasutades ainult uusi kontekstifaile. Hitti:
- 3-punktiline prioriteetide loend, nende hääleregistris K2-st
- Iga punkt on seotud 90-päeva prioriteediga K3-st
- Viimane rida: *"Kui peaksin ühte asja esmaspäevaks valima, oleks see [X], sest [põhjus prioriteetidest]. Kas soovid, et koostan esimese e-maili? Ja — kus saaks Vaikimisi Nihe siin rakenduda? Mil määral saaks AI-d sellel ülesandel kasutada?"*

Vaikimisi Nihe küsimus seob Mõtteviisi raamistiku enne kui `/level-up` selle ametlikult 14. päeval tutvustab.

## Kriitilised teostusreeglid

1. **7-küsimuse piir on läbirääkimatu.** Ära lisa vestlusesse K8-t.
2. **Hääle kleepimist ei saa vahele jätta.** Kui kasutaja kirjutab näidiseid vestluse ajal, keeldu ja palu kleepida pärisest kirjutisest.
3. **Ühekordne seadistus.** Pärast Samm 2 lõppu kirjuta Samm 3 failid ühe partiina. Ilma mitme-voorulise kinnituseta.
4. **Idempotentne.** Muudetud sisestusega uuesti käivitamine värskendab kontekstifaile; teeb varukoopiad originaalidest `archives/intake-{ts}/`. Jätab vahele juba vastatud küsimused, välja arvatud kui kasutaja soovib üle vaadata.
5. **Sulgemisekraan on kolm rida.** Mitte menüü.
6. **Ei genereerita lisaoskusi.** Ära seadista `/today`, `/draft`, `/connect` jne. Komplekt sisaldab 3 oskust; kasutaja loob rohkem `/level-up` kaudu.
7. **Ainult lugemine `references/3ms-framework.md`-s.** See on juba komplektis. Ära kirjuta üle.
8. **Ei kirjutata `.env`-i.** Ära küsi API võtmeid 1. päeval. Ühendused tulevad 2. päeval.

## Verificeerimine (teostajale)

- Külm test: klooni värske komplekt, käivita `/onboard`, täida 7 vastust, seadistus käivitatakse, küsi vau-prompt, vastus viitab K1 + K3 + K7-le spetsiifiliselt. Üldine = ebaõnnestumine.
- Idempotentsus: käivita `/onboard` uuesti ühe K3 prioriteediga muudetuna. Oodatav: ainult `context/priorities.md` ja `CLAUDE.md` prioriteedisektsioon uuenevad; varukoopia luuakse `archives/intake-{ts}/`.
- Hääle keeldumine: kirjuta näidis vestluse ajal. Oodatav: oskus keeldub, palub kleepida.

> *Taibu AI OS Eesti — loonud Martti Mäger / MGR Tech Solutions OÜ. © 2026 MGR Tech Solutions OÜ.*
