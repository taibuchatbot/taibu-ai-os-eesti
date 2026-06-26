# Kolm M-i — Mõtteviis, Meetod, Masin

> *"Parim automatiseering on see, mida sa vaevu märkad. Alusta sellest, mida pole vaja olemas olla, kaota see ära, seejärel automatiseeri ülejäänu võimalikult väikese AI-ga."*

**Igav on ilus.**

---

## Miks see sinu komplektis on

See raamistik on operaatori aju, mida kasutad iga kord, kui käivitad `/level-up`. Kolm kihti, igaüks ehitab eelmise peale. Loe üks kord, viita vajadusel.

Enamik inimesi eksib siin: nad arvavad, et AI automatiseerimine käib tööriistade kohta. Ei käi. Tööriistad muutuvad iga kuue kuu tagant. Platvorm, mida täna kasutad, ei pruugi järgmisel aastal eksisteerida. Mis ei muutu, on see, kuidas sa automatiseerimisest MÕTLED, kuidas OTSUSTAD, mida automatiseerida, ja kuidas EHITAD ning HALDAD asja, kui see käib. Just selle annab sulle Kolm M-i. Mõtlemisviis, mis töötab sõltumata platvormist, mudelist või hype-tsüklist.

See raamistik on kõigile. Ettevõtjatele, kes kuulevad AI-st esimest korda. Inseneridele, kes uurivad automatiseerimist. Konsultantidele, kes vajavad metoodikat, mille saab kliendile üle anda. See skaleerub.

---

## Kiht 1 — MÕTTEVIIS (kuidas mõelda)

Enne kui ühtegi tööriista puudutad, pead ümber juhtima selle, kuidas tööle lähened. See, kuidas ülesannetest mõtled, määrab, kas märkad automatiseerimise võimalusi või kõnnid neist iga päev mööda.

### 1. Vaikimisi nihe

Põhiharjumus: enne kui teed mis tahes ülesannet vanal moel, küsi "kuidas saaks AI seda teha?"

Kui vastus on "ta ei saa kõike teha", järgmine küsimus: "kuidas saaks AI aidata esimese 30%-ga?"

See pole kunagi must-valge. Tegelik küsimus on alati **"mil määral saab AI-d siin kasutada?"** Võib-olla 80%. Võib-olla 10%. Sa ei tea, kuni ei küsi.

**Päris näide.** Jälgimislinkide uuendamine 300+ video kirjelduses. Vana moodus: ava iga video, leia link, asenda, salvesta, järgmine. Tunde tuima tööd. Uus moodus: kirjelda probleem Claude Code'ile ja mine kööki vett tooma. Selleks ajaks, kui tagasi tuled, on ta uurinud API-d, välja selgitanud kvoodipiirangud, kirjutanud skripti ja koostanud plaani. Kinnita, käivita, valmis. Nüüd on sul korduvkasutatav süsteem.

Vaikimisi nihe on nagu trükkimise õppimine käsitsi kirjutamise asemel. Kui see klõpsab, ei saa sa füüsiliselt enam tagasi. Iga käsitsitöö hakkab sügelema.

**Üks asi, mida sisestada:** AI on parem kui arvad ja paraneb kiiremini kui arvad. Klient vajas infograafika visuaale; mudelid ei suutnud. Kolm kuud hiljem tuli uus mudel. Töö sai tehtud. *Kui AI ei suuda midagi täna, proovi järgmisel kuul uuesti. Tõsiselt.*

### 2. Funktsiooni lahti võtmine

Sinu roll on hulk funktsioone. Sinu ametijuhendis on umbes viis punkti. Iga jaguneb kümneteks väikesteks ülesanneteks. **Sa ei automatiseeri tervet oma tööd. Sa automatiseerid ühe pisikese tüki. Siis teise. Siis aheldad need.**

Mõtle "automatiseeri video". Kõlab võimatult. Võta lahti: ideed, stsenaarium, pealkiri, pisipilt, kirjeldus, kommentaaride vastused, ajatemplid, analüütika. Iga tükk on oma automatiseering. Ehita üks, pane see tööle, liigu edasi.

Üks väike ülesanne päevas. Kuus kuud hiljem sajad automatiseeritud. Liitintress on päris.

### 3. Uudishimu reegel

