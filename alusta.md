# Alusta siit — Taibu AI OS Eesti seadistamine

Tere tulemast. See juhend viib su nullist töötava AI operatsioonisüsteemini umbes **30 minutiga**. Tehnilist tausta pole vaja — järgi samme järjest.

Taibu AI OS on sinu isiklik AI "operatsioonisüsteem": see õpib tundma sinu äri, ühendub sinu tööriistadega (Merit Aktiva, Montonio, Pipedrive, Gmail jne) ja aitab sul tööd kiiremini ära teha.

---

## Mida sul on vaja

| Tööriist | Milleks | Maksumus |
|---|---|---|
| **Claude konto** | "Aju" — paneb AI tööle | Claude Pro ~20 €/kuu (miinimum) |
| **VS Code** | Töölaud, kus AI-ga suhtled | Tasuta |
| **Claude Code laiendus** | Ühendab Claude'i VS Code'iga | Tasuta |
| **Git + GitHub konto** | Varundus, uuendused (valikuline, soovituslik) | Tasuta |
| **Taibu AI OS failid** | Mall ise (said selle ostuga) | — |

Kokku: üks tasuline tellimus (Claude Pro), ülejäänu tasuta.

---

## Samm 1 — Loo Claude konto

1. Mine **https://claude.ai** ja registreeru (e-mailiga või Google'iga).
2. Telli **Claude Pro** (~20 €/kuu) — see annab ligipääsu Claude Code'ile. Raskema kasutuse jaoks on olemas ka **Max** plaan.
3. Kinnita, et saad claude.ai-s vestelda — siis on konto valmis.

> Claude Code töötab Pro ja Max plaaniga. Ilma tellimuseta (ainult tasuta konto) Claude Code'i kasutada ei saa.

---

## Samm 2 — Paigalda VS Code

VS Code on tasuta tekstiredaktor — mõtle sellest kui oma töölauast.

1. Mine **https://code.visualstudio.com**
2. Vajuta **Download** (valib su arvutile õige versiooni — Windows või Mac).
3. Käivita allalaaditud fail ja installi (vaikesätted sobivad).
4. Ava VS Code.

---

## Samm 3 — Paigalda Claude Code laiendus

1. VS Code'is vajuta vasakul ribal **Extensions** ikoonil (neli ruutu) — või `Ctrl+Shift+X`.
2. Otsingukasti kirjuta **"Claude Code"**.
3. Vali ametlik **Claude Code** (Anthropic) laiendus → **Install**.
4. Kui laiendus küsib, luba tal paigaldada ka taustal jooksev tööriist (CLI).
5. **Logi sisse** oma Claude kontoga (Samm 1) — laiendus avab brauseri, kinnita seal.

Nüüd on Claude Code valmis. Näed VS Code'is Claude'i paneeli (tavaliselt paremal või all).

---

## Samm 4 — (Valikuline, soovituslik) Git + GitHub

**Git** on "versioonihaldus" — automaatsed salvestuspunktid sinu tööst. **GitHub** hoiab neist koopiat pilves.

**Miks tasub:**
- Varundus — kui arvuti läheb katki, sinu Taibu AI OS on pilves alles.
- Uuendused — saad mugavalt uuemaid versioone tõmmata.
- Automaatne salvestamine — vt README jaotist "Automaatne salvestamine".

**Kuidas:**
1. Paigalda git: **https://git-scm.com/downloads** (vaikesätted sobivad).
2. Loo tasuta GitHub konto: **https://github.com**

> Kui said Taibu AI OS-i ZIP-failina ja tahad alustada kohe, võid selle sammu praegu vahele jätta ja hiljem juurde lisada. Süsteem töötab ka ilma gitita.

---

## Samm 5 — Ava Taibu AI OS

1. Kui said malli **ZIP-failina**, paki see lahti sobivasse kausta (nt `Dokumendid/Taibu AI OS`).
2. VS Code'is: **File → Open Folder…** → vali Taibu AI OS kaust.
3. Vasakul näed faile: `CLAUDE.md`, `README.md`, `intake.md`, kaustad `references/`, `context/` jne.

---

## Samm 6 — Seadista mandaadid (.env)

Mandaadid on API võtmed, mis lubavad Taibu AI OS-il su tööriistadega rääkida.

1. Leia fail **`.env.example`**.
2. Tee sellest koopia nimega **`.env`** (Claude Code teeb seda sinu eest `/onboard`-i ajal, või käsitsi: kopeeri ja nimeta ümber).
3. Täida ainult need read, mida päriselt kasutad (nt Merit Aktiva, Pipedrive). Ülejäänu jäta tühjaks — saad hiljem lisada.

> `.env` ei lähe kunagi internetti — see on turvaliselt sinu arvutis (`.gitignore` hoolitseb selle eest). Iga tööriista võtme hankimise juhend on `references/` kaustas.

---

## Samm 7 — Käivita /onboard

See on hetk, mil Taibu AI OS õpib sind tundma.

1. Ava Claude Code paneel VS Code'is.
2. Kirjuta: **`/onboard`**
3. Vasta 7 küsimusele (kes sa oled, mida müüd, prioriteedid, tööriistad). Võtab ~15 min.
4. **Tähtis:** kui ta küsib häälenäidiseid, **kleebi** päris tekste (vana e-mail, postitus) — ära kirjuta uusi.
5. Lõpus seadistab Taibu AI OS sinu failid automaatselt.

🎉 **Valmis!** Sinu AI operatsioonisüsteem on töökorras.

---

## Esimene nädal

- **Kohe:** küsi Claude'ilt — *"millele peaksin sel nädalal keskenduma?"*
- **7. päev:** käivita **`/audit`** — näe, kui hästi su süsteem on üles ehitatud.
- **14. päev:** käivita **`/level-up`** — leia üks asi, mida automatiseerida, ja ehita see.
- **Edasi:** iga reede `/level-up`. Üks uus automatiseering nädalas. Kuue kuu pärast on sul kümneid.

---

## Kui midagi ei tööta

- Loe **`README.md`** — seal on detailsem ülevaade.
- Küsi otse Claude'ilt VS Code'is — kirjelda probleemi, ta aitab.
- Tugi / kontakt: **MGR Tech Solutions OÜ** — *(lisa siia oma kontakt/e-mail)*

---

*Taibu AI OS Eesti — loonud Martti Mäger / MGR Tech Solutions OÜ.*
