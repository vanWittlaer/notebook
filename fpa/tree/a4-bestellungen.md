# Zählpaket A4 — Bestellungen & Belege (Admin)

Status: **gezählt** (2026-08-15) · Modul: sw-order
(Beleg-Konfiguration → A9; Belegerzeugung hier)

| Elementarprozess | Typ | Bestände (FTR) | FP | Bemerkung |
|---|---|---|---|---|
| Bestellliste anzeigen | EQ | D-24 | 4 | |
| Bestell-Detail anzeigen | EQ | D-24, D-19, D-25 | 4 | inkl. Historie, Positionen, Belegliste |
| Bestellung anlegen | EI | D-24, D-19, D-01, D-28 | 4 | sw-order-create (Code-bestätigt) |
| Bestellung ändern | EI | D-24, D-01 | 4 | Positionen, Adressen, Rabatte — Order-Editing |
| Bestellung löschen | EI | D-24 | 4 | |
| Statuswechsel (Bestellung/Zahlung/Lieferung) | EI | D-24 | 4 | ein EI, bestätigt (R-19) |
| Beleg erzeugen: Rechnung | EO | D-25, D-24, D-27 | 5 | je Belegtyp eigene Logik (PHB-Druckformate) |
| Beleg erzeugen: Lieferschein | EO | D-25, D-24, D-27 | 5 | |
| Beleg erzeugen: Gutschrift | EO | D-25, D-24, D-27 | 5 | |
| Beleg erzeugen: Stornorechnung | EO | D-25, D-24, D-27 | 5 | |
| Eigenen Beleg hochladen | EI | D-25 | 4 | Upload statt Generierung, eigene Logik |
| Beleg anzeigen/herunterladen | EQ | D-25 | 4 | Abruf gespeichertes PDF, keine Ableitung z. Zt. der Anzeige |
| Beleg per E-Mail versenden | EO | D-25, D-24, D-31 | 5 | sw-order-send-document-modal (Code-bestätigt) |

## Nicht gewertet (mit Grund)

| Funktion | Grund |
|---|---|
| Rückerstattungs-UI (Captures/Refunds) | keine OOB-Zahlungsart mit Refund-Unterstützung; Entities Teil D-24 |
| Bestellhistorie | Teil Bestell-Detail; state_machine_history technisch |
| Gastbestellung-Konvertierung | nicht OOB |
| Nummernvergabe Beleg/Bestellung | automatisch, technisch (D-27 wird referenziert) |

## Zwischenbilanz

| Typ | Anzahl | FP |
|---|---|---|
| EI | 5 | 20 |
| EO | 5 | 25 |
| EQ | 3 | 12 |
| **Summe A4** | **13 EPs** | **57 FP** |
