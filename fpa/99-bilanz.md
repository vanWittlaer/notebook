# Gesamtbilanz — FPA Shopware 6.7.13.0

Basiszählung, unadjusted FP, Zählkonventionen s. `00-abgrenzung.md`,
Rulings R-01 bis R-19. Stand: 2026-08-15 — **alle Pakete gezählt**.

## Übersicht

| Bereich | EI | EO | EQ | EPs | FP |
|---|---|---|---|---|---|
| A1 Katalog | 17 | 0 | 10 | 27 | 108 |
| A2 Kategorien & Inhalte | 17 | 1 | 8 | 26 | 105 |
| A3 Kunden | 6 | 0 | 2 | 8 | 32 |
| A4 Bestellungen & Belege | 5 | 5 | 3 | 13 | 57 |
| A5 Marketing | 7 | 0 | 4 | 11 | 44 |
| A6 Automatisierung | 15 | 0 | 7 | 22 | 88 |
| A7 Verkaufskanäle & Feeds | 5 | 1 | 1 | 7 | 29 |
| A8 Import/Export & Bulk | 18 | 13 | 3 | 34 | 149 |
| A9 Einstellungen | 61 | 0 | 30 | 91 | 364 |
| A10 Benutzer & Dashboard | 13 | 1 | 5 | 19 | 77 |
| **Admin** | **164** | **21** | **73** | **258** | **1.053** |
| S1 Discovery | 1 | 4 | 1 | 6 | 28 |
| S2 Kaufprozess | 7 | 2 | 0 | 9 | 38 |
| S3 Kundenkonto | 15 | 1 | 6 | 22 | 89 |
| S4 Querschnitt | 4 | 2 | 0 | 6 | 26 |
| **Storefront** | **27** | **9** | **7** | **43** | **181** |
| **Transaktionen gesamt** | **191** | **30** | **80** | **301** | **1.234** |

## Datenbestände

| Typ | Anzahl | FP |
|---|---|---|
| ILF (à 7, Low) | 46 | 322 |
| EIF | 0 | 0 |

## Ergebnis

| | |
|---|---|
| Elementarprozesse | 301 EPs / 1.234 FP |
| Datenbestände | 46 ILF / 322 FP |
| **Shopware 6.7.13.0 out of the box** | **1.556 FP (unadjusted)** |

## Plausibilisierung

- **FP je ILF**: 1.556 / 46 ≈ **34 FP/ILF** — unterhalb des PHB-Korridors
  (50–200). Interpretation: Shopware ist bestandsreich (viele kleine
  Konfigurations-Bestände mit nur Standard-Fünfer-Pflege); zudem drücken
  die Näherung „alle Bestände Low" und der eine große Sammel-ILF
  „Einstellungen" das Verhältnis.
- **Datenanteil**: 322 / 1.556 ≈ **21 %** — oberhalb des PHB-Korridors
  (5–15 %), gleiche Ursache (viele kleine ILFs, konservative EP-Zählung
  im Storefront). Beide Abweichungen sind erklärbar und dokumentiert,
  kein Hinweis auf Zählfehler.
- **Verteilung**: Admin 85 % / Storefront 15 % der Transaktions-FP —
  plausibel: die fachliche Funktionsvielfalt eines Shopsystems liegt in
  der Verwaltung; der Kaufprozess ist schmal, aber tief.

## Unschärfe

Nach PHB 5.1.2 liegt der Fehler der Komplexitätsnäherung bei ≤ 5 %;
inkl. Identifikationsunschärfe (verdeckte Funktionen, Einmaligkeits-
Grenzfälle) ist das Ergebnis als **1.550 FP ± 10 %** zu lesen.