Ära kunagi võta AI väljundit vastu ilma "miks" küsimata. Küsi kolm alternatiivi. Küsi, milline on tema arvates parim ja miks. Lükka tagasi. Kaeva sügavamale.

See on vastumürk "pimedale koodile" — automatiseeringud või kood, mida sa ei mõista. **Kui ehitad midagi ega oska seletada, kuidas see töötab, oled ehitanud kohustuse, mitte vara.** Kui see katki läheb (ja läheb), pole sul aimugi, kust alustada.

Kohtle AI-d mentorina, mitte automaadina. Automaat annab sulle väljundi. Mentor annab sulle arusaamise.

### Oota langust

Tootlikkuse langus alguses: ~20% vähem väljundit esimese nädala-paari jooksul. Uued töövood, uus promptimise rütm. See on normaalne. Kahe nädala jooksul baastase kahekordistub. Aga pead läbi suruma.

**Eksi kiiresti, õpi kiiremini.** Jõua oma esimese 10 veani nii ohutult ja kiiresti kui võimalik. Just seal elab päris õppimine, mitte sinu esimeses 10 õnnestumises.

---

## Kiht 2 — MEETOD (kuidas otsustada)

Mõtteviis ütleb, kuidas mõelda. Meetod ütleb, mida selle mõtlemisega teha. Operatiivne tuum — muudab "ma peaksin midagi automatiseerima" sõnumiks "siin on täpselt, mida ma ehitan ja miks".

### 1. Leia kitsaskoht

Kaks võimsat küsimust toovad kõik esile:

**K1:** *"Kui 500 uut klienti ilmuks homme, mis läheks esimesena katki?"* — leiab kitsaskohad (ummistused torus). Onboarding? Arveldus? Toe reageerimisaeg?

**K2:** *"Mis annaks sulle 500 klienti juurde homme?"* — leiab kasvuvõimalused (kasutamata toru). Sisu, mida ei loo? Müük, mida ei tee? Leadid, millele ei reageeri?

Üks leiab, mis on katki. Teine leiab, mis saaks skaleeruda. Alusta kitsaskohast.

### 2. EAD: Elimineeri, Automatiseeri, Delegeeri

Iga protsessi jaoks käi läbi EAD — selles järjekorras.

**Kõigepealt Elimineeri.** *"Mis juhtub, kui lihtsalt lõpetame selle tegemise?"* Üllataks, kui palju protsesse eksisteerib lihtsalt sellepärast, et nad alati on eksisteerinud. Raportid, mida keegi ei loe. Kinnitussammud, mis ei lisa väärtust. **Kui keegi ei märkaks selle kadumist, tapa see. Ära automatiseeri raiskamist.**

**Teiseks Automatiseeri.** Rakenda **60/30/10 kuldreeglit:**
- ~60% täielikult automatiseeritud (inimene ei puutu)
- ~30% AI-abistatud (AI teeb töö, inimene vaatab üle enne väljaminekut)
- ~10% jääb käsitsi (liiga nüansirikas, liiga riskantne või liiga harv)

See suhe normaliseerib ootused. **Täielik automatiseerimine on harva eesmärk.** Kui keegi lubab 100% millegi olulise puhul, müüb ta sulle midagi.

**Kolmandaks Delegeeri.** Kui protsess ei suuda 60/30/10 tabada — liiga keeruline, liiga muutlik, liiga otsustemahukus — delegeeri inimesele. Mitte kõike ei peaks automatiseerima.

Võti: miski ei jää endiseks. Iga protsess tapetakse, automatiseeritakse või antakse üle.

### 3. Kaardista protsess

Enne kui ühtegi tööriista puudutad, kirjuta iga samm paberile. Viis elementi protsessi kohta:

- **Käivitaja** — mis paneb käima (vormi täitmine, kalendrisündmus, e-mail, kellaaeg)
- **Andmeallikad** — kust info tuleb (CRM, tabel, postkast)
- **Andmete teisendused** — kuidas andmed kuju muudavad (ümbervormindamine, filtreerimine, ühendamine)
- **Otsusepunktid** — kus haruneb (kui sobiv, tee X; kui mitte, tee Y)
- **Sihtkoht** — kuhu väljund läheb (tagasi CRM-i, e-mail, Slack, dokument)

**Reegel:** *kui sa ei oska seda inimesele seletada, ei oska sa seda AI-le seletada.* Kaart sunnib selgust. Jäta see samm vahele ja ehitad midagi, mis enam-vähem töötab, aga läheb veidralt katki.

