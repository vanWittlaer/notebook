# Zählpakete

Reihenfolge: Admin nach Menüstruktur (PHB 4.2.2: „Menüstruktur systematisch
aufblättern und abhaken"), dann Storefront nach Kundenprozess. Jedes Paket
endet mit einer Zwischenbilanz in `tree/<paket>.md`; Gesamtbilanz in
`99-bilanz.md`.

## Grundsatz-Ruling für APIs (R-05, vorläufig)

Admin API und Store API stellen dieselben fachlichen Elementarprozesse bereit
wie Admin-SPA bzw. Storefront (gleiche Verarbeitungslogik, gleiche Bestände)
→ per **Einmaligkeit keine separaten EPs**. Nur API-Funktionen ohne
UI-Äquivalent werden einzeln geprüft (bisher alle als technisch
ausgeschlossen, z. B. Webhooks).

## Admin

| Paket | Datei | Module | Bestände (primär) |
|---|---|---|---|
| A1 Katalog | tree/a1-katalog.md | sw-product, sw-manufacturer, sw-property, sw-review, sw-product-stream | D-01…D-06 |
| A2 Kategorien & Inhalte | tree/a2-inhalte.md | sw-category, sw-cms, sw-landing-page, sw-media | D-05, D-08, D-14, D-15 |
| A3 Kunden | tree/a3-kunden.md | sw-customer | D-19…D-23 |
| A4 Bestellungen & Belege | tree/a4-bestellungen.md | sw-order, sw-settings-document (Belegerzeugung) | D-24…D-27 |
| A5 Marketing | tree/a5-marketing.md | sw-promotion-v2, sw-newsletter-recipient | D-28, D-22 |
| A6 Automatisierung | tree/a6-automatisierung.md | sw-flow, sw-settings-rule, sw-mail-template | D-29…D-31 |
| A7 Verkaufskanäle & Feeds | tree/a7-verkaufskanaele.md | sw-sales-channel, sw-export-channel-tracking | D-32, D-07 |
| A8 Import/Export & Bulk | tree/a8-import-export.md | sw-import-export, sw-bulk-edit | D-41, D-42, div. |
| A9 Einstellungen | tree/a9-einstellungen.md | sw-settings-* (alle fachlichen; Ausschlüsse je Modul dokumentieren) | D-33 u. a. |
| A10 Benutzer, Profil & Dashboard | tree/a10-benutzer.md | sw-users-permissions, sw-integration, sw-profile, sw-dashboard, sw-login | D-43…D-45 |

Nicht gezählte Module (mit Grund): sw-extension, sw-extension-sdk,
sw-first-run-wizard, sw-settings-store, sw-settings-shopware-updates (R-02);
sw-settings-cache, sw-settings-logging, sw-settings-message-stats,
sw-settings-usage-data, sw-custom-entity, sw-privilege-error, sw-sso-error,
sw-inactivity-login (technisch — Einzel-Rulings im jeweiligen Paket);
sw-settings-services (Shopware-Dienste, R-02-analog, Ruling in A9).

## Storefront

| Paket | Datei | Umfang | Bestände (primär) |
|---|---|---|---|
| S1 Discovery | tree/s1-discovery.md | Startseite, Listing, Filter, Suche + Suggest, Produktdetail, Varianten, Bewertungen, CMS-/Landing Pages, Navigation | D-01, D-02, D-05, D-14 |
| S2 Kaufprozess | tree/s2-kaufprozess.md | Warenkorb, Checkout (Gast/Konto), Zahlungs-/Versandwahl, Gutscheincode, Bestellabschluss | D-24, D-28, D-36, D-37 |
| S3 Kundenkonto | tree/s3-kundenkonto.md | Registrierung, Login/Logout, Passwort-Reset, Profil, Adressen, Bestellungen, Nachbestellen, Merkzettel, Downloads | D-19, D-21, D-24 |
| S4 Querschnitt | tree/s4-querschnitt.md | Newsletter-An-/Abmeldung, Kontaktformular, Sprach-/Währungswechsel (EI Steuerdaten), Sitemap, Wartungsseite | D-22, D-33 |

## Arbeitsstand

| Paket | Status | FP |
|---|---|---|
| Datenbestände | ✅ abgeschlossen | 315 |
| A1 Katalog | ✅ gezählt | 108 |
| A2 Kategorien & Inhalte | ✅ gezählt | 105 |
| A3 Kunden | ✅ gezählt | 32 |
| A4 Bestellungen & Belege | ✅ gezählt | 57 |
| A5 Marketing | ✅ gezählt | 44 |
| A6 Automatisierung | ✅ gezählt | 88 |
| A7 Verkaufskanäle & Feeds | ✅ gezählt | 29 |
| A8 Import/Export & Bulk | ✅ gezählt | 149 |
| A9 Einstellungen | ✅ gezählt | 364 |
| A10 Benutzer & Dashboard | ✅ gezählt | 77 |
| **Admin gesamt** | **258 EPs** | **1.053** |
| S1 Discovery | ✅ gezählt | 28 |
| S2 Kaufprozess | ✅ gezählt | 38 |
| S3 Kundenkonto | ✅ gezählt | 89 |
| S4 Querschnitt | ✅ gezählt | 26 |
| **Storefront gesamt** | **43 EPs** | **181** |
| Datenbestände (46 ILF, inkl. Nachtrag D-47) | ✅ | 322 |
| **Gesamtergebnis** | **301 EPs + 46 ILF** | **1.556 FP** |
