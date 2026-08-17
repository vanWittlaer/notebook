# Datenbestände — ILF/EIF-Register

Quelle: 145 produktive `EntityDefinition`-Klassen aus `v6.7.13.0`
(Test-Fixtures entfernt; 53 Translation- und 37 Mapping-Tabellen sind
technische Bestandteile ihrer Eltern-Entities und werden nicht separat
geführt — Anwendersicht, PHB Kap. 3.7).

Bewertung nach Zählkonvention: **ILF = 7 FP, EIF = 5 FP** (Low, konsequent).

Stand: alle Einträge per Interview bestätigt (R-01 bis R-04, 2026-08-15).

## Interne Datenbestände (ILF)

### Katalog

| Nr | Datenbestand | Entities | Anmerkung |
|---|---|---|---|
| D-01 | Produkt | product, product_price, product_media, product_download, product_visibility, product_configurator_setting, product_feature_set, product_cross_selling (+assigned_products), main_category | Varianten = Datensätze desselben Bestands |
| D-02 | Produktbewertung | product_review | gepflegt vom Shop-Kunden, eigener Lebenszyklus |
| D-03 | Hersteller | product_manufacturer | |
| D-04 | Eigenschaft (Merkmal) | property_group, property_group_option | |
| D-05 | Kategorie | category | |
| D-06 | Dynamische Produktgruppe | product_stream, product_stream_filter | |
| D-07 | Produktvergleichs-Feed | product_export | Google Shopping etc. |
| D-08 | Landing Page | landing_page | |
| D-09 | Tag | tag | |
| D-10 | Maßeinheit | unit | |
| D-11 | Lieferzeit | delivery_time | |
| D-12 | Steuer | tax, tax_rule | tax_rule_type = Codedaten |
| D-13 | Währung | currency, currency_country_rounding | |

### Inhalte & Medien

| Nr | Datenbestand | Entities | Anmerkung |
|---|---|---|---|
| D-14 | Erlebniswelt (CMS-Seite) | cms_page, cms_section, cms_block, cms_slot | |
| D-15 | Medien | media, media_folder, media_folder_configuration, media_default_folder, media_thumbnail_size | media_thumbnail = abgeleitet (generiert) |
| D-16 | Theme-Konfiguration | theme | |
| D-17 | Textbaustein | snippet, snippet_set | |
| D-18 | SEO | seo_url_template, seo_url | Templates + manuelle Overrides gepflegt; generierte URLs abgeleitet (R-04) |

### Kunden

| Nr | Datenbestand | Entities | Anmerkung |
|---|---|---|---|
| D-19 | Kunde | customer, customer_address | customer_recovery = technischer Token |
| D-20 | Kundengruppe | customer_group | |
| D-21 | Merkzettel | customer_wishlist, customer_wishlist_product | Feature default aus, im Scope per R-03 |
| D-22 | Newsletter-Empfänger | newsletter_recipient | |
| D-23 | Anrede | salutation | |

### Bestellung & Belege

| Nr | Datenbestand | Entities | Anmerkung |
|---|---|---|---|
| D-24 | Bestellung | order, order_address, order_customer, order_delivery (+position), order_line_item (+download), order_transaction (+capture, +refund, +refund_position) | ein logischer Bestand; Satelliten = RETs |
| D-25 | Beleg (Dokument) | document, document_file | erzeugte Rechnungen/Lieferscheine, gespeichert + erneut abrufbar, eigener Upload möglich (R-04) |
| D-26 | Dokumenten-Konfiguration | document_base_config, document_base_config_sales_channel | document_type = Codedaten |
| D-27 | Nummernkreis | number_range, number_range_sales_channel | number_range_type = Codedaten, number_range_state = technischer Zähler |

### Marketing & Automatisierung

| Nr | Datenbestand | Entities | Anmerkung |
|---|---|---|---|
| D-28 | Aktion (Promotion) | promotion, promotion_discount (+prices), promotion_individual_code, promotion_setgroup, promotion_sales_channel | |
| D-29 | Regel (Rule Builder) | rule, rule_condition | |
| D-30 | Flow | flow, flow_sequence | flow_template = Codedaten (ausgeliefert, nicht pflegbar) |
| D-31 | Mail-Vorlage | mail_template, mail_header_footer | mail_template_type = Codedaten |

