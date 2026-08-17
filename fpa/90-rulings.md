# Entscheidungslog (Rulings)

Nicht offensichtliche Zählentscheidungen, chronologisch. Format:
**R-nn** — Gegenstand — Entscheidung — Begründung — Quelle (CPM/PHB/Interview).

**R-01** — CLI-Kommandos (`bin/console`) — **ausgeschlossen**. Anwender der
Zählung sind Händler (Admin) und Shop-Kunde (Storefront); der Betreiber an der
Kommandozeile nutzt ein Betriebswerkzeug. Fachliche Funktionen, die auch per
CLI erreichbar sind (Import, Indexierung), sind über die Admin-Funktionalität
abgedeckt (Einmaligkeit). — Interview 2026-08-15 (F-01).

**R-02** — Erweiterungsverwaltung (Extension-Store-UI, Plugin-/App-Verwaltung),
First Run Wizard, Update-Check — **außerhalb des Scope**. Aus kaufmännischer
Sicht des Shops technische Plattformkonfiguration, keine Unterstützung des
Geschäftsprozesses (PHB: fachliche vs. technische Funktionalität bei
Standardsoftware). Damit entfallen D-46 (ILF) sowie D-90/D-91 — die Zählung
hat **keine EIFs** (in sich geschlossene Anwendung ohne extern gepflegte
fachliche Referenzdaten OOB). Gegenargument dokumentiert (Händler bedient die
Extension-UI selbst), vom Anwender verworfen. — Interview 2026-08-15 (F-07).

**R-03** — Scope-Definition „out of the box": **alle ausgelieferten
fachlichen Funktionen, die rein über Einstellungen erreichbar sind** (ohne
Extension/Code), auch wenn per Default deaktiviert (z. B. Merkzettel,
Wartungsmodus). Der Einstellungs-Toggle ist Steuerdaten, die Funktionalität
ist Teil der Standardauslieferung. — Interview 2026-08-15 (F-02).

**R-04** — Bestätigt per Interview 2026-08-15: Beleg = ILF D-25 (F-03);
system_config = ein ILF D-33 „Einstellungen" (F-04); SEO = ILF D-18 aus
Templates + manuellen Overrides, generierte URLs abgeleitet (F-05);
Import/Export-Vorgang = ILF D-42, fachlich gefordertes Protokoll (F-06).

