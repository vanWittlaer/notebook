# Zählpaket S3 — Kundenkonto (Storefront)

Status: **gezählt** (2026-08-15)

| Elementarprozess | Typ | Bestände (FTR) | FP | Bemerkung |
|---|---|---|---|---|
| Registrieren | EI | D-19, D-20, D-34 | 4 | inkl. Gastkonto und Checkout-Variante (Einmaligkeit) |
| Anmelden | EI | D-19 | 4 | Steuerdaten (PHB-Präzedenz) |
| Abmelden | EI | D-19 | 4 | PHB „Identität abmelden" |
| Passwort zurücksetzen | EI | D-19 | 4 | Anfordern + Neusetzen = ein EP |
| Kontoübersicht anzeigen | EQ | D-19, D-24 | 4 | |
| Profildaten ändern | EI | D-19 | 4 | eigenes Formular, eigener Commit (R-16) |
| E-Mail-Adresse ändern | EI | D-19 | 4 | eigene Logik: Doppeleingabe + Passwortbestätigung (R-16) |
| Passwort ändern | EI | D-19 | 4 | eigene Logik (R-16) |
| Adressübersicht anzeigen | EQ | D-19 | 4 | |
| Adresse anlegen | EI | D-19, D-34 | 4 | |
| Adresse ändern | EI | D-19, D-34 | 4 | inkl. Standard-Rechnungs-/Lieferadresse setzen |
| Adresse löschen | EI | D-19 | 4 | |
| Bestellübersicht anzeigen | EQ | D-24 | 4 | |
| Bestelldetail anzeigen | EQ | D-24 | 4 | Aufklapp-Widget, gespeicherte Werte |
| Bestellung stornieren | EI | D-24 | 4 | Route /account/order/cancel (Code-bestätigt) |
| Zahlungsart der Bestellung ändern / Zahlung abschließen | EI | D-24, D-37 | 4 | für offene Bestellungen |
| Beleg herunterladen (Kunde) | EQ | D-25 | 4 | gespeichertes PDF, analog A4 |
| Digitale Produkte herunterladen | EO | D-24 | 5 | Download = Ausgabe (PHB 5.4) |
| Merkzettel anzeigen | EQ | D-21, D-01 | 4 | Gast- und Kundenvariante = eine Funktion |
| Zum Merkzettel hinzufügen | EI | D-21 | 4 | |
| Vom Merkzettel entfernen | EI | D-21 | 4 | |
| Newsletter-Einstellung im Konto ändern | EI | D-22 | 4 | Toggle ohne DOI ≠ Footer-Anmeldung (S4) |

## Nicht gewertet (mit Grund)

| Funktion | Grund |
|---|---|
| „Erneut bestellen" | nicht OOB vorhanden (Code-Prüfung) |
| Konto selbst löschen | nicht OOB vorhanden |
| Anrede-/Land-/Bundesstaat-Auswahllisten | Attribut-Wertelisten, PHB-Beispiel „Herr/Frau" (R-17) |

## Zwischenbilanz

| Typ | Anzahl | FP |
|---|---|---|
| EI | 15 | 60 |
| EO | 1 | 5 |
| EQ | 6 | 24 |
| **Summe S3** | **22 EPs** | **89 FP** |
