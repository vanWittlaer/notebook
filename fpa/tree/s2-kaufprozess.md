# Zählpaket S2 — Kaufprozess (Storefront)

Status: **gezählt** (2026-08-15)

Der Warenkorb wird serverseitig gepflegt → ILF **D-47** (Nachtrag im
Register per R-18; PHB 5.4 nennt den Warenkorb ausdrücklich als ILF).

| Elementarprozess | Typ | Bestände (FTR) | FP | Bemerkung |
|---|---|---|---|---|
| Warenkorb anzeigen | EO | D-47, D-01, D-28 | 5 | Summen, Steuern, Versandschätzung berechnet; Offcanvas + Seite = eine Funktion |
| Artikel in den Warenkorb legen | EI | D-47, D-01 | 4 | von PDP, Listing, Merkzettel — Einmaligkeit |
| Position ändern (Menge) | EI | D-47 | 4 | |
| Position entfernen / Warenkorb leeren | EI | D-47 | 4 | gleiche Logik (Entfernen 1..n) |
| Gutscheincode einlösen/entfernen | EI | D-47, D-28 | 4 | Promotion-Validierung Teil des EP |
| Versandart wählen | EI | D-47, D-36 | 4 | |
| Zahlungsart wählen | EI | D-47, D-37 | 4 | andere FTR als Versandart → eigener EP |
| Bestellbestätigungsseite anzeigen (Confirm) | EO | D-47, D-19, D-36, D-37 | 5 | vollständige Endberechnung |
| Bestellung absenden | EI | D-24, D-47, D-27 | 4 | Kern-EP: erzeugt Bestellung, leert Warenkorb, löst Mail/Flows aus |

## Nicht gewertet (mit Grund)

| Funktion | Grund |
|---|---|
| Registrierung/Gastkonto im Checkout | Einmaligkeit → S3 „Registrieren" |
| Adressanlage/-wahl im Checkout | Einmaligkeit → S3 Adress-EPs |
| Finish-/Danke-Seite | Systemantwort, Teil von „Bestellung absenden" |
| Bestellbestätigungs-Mail | Ausgelöste Folgeaktion des EP (Flow), Mail-Pflege in A6 |
| AGB-Checkbox, Captcha | DETs/technische Prüfung innerhalb des EP |

## Zwischenbilanz

| Typ | Anzahl | FP |
|---|---|---|
| EI | 7 | 28 |
| EO | 2 | 10 |
| EQ | 0 | 0 |
| **Summe S2** | **9 EPs** | **38 FP** |