### 4. Autonoomia spekter

Iga samm saab autonoomia taseme:

| Tase | Nimi | Mis juhtub |
|------|------|-------------|
| T0 | Käsitsi | Pole AI-d. Inimene teeb. |
| T1 | Soovitatud | AI soovitab, inimene otsustab igal sammul. |
| T2 | Mustandatud | AI koostab mustandid, inimene vaatab üle ja muudab. |
| T3 | Järelevalvega | Reeglid seatud, AI töötab, inimene valideerib. |
| T4 | Autonoomne | AI haldab algusest lõpuni. |

**Juhtiv põhimõte: vaikimisi MADALAIM tase, mis töötab.**

Enamik teeb selle vastupidi. Kuulevad "AI automatiseerimine" ja hüppavad T4-le. Just seal läheb asi viltu. Igav on ilus. Deterministlik võidab mittedeterministliku. **Töövood on paremad kui agendid.** Kui otsust EI PEA tegema AI, ära lase AI-l seda teha.

Tõsta autonoomiat ainult siis, kui oled madalama taseme tõestanud.

### 5. Seo KPI-ga

Kui sinu automatiseering ei liiguta numbrit, miks sa seda ehitad?

**Kolm ämbrit** (iga ärimõõdik langeb ühte):

1. **Saa rohkem kliente** — sisu, müük, outreach, reklaam, lead gen
2. **Tee iga klient väärtuslikumaks** — premium teenused madalama kuluga, lisamüük, hoidmine
3. **Vähenda kulusid** — kaota igav töö, vähenda vigu, tõsta tootlikkust

**Konkreetsed KPI-d** on seotud üksiku automatiseeringuga: reageerimisaeg, veamäär, päringud kuus, konversioonimäär, täitmisaeg.

Kui sinu automatiseering ei paranda mõõdikut ühes kolmest ämbrist, peatu. *"Sest see on lahe"* pole ärilaade.

---

## Kiht 3 — MASIN (kuidas ehitada ja hallata)

Sul on mõtlemine (Mõtteviis) ja otsused (Meetod). Nüüd ehitad ja käitad asja. Kaks poolt: EHITA ja HALDA.

### EHITA

#### 1. Lego printsiip

Väikseimad võimalikud sammud. Üks sisend, üks väljund ploki kohta. Ploki 1 väljund saab ploki 2 sisendiks.

Alusta **null-AI sammudega esmalt**. Pane deterministlikud tükid tööle — andmete hankimine, vormindamine, suunamine. Siis lisa AI sinna, kus seda päriselt vaja on.

See teeb projekti vähem üle jõu käivaks ja laseb valideerida samm-sammult. Kui plokk 3 toodab prügi, tead täpselt, kuhu vaadata. **Modulaarsus on vabadus.**

#### 2. Konveier

Iga AI samm teeb ühe spetsialiseeritud töö. Nagu töötajad konveieril.

**Ära ehita generalisti.** Üks mudelikutse copywriting'uks. Teine arutluseks. Kolmas klassifitseerimiseks. Hoia need eraldi. Lihtsam siluda, mudeleid vahetada, prompte kohandada.

#### 3. Valideerimisahel

Valideeri iga sammu väljund enne aheldamist. **ÄRA ehita tervet torujuhet ja testi otsast-otsani.** See on retsept "ei tööta ja mul pole aimugi miks".

Ehita samm 1. Käivita. Kinnita väljund. Ehita samm 2. Käivita sammu 1 päris väljundiga. Kinnita. Ahelda. Lisa samm 3. Nii POC-id päriselt töötavad.

#### 4. Iteratsiooni mõtteviis

Pole valmis toodet — eriti AI-ga. Deterministlikud skriptid SAAVAD valmis (CSV ümbervormindaja, kindlasti). AI sammud arenevad alati. Uued mudelid. Uued võimed. Prompt, mis oli optimaalne kuus kuud tagasi, on täna paljusõnaline ja kallis.

Teosta POC. Saa päris-kasutuse tagasisidet. Laienda. Itereeri. **Perfektsionism on juurutamise vaenlane.**

### HALDA

#### 5. Jalgratta meetod

Juuruta faasidena, nagu lapsele jalgrattasõidu õpetamine.

