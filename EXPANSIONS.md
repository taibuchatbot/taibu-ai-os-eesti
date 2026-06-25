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