**R-06** — `state_machine` / `state_machine_state` bleiben **Codedaten**
(kein ILF). Befund Code v6.7.13.0: ACL des Moduls `sw-settings-state-machine`
kennt nur read/update — Status können umbenannt, aber nicht angelegt/gelöscht
werden; Struktur (Status, Übergänge) ist fix. Werteliste i. S. v. PHB 5.2.1 /
CPM code data: auch anwenderseitiges Umbenennen ist Customizing, kein
fachlicher Datenbestand; die Umbenennen-Funktion wird nicht gewertet
(Ausweis in A9 unter „Nicht gewertet"). Statuswechsel einer Bestellung ist
davon unberührt: EI auf D-24 (Paket A4). — Codebefund + Interview (F-08).

**R-05 (bestätigt)** — Store-seitige und Admin-seitige Funktionen sind immer
getrennte EPs (verschiedene Verarbeitungslogik/Kontext; Trennung A-/S-Baum).
Die API-Repräsentation derselben Funktion zählt nicht separat: Admin-SPA
arbeitet vollständig über die Admin API, Storefront delegiert an dieselben
Store-API-Routen → Einmaligkeit. — Interview 2026-08-15 (F-09).

**R-07** — Standardmuster je pflegbarem Bestand im Admin: Liste (EQ),
Detail anzeigen (EQ), Neu (EI), Ändern (EI), Löschen (EI). Das Detail-EQ folgt
dem PHB-Präzedenzfall „Anzeige Eigenschaften" (Outlook, Kap. 4.2.8): reine
Anzeige hat andere Verarbeitungslogik als Ändern, auch bei gleicher Maske
(Viewer-Rolle). Abweichungen je Modul werden dokumentiert.

**R-08** — Eingebettete Hilfen innerhalb eines EPs (Live-Vorschau im Editor,
Inline-Unterdialoge à la „E-Mail hinzufügen", Zwischenlisten) sind keine
eigenständigen EPs (PHB 4.2.5). Eigenständig nur, wenn die Anzeige auch ohne
den umgebenden EP fachlich sinnvoll ist.

**R-09** — „Duplizieren" ist ein eigener EI (Verarbeitungslogik: Kopie eines
Quelldatensatzes mit Vorbelegung ≠ Neuanlage). Gilt einheitlich, wo die
Funktion existiert (Produkt, dyn. Produktgruppe, CMS-Seite, …).

**R-10** — Sub-Dialoge, die innerhalb einer Detailmaske unabhängig committen:
**Teil des Eltern-Ändern-EP**, wenn reine Detailkonfiguration (Bundesstaaten,
Steuer-Länderregeln, Währungsrundungen, Versandpreismatrix); **eigene EPs**,
wenn eigener fachlicher Lebenszyklus aus Anwendersicht (Kundenadressen:
Adressbuch, storefront-relevant, Standard-Setzung). (bestätigt, R-19)

**R-11** — Reine Konfigurationsmasken (system_config): je Maske **1 EI**,
kein Detail-EQ. Begründete Abweichung von R-07: Anzeige der aktuellen Werte
ist integraler Bestandteil des Änderns; anders als Entity-Daten haben
Konfigurationswerte keinen eigenständigen fachlichen Auskunftswert.
(bestätigt, R-19)

**R-12** — Beleg-Handling (Code-bestätigt): Erzeugen je Belegtyp = EO
(Rechnung, Lieferschein, Gutschrift, Stornorechnung — PHB-Präzedenz
Druckformate); eigenen Beleg hochladen = EI; Beleg anzeigen/herunterladen =
EQ; Beleg per E-Mail versenden = EO (sw-order-send-document-modal).

**R-13** — Import/Export je Systemprofil ein EP (verschiedene Datenstruktur =
verschiedene Verarbeitungslogik, PHB-Präzedenz Outlook-Import): Live-Befund
12 Profile → 11 Import-EIs + 12 Export-EOs. Eigene (duplizierte) Profile
erzeugen keine neuen EPs (gleiche Logik, parametrisiert).

**R-14** — Storefront-Anzeigen mit abgeleiteten/berechneten Daten (Listing:
Facetten + Ab-Preise; PDP: Preisberechnung + Bewertungsschnitt; Suche:
Ranking) = **EO**. Reine Inhaltswiedergabe (CMS-/Landing-/Shopseiten) = EQ.
Anwendung von PHB 5.1.1 „im Zweifel Ausgabe".

**R-15** — Storefront-Bewertung: Schreiben und Ändern der eigenen Bewertung =
**ein** EI (eine Route, Upsert-Logik) — bewusst anders als Admin (getrennte
EPs), weil dort getrennte Funktionen mit eigener Logik vorliegen.

**R-16** — Kundenprofil Storefront: Profildaten / E-Mail / Passwort =
**drei** EIs (drei Formulare, drei Commits, je eigene Prüf­logik:
Doppeleingabe, Passwortbestätigung).

**R-17** — Auswahllisten für Anrede, Land, Bundesstaat in Formularen werden
nicht gewertet (PHB 5.2.1, Beispiel „Herr/Frau": Attribut-Wertelisten ohne
eigenständigen fachlichen Gehalt), obwohl die Quellbestände (D-23, D-34)
gepflegt werden — deren Pflege ist in A9 gezählt.

**R-18** — Nachtrag ILF **D-47 Warenkorb** (+7 FP): serverseitig gepflegter
Bestand, von PHB 5.4 ausdrücklich als ILF benannt. Ging durch die technische
Enumeration (kein EntityDefinition) zunächst verloren — dokumentierte Lehre:
Bestandsidentifikation aus Anwendersicht, nicht aus dem Datenmodell.

**R-19 (bestätigt)** — Per Interview 2026-08-15: Statuswechsel = ein EI
(F-10); Dashboard = EO (F-11); R-10 Sub-Dialoge (F-12) und R-11
Konfigmasken (F-13) bestätigt; Test-Mail nicht gewertet (F-14).
