# Zählpaket A9 — Einstellungen (Admin)

Status: **gezählt** (2026-08-15) · Module: sw-settings-* (fachliche)

Zwei Muster:
- **Bestandsmodule** (eigener ILF): Standard-Fünfer nach R-07 —
  Liste (EQ), Detail (EQ), Neu/Ändern/Löschen (EI) = 20 FP je Modul.
- **Konfigurationsmasken** (system_config, D-33): je Maske **1 EI**,
  kein Detail-EQ (R-11, bestätigt R-19).

## Bestandsmodule mit Standard-Fünfer (R-07)

| Modul | Bestand | EPs | FP | Abweichung |
|---|---|---|---|---|
| Länder | D-34 | 5 | 20 | Bundesstaaten-Pflege Teil von Land ändern (R-10) |
| Währungen | D-13 | 5 | 20 | Länderrundungen Teil von Währung ändern (R-10) |
| Kundengruppen | D-20 | 5 | 20 | Registrierungsformular-Konfig Teil des EP |
| Lieferzeiten | D-11 | 5 | 20 | |
| Sprachen | D-35 | 5 | 20 | |
| Nummernkreise | D-27 | 5 | 20 | Vorschau aktueller Stand = Teil Detail |
| Zahlungsarten | D-37 | 5 | 20 | |
| Merkmalssets (Essential Characteristics) | D-01 | 5 | 20 | |
| Anreden | D-23 | 5 | 20 | |
| Versandarten | D-36 | 5 | 20 | Preismatrix Teil von Versandart ändern (R-10) |
| Steuern | D-12 | 5 | 20 | Länderregeln Teil von Steuer ändern (R-10) |
| Tags | D-09 | 5 | 20 | inkl. Zuweisungsübersicht im Detail |
| Beleg-Konfiguration | D-26 | 5 | 20 | Logo-Upload Teil des EP; Typen = Codedaten |

Zwischensumme: **65 EPs / 260 FP** (39 EI, 26 EQ)

## Bestandsmodule mit Abweichung vom Fünfer

| Elementarprozess | Typ | Bestände | FP | Bemerkung |
|---|---|---|---|---|
| Maßeinheiten-Liste anzeigen | EQ | D-10 | 4 | Inline-Bearbeitung, keine Detailseite → kein Detail-EQ |
| Maßeinheit anlegen / ändern / löschen | 3 EI | D-10 | 12 | |
| Produktsortierungen-Liste anzeigen | EQ | D-39 | 4 | Modal statt Detailseite |
| Sortierung anlegen / ändern / löschen | 3 EI | D-39 | 12 | |
| Textbaustein-Sets anzeigen | EQ | D-17 | 4 | |
| Textbausteine eines Sets anzeigen | EQ | D-17 | 4 | Liste mit Sprachspalten |
| Set anlegen / ändern / löschen | 3 EI | D-17 | 12 | Anlegen = Kopie einer Basis |
| Textbaustein anlegen / ändern / zurücksetzen | 3 EI | D-17 | 12 | Zurücksetzen = Löschen der Überschreibung |
| SEO-Templates ändern | EI | D-18 | 4 | je Entität ein Template, eine Maske/Logik |
| Suchkonfiguration ändern | EI | D-40 | 4 | Ranking, ausgeschl. Begriffe Teil des EP |

Zwischensumme: **18 EPs / 72 FP** (14 EI, 4 EQ)

## Konfigurationsmasken (je 1 EI auf D-33, R-11)

| Maske | FP |
|---|---|
| Stammdaten (Basic Information) | 4 |
| Warenkorb | 4 |
| Log-in & Registrierung | 4 |
| Mailer-Konfiguration | 4 |
| Medien-Einstellungen | 4 |
| Newsletter-Konfiguration | 4 |
| Sitemap | 4 |
| Maßsystem (Measurement) | 4 |

Zwischensumme: **8 EPs / 32 FP** (8 EI)

## Nicht gewertet (mit Grund)

| Modul/Funktion | Grund |
|---|---|
| sw-settings-cache, -logging, -message-stats, -usage-data | technisch/Betrieb, nicht fachlich |
| sw-settings-store, -shopware-updates, -services | R-02 (Plattform/Extern) |
| sw-settings-state-machine | R-06 (Codedaten, nur Umbenennen) |
| Test-Mail senden (Mailer) | technische Einrichtungshilfe, bestätigt (R-19) |
| Suchindex neu aufbauen | technische Funktion |
| Listing-Filterkonfiguration | Teil der Masken-EIs (D-33) |

## Zwischenbilanz

| Typ | Anzahl | FP |
|---|---|---|
| EI | 61 | 244 |
| EO | 0 | 0 |
| EQ | 30 | 120 |
| **Summe A9** | **91 EPs** | **364 FP** |
