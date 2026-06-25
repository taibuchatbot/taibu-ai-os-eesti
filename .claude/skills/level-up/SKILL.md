---
name: level-up
description: Kasuta iganädalaselt ühe uue automatiseerimise leidmiseks ja teostamiseks. Käib läbi 3M-i intervjuu — Mõtteviis (leia kandidaat) → Meetod (defineeri üks) → Masin (ehita see). Käivita "tõuseme tasemele", "mida peaksin järgmiseks automatiseerima", "leia mulle sel nädalal hoob" peale, või reede rituaalina. Üks käivitamine = üks valminud artefakt.
---

## Mida see oskus teeb

Käib kasutajaga iganädalaselt läbi 3M-id, et leida ja teostada üks uus automatiseering. **Üks intervjuu = üks artefakt.** See installib ka 3M-i raamistiku kasutaja pähe aja jooksul — pärast 4-6 käivitamist hakkab kasutaja märkama võimalusi nädala keskel ilma meeldetuletuseta, sest küsimused on saanud sisemiseks vaikimisviisiks.

See on aju ümberjuhtimise mehhanism. Komplekt ei vaja käitumise ankurdamiseks cronjobe; see vajab `/level-up` käivitamist igal reedel.

## Mida `/level-up` EI OLE

- Mitte `/audit`. `/audit` on struktuurne ("kas Taibu AI OS on õigesti ehitatud?"). `/level-up` on funktsionaalne ("millist ärihooba mul puudu on?"). Käivita `/audit` esmalt kui struktuur on segane.
- Mitte mitme kandidaadi planeerija. Üks käivitamine = üks valminud artefakt.
- Mitte treener. Kasutaja teeb mõtlemise. Oskus viib intervjuu läbi.

## Millal `/level-up` käivitatakse

- **Esimene käivitamine: 14. päev.** Pärast seda, kui kasutaja on ühendanud ≥1 MCP/skripti ja käivitanud `/audit` üks kord. Varem annab triviaalseid tulemusi.
- **Kadents: iganädalaselt, reede pärastlõunal.** Vaata nädal üle, too esile üks automatiseering, teosta esmaspäeval.
- **Nõudmisel igal ajal.** Nädala keskel kui mõni käsitsitöö sügeleb.

## Sisendid, mida oskus loeb

- `context/priorities.md` — mida kasutaja ütles, et on oluline
- `context/about-me.md` — top_pain, roll
- `connections.md` — mis on kättesaadav, millise mehhanismi kaudu
- `references/3ms-framework.md` — raamistik (kasutatakse põhimõtete tagasi tsiteerimiseks)
- `decisions/log.md` — hiljutised otsused (mis on juba teostatud või kaalutud)
- `.claude/skills/*/SKILL.md` frontmatter — mis võimed eksisteerivad
- Hiljutine `audits/audit-{kuupäev}.md` kui olemas

## Täitmine — kolm faasi

### Faas 1 — Mõtteviisi intervjuu (leia kandidaat)

Too esile 1-3 kandidaati, järjestatud hoova järgi. Küsi need järjekorras, vestluslikult:

1. *"Kirjelda oma nädalat. Mida tegid 3+ korda?"* (sagedus)
2. *"Midagi, mis tundus käsitsi, igav või kopeeri-kleebi?"* (igavus)
3. *"Midagi, kus mõtlesid 'nutikas praktikant saaks sellega hakkama'?"* (delegeerimine)
4. *"Kui 500 uut klienti ilmuks homme, mis katki läheks esimesena?"* (kitsaskoht)
5. *"Mis annaks sulle 500 klienti juurde homme?"* (kasvuhoob)

Tsiteeri asjakohaseid Mõtteviisi põhimõtteid kui need sobivad:
- *"Tundub, et Vaikimisi Nihe rakendub — mil määral saaks AI-d siin kasutada?"*
- *"See on Funktsiooni Lahti Võtmine — sa ei automatiseeri tervet tööd, ainult selle ühe tüki."*
- *"AI on parem kui arvad ja paraneb kiiremini kui arvad. Kui see ei saanud seda eelmisel kvartalil teha, võib see nüüd valmis olla."*