### Struktur & Einstellungen

| Nr | Datenbestand | Entities | Anmerkung |
|---|---|---|---|
| D-32 | Verkaufskanal | sales_channel, sales_channel_domain, sales_channel_analytics | sales_channel_type = Codedaten |
| D-33 | Einstellungen | system_config | Steuerdaten, vom Anwender gepflegt; ein logischer Bestand für alle Settings-Bereiche (R-04) |
| D-34 | Land | country, country_state | |
| D-35 | Sprache | language | locale = Codedaten |
| D-36 | Versandart | shipping_method, shipping_method_price | |
| D-37 | Zahlungsart | payment_method | |
| D-38 | Zusatzfeld | custom_field_set, custom_field, custom_field_set_relation | |
| D-39 | Produktsortierung | product_sorting | in Einstellungen gepflegt |
| D-40 | Suchkonfiguration | product_search_config, product_search_config_field | search_keyword / keyword_dictionary = abgeleiteter Index |
| D-41 | Import/Export-Profil | import_export_profile | |
| D-42 | Import/Export-Vorgang | import_export_log, import_export_file | Protokoll, aber fachlich nachgefragt (Aktivitätenliste, Fehlerdatei-Download) (R-04) |

### Storefront (Nachtrag)

| Nr | Datenbestand | Entities | Anmerkung |
|---|---|---|---|
| D-47 | Warenkorb | cart (kein EntityDefinition — serverseitige Persistenz) | Nachtrag per R-18: PHB 5.4 nennt den Warenkorb explizit als ILF. Lehre: technische Enumeration ≠ vollständig |

### Benutzer & Zugriff

| Nr | Datenbestand | Entities | Anmerkung |
|---|---|---|---|
| D-43 | Benutzer | user, user_config, user_access_key | user_recovery = technischer Token |
| D-44 | Rolle (ACL) | acl_role | |
| D-45 | Integration | integration | |

### Plattform

_Entfallen per R-02: D-46 (Erweiterung: plugin, app), D-90 (Extension-Katalog),
D-91 (Update-Information). Erweiterungsverwaltung, FRW und Update-Check sind
außerhalb des Scope (kaufmännische Sicht). Nummern bleiben reserviert._

## Referenzdatenbestände (EIF)

**Keine.** Die Anwendung referenziert out of the box keine extern gepflegten
fachlichen Datenbestände (R-02). Das ist ein dokumentiertes Ergebnis, kein
Versäumnis.

## Ausgeschlossene Entities

| Entities | Grund |
|---|---|
| state_machine, state_machine_state, state_machine_transition | Codedaten: ausgelieferte Status-Workflows, nicht anwenderpflegbar |
| state_machine_history, log_entry, webhook_event_log, version, version_commit, version_commit_data | technische Protokolle/Versionierung |
| scheduled_task, script, custom_entity, webhook | technische Plattform / Entwickler-API, keine Admin-UI |
| notification (2×) | Admin-Message-Center, technische UX |
| app_action_button, app_template, app_script_condition, app_administration_snippet, app_cms_block, app_flow_action, app_flow_event, app_payment_method, app_shipping_method, app_mcp_prompt, app_mcp_resource, app_mcp_tool | technische Registry installierter Apps (OOB leer) |
| sales_channel_file, sales_channel_tracking_customer, sales_channel_tracking_order | technische Infrastruktur (Datei-Auslieferung, Feed-Tracking) |
| customer_recovery, user_recovery | technische Token der Passwort-Reset-EPs |
| product_search_keyword, product_keyword_dictionary, media_thumbnail, number_range_state, seo_url (generierter Teil) | abgeleitete/generierte Daten |
| locale, *_type-Entities (document_type, mail_template_type, number_range_type, tax_rule_type, sales_channel_type), flow_template, tax_provider | Codedaten |
| plugin, app | Erweiterungsverwaltung out of scope (R-02) |

## Vorläufige Bilanz Datenbestände

- ILF: **46** × 7 FP = **322 FP** (alle bestätigt, R-02/R-03/R-04/R-18)
- EIF: **0**
- **Summe Datenbestände: 322 FP**
