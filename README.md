# Taibu AI OS Eesti

**Loonud [Martti Mäger](https://github.com/taibuchatbot) / MGR Tech Solutions OÜ**

Tasuta MIT-litsentsiga tööriistakomplekt, mis muudab Claude Code'i sinu isiklikuks **AI operatsioonisüsteemiks**. Sobib kõigile, kes soovivad automatiseerida igapäevast tööd — ettevõtjatele, juhtidele, konsultantidele, loovjatele. Kohandatud Eesti turu tööriistadele (Pipedrive, Merit Aktiva, Montonio).

Süsteem personaliseerib end sinu jaoks `/onboard` intervjuu kaudu, seejärel annab kaks korduvat mõtlemisoskust (`/audit`, `/level-up`), et iga nädalaga rohkem automatiseeringuid lisada.

---

## Edukuse test

> **"Kui sa ei ole laua taga, märkab sinu Taibu AI OS üht reaalset sündmust ja toodab väljundi, mis on kiirem ja täpsem kui see, mille sa ise looksid."**

Iga disainiotsus selles tööriistakomplektis lähtub sellest testist. Kui mingi kiht, oskus või mall sellele ei panusta, ei kuulu see siia.

---

## Kuidas tead, et see töötab

Kolm **edumärki**, mis ütlevad, et Taibu AI OS muudab päriselt sinu töötamist.

**1. Meeskond pöördub sinu AI poole:**

> *"Kolleeg küsib sinult küsimuse. Sa mõistad, et sinu Taibu AI OS vastaks sellele paremini, kiiremini ja täpsemate allikatega — isegi kui sa oleksid ärkvel ja vaba. Nii küsid ka ise AI-lt. See on hetk, mil sa lakkad olemast oma teadmiste kitsaskoht."*

**2. Kontekstivahetus väheneb:**

> *"Sa lõpetad uute vahelehtede avamise. Kui midagi uut tuleb, on sinu esimene samm küsida Taibu AI OS-lt — mitte avada kuut rakendust. Vaikne. Liitintressiga."*

**3. Teadmine lahkub sinu peast:**

> *"Sa lõpetad äriandmete meeles pidamise. Sa ei korrutele endamisi, mida eelmisel kvartalil otsustati või mida klient sellel koosolekul ütles. Sa usaldad otsimist. Taibu AI OS hoiab tõde, sina hoiad küsimusi."*

**Isiklik alus → ettevõtte AI-valmidus.** Kui need märgid ilmuvad ühel inimesel, toetab sama andmearhistektuur kõike muud: dashboardid, automatiseeringud, meeskonna kasutuselevõtt.

---

## Kaks raamistikku

Kõigepealt Kolm M-i, siis Neli C-d. Ilma mõtteviisi muutuseta on arhitektuur lihtsalt kaustade struktuur.

### Kolm M-i — operaatori aju (kuidas mõelda)

| M | Põhimõte |
|---|---|
| **Mõtteviis** | Vaikimisi nihe, Funktsiooni lahti võtmine, Uudishimu reegel. *Mil määral saab siin AI-d kasutada?* |
| **Meetod** | Leia kitsaskoht → EAD (Elimineeri, Automatiseeri, Delegeeri) → Kaardista protsess → Vali autonoomia tase → Seo KPI-ga. |
| **Masin** | Lego printsiip, Valideerimisahel, Jalgratta meetod, Praktikant reegel, Väljalüliti. *Igav on ilus. Töövood on paremad kui agendid.* |

Täielik selgitus: `references/3ms-framework.md`. Oskus `/level-up` käib kõik kolm läbi igal nädalal.

### Neli C-d — arhitektuur (mida ehitada)

| # | Kiht | Põhimõte | Test |
|---|---|---|---|
| 1 | **Kontekst** | Teab sinu äri | Uus Claude'i seanss vastab "mis see ettevõte teeb?" ilma otsimata |
| 2 | **Ühendused** | Pääseb sinu andmetele ligi | "Mis on homme kalendris?" → reaalajas andmed, mitte kopeerimine |
| 3 | **Võimed** | Oskab tööd teha | Lühike fraas käivitab mitmeastmelise töövoo |
| 4 | **Kadents** | Töötab ilma küsimata | Sülearvuti kinni. Brief jõuab postkasti. |

**Brändi lause:** Kontekst. Ühendused. Võimed. Kadents.

---

## Mis komplektis on — 3 oskust

| Oskus | Tüüp | Millal kasutada |
|---|---|---|
| `/onboard` | Seadistusviisard (ühekordne) | 1. päev, kohe pärast klooni. 7-küsimust intervjuu. |
| `/audit` | Korduv mõtlemisoskus | 7. päev, siis iganädalaselt. Neli C-d aruanne. |
| `/level-up` | Korduv mõtlemisoskus | 14. päev, siis iganädalaselt. Üks automatiseering nädalas. |

---

## Kiirstart

1. **Klooni repo** oma arvutisse.
2. **Ava Claude Code'is** ja käivita `/onboard`. Vasta 7 küsimusele ausalt. Häälenäidised pead kleepima, mitte kirjutama. Võtab ~15 minutit.
3. **Kasuta nädal aega.** Too päris küsimusi. Tee päris otsuseid. Logi need.
4. **7. päev:** käivita `/audit`. Vaata Nelja C aruannet. Vali üks puudus, mida parandada.
5. **14. päev:** käivita `/level-up`. Kolm M-i intervjuu toob esile ühe automatiseerimise. Ehita see.
6. **3. nädal+:** iganädalane `/level-up` rituaal. Üks valminud automatiseering nädalas.

---

## Repo struktuur

```
taibu-ai-os-eesti/
├── README.md
├── CLAUDE.md                        ← Sinu käitamisjuhend (täidetud /onboard poolt)
├── EXPANSIONS.md                    ← Mida lisada kasvades
├── LICENSE
├── .gitignore
├── aios-intake.md                   ← /onboard allikas. Muuda ja käivita uuesti igal ajal.
├── connections.md                   ← Register kõikidest süsteemidest
├── context/                         ← Sinust, sinu ärist (täidetud /onboard poolt)
├── references/
│   ├── 3ms-framework.md             ← Operaatori aju (EN)
│   ├── pipedrive-api.md             ← Pipedrive API juhend (EN)
│   ├── merit-aktiva-api.md          ← Merit Aktiva API juhend (EN)
│   └── montonio-api.md              ← Montonio API juhend (EN)
├── decisions/
│   └── log.md                       ← Otsuste logi
├── archives/                        ← Vana materjal. Ära kustuta. Tõsta siia.
└── .claude/
    └── skills/
        ├── onboard/SKILL.md
        ├── audit/SKILL.md
        └── level-up/SKILL.md
```

---

## Litsents

MIT litsents. © 2026 MGR Tech Solutions OÜ. Loonud Martti Mäger.

Taibu AI OS Eesti on MGR Tech Solutions OÜ toode. Operaatoriks (kasutajaks) võib olla iga eraisik või ettevõte — looja ja õiguste hoidja on MGR Tech Solutions OÜ / Martti Mäger.
