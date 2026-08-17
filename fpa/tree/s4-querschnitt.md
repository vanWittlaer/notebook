# Zählpaket S4 — Querschnitt (Storefront)

Status: **gezählt** (2026-08-15)

| Elementarprozess | Typ | Bestände (FTR) | FP | Bemerkung |
|---|---|---|---|---|
| Newsletter anmelden | EI | D-22 | 4 | Double-Opt-in: Anmeldung + Bestätigung = ein EP |
| Newsletter abmelden | EI | D-22 | 4 | eigenes Formular/Logik |
| Kontaktformular absenden | EO | D-33, D-31 | 5 | Daten verlassen die Grenze (Mail); kein Bestand gepflegt |
| Sprache wechseln | EI | D-35 | 4 | Steuerdaten, einmal für die Anwendung (PHB 5.4 wörtlich) |
| Währung wechseln | EI | D-13 | 4 | analog Sprachwechsel |
| Sitemap ausliefern | EO | D-01, D-05, D-18 | 5 | generierte Ausgabe an anderes System (Crawler) |

## Nicht gewertet (mit Grund)

| Funktion | Grund |
|---|---|
| robots.txt, .well-known | technisch/statisch |
| Wartungsmodus-Seite | statische Anzeige, Aktivierung = Einstellungs-EI (A9) |
| Captcha-Endpunkte | technische Prüfung innerhalb der Formular-EPs |
| 404-/Fehlerseiten | Systemverhalten, keine fachliche Funktion |

## Zwischenbilanz

| Typ | Anzahl | FP |
|---|---|---|
| EI | 4 | 16 |
| EO | 2 | 10 |
| EQ | 0 | 0 |
| **Summe S4** | **6 EPs** | **26 FP** |
