# Zählpaket A7 — Verkaufskanäle & Feeds (Admin)

Status: **gezählt** (2026-08-15) · Modul: sw-sales-channel

| Elementarprozess | Typ | Bestände (FTR) | FP | Bemerkung |
|---|---|---|---|---|
| Verkaufskanal-Detail anzeigen | EQ | D-32, D-36, D-37 | 4 | Sidebar-Einträge = Navigation, kein Listen-EQ |
| Verkaufskanal anlegen | EI | D-32 | 4 | Storefront/Headless, Wizard Teil des EP |
| Verkaufskanal ändern | EI | D-32, D-36, D-37, D-35, D-13 | 4 | Domains, Zahlungs-/Versand-/Sprachzuordnung |
| Verkaufskanal löschen | EI | D-32 | 4 | |
| Produktvergleichs-Feed anlegen | EI | D-07, D-32 | 4 | eigener Typ mit Template-Wahl, eigene Logik |
| Produktvergleichs-Feed ändern | EI | D-07, D-06 | 4 | Template-Editor, Produktzuordnung via dyn. Gruppe |
| Produktvergleichs-Feed generieren | EO | D-07, D-01 | 5 | Systemschnittstelle: Feed-Abruf durch Portal (Anwender = anderes System) |

## Nicht gewertet (mit Grund)

| Funktion | Grund |
|---|---|
| Feed-Vorschau im Template-Editor | eingebettete Hilfe (R-08) |
| API-Zugangsdaten neu generieren | technische Funktion, Teil Verkaufskanal ändern |
| Feed löschen | = Verkaufskanal löschen (gleiche Logik) |

## Zwischenbilanz

| Typ | Anzahl | FP |
|---|---|---|
| EI | 5 | 20 |
| EO | 1 | 5 |
| EQ | 1 | 4 |
| **Summe A7** | **7 EPs** | **29 FP** |
