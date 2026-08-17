# Zählpaket A3 — Kunden (Admin)

Status: **gezählt** (2026-08-15) · Modul: sw-customer

| Elementarprozess | Typ | Bestände (FTR) | FP | Bemerkung |
|---|---|---|---|---|
| Kundenliste anzeigen | EQ | D-19 | 4 | |
| Kunden-Detail anzeigen | EQ | D-19, D-20, D-24 | 4 | |
| Kunde anlegen | EI | D-19, D-20 | 4 | |
| Kunde ändern | EI | D-19, D-20 | 4 | inkl. Konto-Optionen, Tags (Anlage → A9) |
| Kunde löschen | EI | D-19 | 4 | |
| Kundenadresse anlegen | EI | D-19 | 4 | eigener Lebenszyklus, unabhängiger Commit (R-10) |
| Kundenadresse ändern | EI | D-19 | 4 | inkl. Standard-Rechnungs-/Lieferadresse setzen |
| Kundenadresse löschen | EI | D-19 | 4 | |

## Nicht gewertet (mit Grund)

| Funktion | Grund |
|---|---|
| Bestellungen-Tab im Kundendetail | Teilmenge der Bestellliste (Einmaligkeit) |
| Kundengruppen-Verwaltung | eigenes Settings-Modul → A9 |
| Newsletter-Status im Kundendetail | Anzeige: Teil Detail; Pflege über D-22-EPs (A5) |

## Zwischenbilanz

| Typ | Anzahl | FP |
|---|---|---|
| EI | 6 | 24 |
| EO | 0 | 0 |
| EQ | 2 | 8 |
| **Summe A3** | **8 EPs** | **32 FP** |
