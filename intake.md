# Taibu AI OS Eesti — Sisestusleht

See on sinu Taibu AI OS allikasfail. Täida see kirjutamise, häälega dikteerimise (Wispr Flow / OS dikteerimine) või `/onboard` juhendatud vestluse kaudu. Mõlemal juhul loeb `/onboard` seda faili, et seadistada sinu 1. päeva failistruktuur.

**Kõvakork: 7 küsimust.** Igale vastamiseks alla 60 sekundi. Ära ülemõtle — saad `/onboard` igal ajal uuesti käivitada.

---

## K1 — Kes sa oled, mida müüd, kellele müüd?

Identiteet, pakkumine, ideaalne klient. Üks lõik kummagi kohta on sobiv.

```
[Sinu vastus siia]
```

---

## K2 — Kleebi 1-2 asja, mida oled hiljuti kirjutanud. Ära muuda neid.

E-mail, LinkedIn postitus, sõnum, dokument — midagi, mis kõlab nagu sina, kui sa ei ürita. **Kleebi sõna-sõnalt.** Ära kirjuta neid siia vestluse käigus — vestluse käigus kirjutatud näidised on halvemad kui mitte midagi (hääle saastumine).

```
[Näidis 1 — kleebi toorelt]
```

```
[Näidis 2 — kleebi toorelt]
```

---

## K3 — Mis on sinu 2-3 suurimat prioriteeti järgmiseks 90 päevaks?

Kvartaliprioriteedid. Mitte aastate unistused. Asjad, mille tegemata jätmine juuliks paneks sind ütlema "raisksin K2."

```
1. [Prioriteet 1]
2. [Prioriteet 2]
3. [Prioriteet 3]
```

---

## K4 — Kuhu tulu tegelikult laekub ja kus seda jälgitakse?

Mitu vastust sobib. Stripe? Montonio (pangalink)? Merit Aktiva (arveldus + raamatupidamine)? Tabel?
Eesti valikud: **Merit Aktiva** (arveldus + raamatupidamine, `references/merit-aktiva-api.md`), **Montonio** (pangalink maksed, `references/montonio-api.md`).

```
[Sinu vastus siia]
```

---

## K5 — Kus räägid klientide, meeskonna ja välismaailmaga igapäevaselt?

E-mail (milline — Gmail / Outlook)? Slack? Teams? DM-id (Discord / iMessage)? Telefon?
Eesti valikud: **Pipedrive** CRM + kliendikommunikatsiooniks (`references/pipedrive-api.md`).

```
[Sinu vastus siia]
```

---

## K6 — Kus asuvad koosolekusalvestused, märkmed ja olulised dokumendid?

Granola? Otter? Google Drive? Notion? Dropbox? Töölauakaustа, mida plaanid kord korrastada?

```
[Sinu vastus siia]
```

---

## K7 — Mis ülesanne sööb sinu nädala ära ja kus jälgid tööd praegu?

Suurim ajaraiskaja või korduv igav töö. Pluss kus ülesanded/projektid asuvad (ClickUp / Asana / Linear / Notion / märkmik).

```
[Sinu vastus siia]
```

---

Kui see fail on täidetud, käivita `/onboard` (või käivita uuesti) ja viisard seadistab sinu 1. päeva failistruktuuri: `context/`, `references/voice.md`, täidetud `connections.md` ja täidetud `CLAUDE.md`.