**Faasi 1 väljund:** nummerdatud loend 1-3 kandidaatvõimalusest, üherealise "miks see on hoob" selgitusega kandidaadi kohta. Küsi: *"Vali üks defineerimiseks."*

### Faas 2 — Meetodi intervjuu (defineeri üks)

Kasutaja valib ühe kandidaadi. Käi läbi 5-sammuline Meetodi torujuhe:

**Samm 1 — Leia kitsaskoht.** Millist kitsaskohta see lahendab, või millist kasvuhooba avab? Seo tagasi Faasi 1 vastustega.

**Samm 2 — EAD: Elimineeri / Automatiseeri / Delegeeri.**
- **Kõigepealt Elimineeri:** *"Mis juhtub, kui lihtsalt lõpetame selle tegemise?"* Kui vastus on "mitte midagi ei katki" → oskus väljub rõõmsalt. *"Ära automatiseeri raiskamist."* See on võit, logi `decisions/log.md`-sse ja peatu.
- **Teiseks Automatiseeri:** rakenda 60/30/10 raami. ~60% deterministlik, ~30% AI-abi, ~10% käsitsi.
- **Kolmandaks Delegeeri:** kui liiga keeruline/muutlik/otsustemahukus → soovita inimest. Oskus väljub delegeerimissoovitusega, logi see.

**Samm 3 — Kaardista protsess.** Viis elementi:
- Käivitaja (mis paneb selle käima)
- Andmeallikad (kust info tuleb)
- Andmete teisendused (kuidas andmed muudavad kuju)
- Otsusepunktid (kus see hargneb)
- Sihtkoht (kuhu väljund läheb)

Kui kasutaja ei suuda ühtki viiest seletada: *"Kui ei suuda seletada inimesele, ei suuda seletada AI-le. Joonista see kõigepealt paberile, siis tule tagasi."* Oskus peatub.

**Samm 4 — Vali autonoomia tase.**

| Tase | Nimi | Mis juhtub |
|---|---|---|
| T0 | Käsitsi | Pole AI-d |
| T1 | Soovitatud | AI soovitab, inimene otsustab igal sammul |
| T2 | Mustandatud | AI koostab mustandid, inimene vaatab üle ja muudab |
| T3 | Järelevalvega | AI töötab, inimene valideerib perioodiliselt |
| T4 | Autonoomne | AI haldab algusest lõpuni |

**Vaikimisi = madalaim tase, mis probleemi lahendab.** Lükka tagasi T4, kui kasutaja ei ole selgesõnaliselt madalamaid tasemeid esmalt käitanud. *"Töövood on paremad kui agendid. Kui otsust EI PEA tegema AI, ära lase AI-l seda teha."*

**Samm 5 — Seo KPI-ga.** Millist Kolme Ämbrit see liigutab?
- Rohkem kliente
- Rohkem väärtust kliendi kohta
- Vähem kulusid

Pluss konkreetne mõõdik (reageerimisaeg, veamäär, konversioonimäär, täitmisaeg). **Kui kasutaja ei suuda nimetada ämbrit ja mõõdikut, oskus peatub.** *"Kui sinu automatiseering ei liiguta numbrit, miks sa seda ehitad?"*

**Faasi 2 väljund:** defineeritud automatiseerimise spetsifikatsioon kirjutatud `decisions/log.md`-sse kuupäevastatud kirjena kõigi viie vastuse + autonoomia taseme + KPI-ga. Püsiv rekord sellest, mida otsustati ja miks.

### Faas 3 — Masina üleandmine (ehita see)

Küsi: *"Kuidas soovid selle teostada?"* Valikud järjestatud Igav-on-Ilus vaikimisi järgi:

1. **Ainult prompt** — salvestatud promptimall, mida kasutaja käsitsi käivitab. Null infrastruktuuri. Suurim käsitsi kaasatus.
2. **Deterministlik oskus** — SKILL.md, mis käitab skripti (pole AI sammu). Parim selgete reeglitega teisenduste jaoks.
3. **AI-abistatud oskus** — SKILL.md ühe AI kutsega sees. Mustandid, klassifitseerib, võtab kokku.
4. **Alaagent** — mitme sammuga agent. Viimane võimalus. Ainult kui töö vajab tõeliselt arutlust + tööriistade kasutust.

