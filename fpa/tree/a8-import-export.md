# Zählpaket A8 — Import/Export & Bulk-Edit (Admin)

Status: **gezählt** (2026-08-15) · Module: sw-import-export, sw-bulk-edit

Grundlage: Live-Installation, 12 Systemprofile — 11 × import-export,
1 × nur Export (Bestellungen). Je Profil eigene Datenstruktur und
Verarbeitungslogik → je Profil ein EP (PHB Kap. 4.2.12, Outlook-Import).

| Elementarprozess | Typ | Bestände (FTR) | FP | Bemerkung |
|---|---|---|---|---|
| Profil-Liste anzeigen | EQ | D-41 | 4 | |
| Profil-Detail anzeigen | EQ | D-41 | 4 | Mapping-Editor (Viewer) |
| Profil anlegen | EI | D-41 | 4 | |
| Profil ändern | EI | D-41 | 4 | Systemprofile nicht änderbar, nur eigene |
| Profil löschen | EI | D-41 | 4 | |
| Profil duplizieren | EI | D-41 | 4 | Code-bestätigt (R-09); Standardweg für Anpassung |
| Import Produkte | EI | D-01, D-41, D-42 | 4 | inkl. Testlauf-Option (Teil des EP) |
| Import Erweiterte Preise | EI | D-01, D-41, D-42 | 4 | |
| Import Variantenkonfiguration | EI | D-01, D-41, D-42 | 4 | |
| Import Cross-Selling | EI | D-01, D-41, D-42 | 4 | |
| Import Eigenschaften | EI | D-04, D-41, D-42 | 4 | |
| Import Kategorien | EI | D-05, D-41, D-42 | 4 | |
| Import Medien | EI | D-15, D-41, D-42 | 4 | |
| Import Kunden | EI | D-19, D-41, D-42 | 4 | |
| Import Newsletter-Empfänger | EI | D-22, D-41, D-42 | 4 | |
| Import Aktionscodes | EI | D-28, D-41, D-42 | 4 | |
| Import Aktionsrabatte | EI | D-28, D-41, D-42 | 4 | |
| Export Produkte | EO | D-01, D-41, D-42 | 5 | |
| Export Erweiterte Preise | EO | D-01, D-41, D-42 | 5 | |
| Export Variantenkonfiguration | EO | D-01, D-41, D-42 | 5 | |
| Export Cross-Selling | EO | D-01, D-41, D-42 | 5 | |
| Export Eigenschaften | EO | D-04, D-41, D-42 | 5 | |
| Export Kategorien | EO | D-05, D-41, D-42 | 5 | |
| Export Medien | EO | D-15, D-41, D-42 | 5 | |
| Export Kunden | EO | D-19, D-41, D-42 | 5 | |
| Export Newsletter-Empfänger | EO | D-22, D-41, D-42 | 5 | |
| Export Aktionscodes | EO | D-28, D-41, D-42 | 5 | |
| Export Aktionsrabatte | EO | D-28, D-41, D-42 | 5 | |
| Export Bestellungen | EO | D-24, D-41, D-42 | 5 | Profil nur Export |
| Aktivitätenliste anzeigen | EQ | D-42 | 4 | Import- und Export-Historie |
| Fehler-/Ergebnisdatei herunterladen | EO | D-42 | 5 | fehlgeschlagene Datensätze als Datei |
| Massenbearbeitung Produkte | EI | D-01 | 4 | eigene Auswahl-/Feldmaske, eigene Logik |
| Massenbearbeitung Bestellungen | EI | D-24, D-25 | 4 | inkl. Status-Massenwechsel, Belegerzeugung als Option |
| Massenbearbeitung Kunden | EI | D-19 | 4 | |

## Nicht gewertet (mit Grund)

| Funktion | Grund |
|---|---|
| Testlauf (Dry Run) beim Import | Option desselben EP |
| Export-Datei herunterladen | Bestandteil des jeweiligen Export-EO |
| Massen-Löschen aus Listen | Teil des jeweiligen Löschen-EI (A1/A3/A4) |

## Zwischenbilanz

| Typ | Anzahl | FP |
|---|---|---|
| EI | 18 | 72 |
| EO | 13 | 65 |
| EQ | 3 | 12 |
| **Summe A8** | **34 EPs** | **149 FP** |
