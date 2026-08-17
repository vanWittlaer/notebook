# Zählpaket S1 — Discovery (Storefront)

Status: **gezählt** (2026-08-15)

Leitentscheidung (R-14): Anzeigen mit **abgeleiteten/berechneten Daten**
(Ab-Preise über Varianten, Filter-Facetten, Relevanz-Ranking,
Bewertungsdurchschnitt, Steuer-/Preisdarstellung) = **EO** („im Zweifel
Ausgabe", PHB 5.1.1). Reine Inhaltsanzeige = EQ.

| Elementarprozess | Typ | Bestände (FTR) | FP | Bemerkung |
|---|---|---|---|---|
| Startseite / CMS-Seite / Landingpage anzeigen | EQ | D-14, D-08, D-15 | 4 | eine Render-Logik für Erlebniswelt-Inhalte inkl. Shopseiten (Impressum etc.) |
| Kategorie-Listing anzeigen | EO | D-01, D-05, D-04 | 5 | inkl. Filter, Sortierung, Paginierung (Maximalausprägung); Facetten + Ab-Preise berechnet |
| Produktdetailseite anzeigen | EO | D-01, D-02, D-04, D-15 | 5 | Preisberechnung, Variantenauflösung, Cross-Selling, Bewertungsschnitt |
| Suchergebnisse anzeigen | EO | D-01, D-40 | 5 | Ranking = Berechnung; sonst Logik wie Listing, aber eigene Verarbeitung |
| Suchvorschläge anzeigen (Suggest) | EO | D-01, D-40 | 5 | eigene Route/Logik, reduzierte Ausgabe |
| Produktbewertung schreiben | EI | D-02, D-19 | 4 | Upsert: Ändern der eigenen Bewertung = gleiche Route/Logik (R-15) |

## Nicht gewertet (mit Grund)

| Funktion | Grund |
|---|---|
| Variantenwechsel auf der PDP | Parameter desselben Anzeige-EP |
| Bewertungsliste auf der PDP | Bestandteil der PDP-Anzeige |
| Hauptnavigation, Breadcrumb, Footer-Links | Navigation (PHB 5.4) |
| Cookie-Hinweis/-Präferenzen | Benutzerhilfe, clientseitig (PHB 5.4: Cookies) |

## Zwischenbilanz

| Typ | Anzahl | FP |
|---|---|---|
| EI | 1 | 4 |
| EO | 4 | 20 |
| EQ | 1 | 4 |
| **Summe S1** | **6 EPs** | **28 FP** |