**Vaikimisi valitud = kõrgeim mitte-AI valik, mis probleemi lahendab.** Kasutaja peab selgesõnaliselt valima rohkem autonoomsust.

Kui valitud, suuna sobivasse seadistajasse:
- `skill-creator` kui globaalselt saadaval (Anthropic installeeritud)
- `skill-builder` kui kasutajal on see lokaalselt
- Muidu kirjuta SKILL.md / agendifail inline frontmatteri, asukoha ja sisuga

**Iga seadistatud artefakt sisaldab ülaosas:**

```markdown
---
jalgratta-meetod-faas: 1  # Faas 1 — Treeningrattad. Käivita kõigepealt käsitsi.
---
```

See lukustab kasutaja Jalgratta Meetodi Faasi 1-sse esimesel ehitusel. Nad ei saa vaikimisi käsitsi valideerimist vahele jätta. Faas liigub edasi ainult selgesõnalise muutmisega.

Too esile Masina põhimõtted seadistamisel:
- **Lego Printsiip** — väikseimad sammud, kõigepealt null-AI kui võimalik
- **Valideerimisahel** — testi iga sammu enne aheldamist
- **Iteratsiooni Mõtteviis** — teosta POC, laienda päris kasutusest

## Väljundi leping

Iga `/level-up` käivitamine toodab:

1. **Ühe `decisions/log.md` kirje** — kuupäevastatud, Meetodi spetsifikatsiooniga
2. **Ühe seadistatud artefakti** — prompt, oskus või agendifail
3. **Üheekraanilise sulgemise** — mis defineeriti, mis ehitati, ja Jalgratta Meetodi Faas 1 meeldetuletus

## Kriitilised teostusreeglid

1. **Üks intervjuu = üks artefakt.** Pole mitme kandidaadi paralleelset defineerimist.
2. **Mõtteviisi faas käivitatakse alati esimesena.** Isegi kui kasutaja tuleb eelnevalt kujundatud ideega.
3. **EAD jõustab "kõigepealt elimineeri."** Kui vastus on Elimineeri, välju rõõmsalt — see on võit, mitte ebaõnnestumine.
4. **Vaikimisi madalaim autonoomia tase, mis töötab.** Lükka tagasi T4.
5. **Igav-on-Ilus vaikimisi Masina üleandmisel.** Vaikimisi = kõrgeim mitte-AI valik.
6. **KPI sidumine on kohustuslik.** Kui kasutaja ei suuda nimetada ämbrit + mõõdikut, oskus peatub.
7. **Jalgratta Meetod saadetakse iga artefaktiga.** `jalgratta-meetod-faas: 1` frontmatteris.
8. **Ainult lugemine kasutaja failides välja arvatud `decisions/log.md` ja uus artefakt.** Ära muuda teisi olemasolevaid faile.

## Verificeerimine (teostajale)

- **Ilma promptita käivitamine.** Oodatav: oskus toob esile 2-3 kandidaati hiljutisest aktiivsusest, prioriteetidest ja top_pain-ist. Üldine väljund ("peaksid ehitama ülevaate") = ebaõnnestumine.
- **Elimineeri-esimesena test.** Söö ilmselgelt elimineeritav kandidaat. Oodatav: oskus soovitab Elimineerida, väljub, logib võidu.
- **T4 tagasilükkamise test.** Kasutaja küsib autonoomset e-maili vastajat esimesel ehitusel. Oodatav: oskus nõuab esmalt T1/T2, ei teosta T4 ilma selgesõnalise alistamiseta.
- **Igav-on-Ilus test.** Kandidaat lahendatav deterministliku Pythoniga. Oodatav: oskus soovitab vaikimisi `(2) deterministlik oskus`.
- **Jalgratta Meetodi vahele jätmise vältimine.** Kasutaja seadistab, küsib kohe Faasi 4-sse liikumist. Oodatav: oskus paneb neid lugema, mida iga faas tähendab, ja kinnitama madalamaid faase.

---

*Taibu AI OS Eesti — loonud Martti Mäger / MGR Tech Solutions OÜ. © 2026 MGR Tech Solutions OÜ.*