- **Faas 1 — Treeningrattad.** Käita käsitsi. Vaata kõike. Paranda vigu käsitsi.
- **Faas 2 — Juhitud.** Automatiseering töötab, aga sa vaatad iga väljundi üle. See koostab mustandi, ei saada.
- **Faas 3 — Jälgitud.** Töötab autonoomselt. Sa monitoorid. Hoiatused anomaaliate korral. Perioodiline partii-ülevaatus.
- **Faas 4 — Käed eemal.** Kiiver pähe, sõida.

Isegi 90% kindluse juures juuruta esmalt 10% mahust. Vaata nädal. Lisa 20% juurde. Nagu ravimikatsetused — mitte täisdoos kõigile esimesel päeval.

Kasuta kindlusläve: kõrge → automaatne saatmine, keskmine → mustandijärjekord, madal → eskaleeri inimesele. Pinguta või lõdvenda andmete kogunedes.

#### 6. Praktikant reegel

Kohtle AI-d nagu uut töötajat esimesel päeval.

- **Oma identiteet.** Oma e-mail, kontod, mandaadid. Mitte kunagi sinu omad.
- **Vaikimisi ainult lugemine.** Ainult vaatamine, kuni oled tõestanud, et kirjutusõigus on vajalik.
- **Ei esine kunagi sinuna.** Kirjutab alla kui "[sinu nimi] AI assistent".
- **Pole isiklikke mandaate.** Pole paroole, pangaandmeid, isiklikke sisselogimisi.
- **Täielik auditijälg.** Nähtavus kõige üle, mida ta tegi, kulutas, lõi, kustutas.
- **Piiratud õigused.** API võtmed minimaalse ulatusega. Täpselt see, mida vaja, ei midagi enamat.

*"Sa ei usaldaks just kohatud inimesele oma pangakontot."*

#### 7. Väljalüliti

Monitoori, mis töötab. Kui automatiseering vajab pidevalt parandusi, toodab madala kvaliteediga väljundit või maksab hooldamiseks rohkem kui säästab — **lammuta see maha.** Demonteeri. Kustuta.

Ära lange uppunud kulu lõksu. *"Aga ma kulutasin selle ehitamiseks kolm nädalat"* pole põhjus hoida käimas midagi, mis ei tööta. **Head operaatorid teavad, millal ehitada JA millal hävitada.** Väljalüliti on sama oluline kui käivitusnupp.

---

## Juhtivad põhimõtted

Kolm põhimõtet, mis on kõige kohal. Kahtluse korral pöördu nende juurde tagasi.

1. **Igav on ilus.** Etteaimatav võidab nutika. Vaikimisi lihtsaim, kõige deterministlikum lähenemine, mis töö ära teeb.
2. **Deterministlikud sammud saavad valmis. AI sammud arenevad alati.** Sea ootused — enda ja kliendi omad — vastavalt. Reeglipõhine filter on valmis. AI klassifitseerija vajab häälestamist igavesti.
3. **Eksi kiiresti, õpi kiiremini.** Jõua oma esimese 10 veani ohutult ja kiiresti. Päris õppimine elab seal, mitte planeerimises, mitte esimeses 10 õnnestumises.

---

## Haru-raamistikud (tulevikukonksud)

Kolm M-i on emalaev. Konkreetsed teemad lähevad sügavamale eraldi raamistikes. Enamik pole veel sellesse komplekti ehitatud. Nad kasvavad `references/`-sse aja jooksul:

- **Andmete pärimise hierarhia** — Filtrid, SQL, täiskontekst, RAG: millal millist
- **Integratsiooni redel** — API, CLI, brauseri automatiseerimine, scraping: usaldusväärsuse hierarhia
- **Veakäsitluse käsiraamat** — mida teha, kui asjad katki lähevad (ja lähevad)
- **Mudeli valiku juhend** — kuidas valida õige mudel õigeks tööks
- **Konteksti inseneeria raamistik** — kuidas sööta AI-le õige info õigel ajal
- **Avastuse käsiraamat** — kuidas viia läbi avastus kliendi või meeskonnaga enne ehitamist
- **Turvalisuse ja õiguste käsiraamat** — ligipääsu kontroll, auditijäljed, riskijuhtimine

Iga ühildub Kolme M-iga kindlates punktides. Alusta siit, hargne sügavusse vajadusel.
