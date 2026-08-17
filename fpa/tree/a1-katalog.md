# Zählpaket A1 — Katalog (Admin)

Status: **gezählt** (2026-08-15) · Module: sw-product, sw-review,
sw-manufacturer, sw-property, sw-product-stream

Muster je pflegbarem Bestand (R-07): Liste (EQ), Detail anzeigen (EQ),
Neu (EI), Ändern (EI), Löschen (EI) — erweitert um modulspezifische EPs.

| Elementarprozess | Typ | Bestände (FTR) | FP | Bemerkung |
|---|---|---|---|---|
| Produktliste anzeigen | EQ | D-01 | 4 | Grid inkl. Suche/Filter/Sortierung (Maximalausprägung) |
| Produkt-Detail anzeigen | EQ | D-01 | 4 | Viewer-Sicht, alle Tabs inkl. Variantenliste |
| Produkt anlegen | EI | D-01, D-15, D-18 | 4 | physisch/digital = eine Logik; alle Tabs Teil des EP |
| Produkt ändern | EI | D-01, D-15, D-18, D-29 | 4 | inkl. Inline-Edit im Grid, Preise/Erweiterte Preise, Cross-Selling, SEO-Tab, Medienzuordnung |
| Produkt löschen | EI | D-01 | 4 | inkl. Mehrfachauswahl (gleiche Logik) |
| Produkt duplizieren | EI | D-01 | 4 | eigene Verarbeitungslogik: Kopie mit Vorbelegung (R-09) |
| Varianten generieren | EI | D-01, D-04 | 4 | Massenanlage aus Eigenschafts-Kombinationen, eigene Logik |
| Bewertungsliste anzeigen | EQ | D-02 | 4 | |
| Bewertung-Detail anzeigen | EQ | D-02, D-01, D-19 | 4 | |
| Bewertung ändern | EI | D-02 | 4 | Sichtbarkeit/Status, Antwort des Händlers |
| Bewertung löschen | EI | D-02 | 4 | Neuanlage nur storefrontseitig (S1) |
| Herstellerliste anzeigen | EQ | D-03 | 4 | |
| Hersteller-Detail anzeigen | EQ | D-03 | 4 | |
| Hersteller anlegen | EI | D-03, D-15 | 4 | |
| Hersteller ändern | EI | D-03, D-15 | 4 | |
| Hersteller löschen | EI | D-03 | 4 | |
| Eigenschaftsliste anzeigen | EQ | D-04 | 4 | Gruppen |
| Eigenschaft-Detail anzeigen | EQ | D-04 | 4 | Gruppe inkl. Optionen |
| Eigenschaft anlegen | EI | D-04 | 4 | Optionenpflege Teil des Gruppen-EP |
| Eigenschaft ändern | EI | D-04 | 4 | |
| Eigenschaft löschen | EI | D-04 | 4 | |
| Liste dyn. Produktgruppen anzeigen | EQ | D-06 | 4 | |
| Dyn. Produktgruppe Detail anzeigen | EQ | D-06 | 4 | |
| Dyn. Produktgruppe anlegen | EI | D-06 | 4 | Filter-/Bedingungseditor Teil des EP |
| Dyn. Produktgruppe ändern | EI | D-06 | 4 | |
| Dyn. Produktgruppe löschen | EI | D-06 | 4 | |
| Dyn. Produktgruppe duplizieren | EI | D-06 | 4 | Duplicate-Action im Code bestätigt (R-09) |

## Nicht gewertet (mit Grund)

| Funktion | Grund |
|---|---|
| Produktvorschau in dyn. Produktgruppe („passende Produkte") | eingebettete Hilfe im Bearbeitungs-EP, nicht eigenständig (R-08) |
| Bewertungs-Tab im Produkt-Detail | Teilmenge der Bewertungsliste (Einmaligkeit/Maximalausprägung) |
| Tag-Anlage inline im Produktformular | gleiche Logik wie Tag-Verwaltung → Einmaligkeit, gezählt in A9 |
| Medien-Upload im Produktkontext | gleiche Logik wie Medienverwaltung → Einmaligkeit, gezählt in A2 |
| „Im Storefront öffnen", Tab-/Grid-Navigation, Spaltenkonfiguration | Navigation/UI-Personalisierung |
| Vererbungs-Reset bei Varianten | Teil von Produkt ändern |
| Massenbearbeitung (Bulk-Edit) Produkte | eigene Verarbeitungslogik, gezählt in A8 |

## Zwischenbilanz

| Typ | Anzahl | FP |
|---|---|---|
| EI | 17 | 68 |
| EO | 0 | 0 |
| EQ | 10 | 40 |
| **Summe A1** | **27 EPs** | **108 FP** |
