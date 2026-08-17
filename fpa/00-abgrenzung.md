# FPA Shopware 6.7 — Abgrenzung und Zählkonventionen

Arbeitsdokument der Function-Point-Analyse. Methodik nach IFPUG CPM in der
praktischen Auslegung des „Praxishandbuch FPA" (PHB). Alle Festlegungen hier
sind bindend für die gesamte Zählung; Abweichungen nur mit dokumentiertem Grund.

## Zweck und Typ der Zählung

- **Typ:** Basiszählung (Anwendungszählung) einer bestehenden Anwendung.
- **Zählobjekt:** Shopware **6.7.13.0**, wie ausgeliefert („out of the box"),
  ohne Extensions, Default-Theme, Standard-Sprachpaket wie installiert.
- **Zweck:** Bestimmung des fachlich-funktionalen Umfangs der
  Standardauslieferung. Übungs-/Referenzzählung; Ergebnis soll u. a. als
  Bezugsgröße für Projektbewertungen dienen können.
- **Bewertungsstandard:** unadjusted FP (kein VAF).

## Anwendungsgrenze

**Eine Anwendung:** Administration **und** Storefront bilden zusammen die
gezählte Anwendung „Shopware Shop".

Begründung: gemeinsame Datenhaltung; zentrale Datenbestände (Kunde, Bestellung)
werden von beiden Seiten gepflegt. Eine Trennung würde dieselben ILFs künstlich
in ILF/EIF-Paare zerlegen. Die Anwendung wird als Einheit versioniert und
ausgeliefert.

Der funktionale Baum gliedert sich in zwei Teilbäume (Admin, Storefront) —
das ist Darstellungsstruktur, keine Grenze.

### Innerhalb der Grenze
- Administration (SPA) mit allen sichtbaren Modulen
- Storefront (Default-Sales-Channel, Default-Theme)
- Admin API und Store API, soweit sie Elementarprozesse für *andere Systeme*
  als Anwender bereitstellen (Systemschnittstellen; Anwender ≠ Mensch)
- Dokumentenerzeugung (Rechnung, Lieferschein, …), Mailversand,
  Import/Export, Flow-/Rule-Builder

### Außerhalb der Grenze (andere Anwendungen)
- Mail-Infrastruktur (SMTP-Server), Browser, Betriebssystem
- Shopware-externe Dienste: Extension Store Backend, shopware.com-Dienste,
  Zahlungsanbieter — Datenübergabe dorthin ist ggf. EO/Schnittstelle,
  die Verarbeitung dort zählt nicht
- Nicht installierte Extensions/Apps

## Scope „out of the box"

**Alles, was die Standardinstallation dem Admin-Benutzer bzw. Shop-Kunden
sichtbar bereitstellt**, einschließlich Import/Export, Flow Builder,
Rule Builder, Dokumente.

Ausschlüsse werden nicht stillschweigend vorgenommen, sondern hier gelistet:

Per Default deaktivierte, aber rein über Einstellungen aktivierbare
Funktionen (z. B. Merkzettel) sind **im Scope** (R-03).

| Ausgeschlossen | Grund |
|---|---|
| Aufruf/Login-Maske als solche | Aufruf ist kein Elementarprozess; Login selbst wird als EP geprüft (Steuerdaten) |
| Cache leeren, Queue-Monitoring, Systemdiagnose | technisch, nicht fachlich — Einzelfallprüfung, Rulings s. 90-rulings.md |
| CLI-Kommandos (bin/console) | Betriebswerkzeug, nicht Anwendersicht (R-01) |
| Erweiterungsverwaltung, Extension Store, First Run Wizard, Update-Check | Plattformkonfiguration, kaufmännisch nicht fachlich (R-02) |
| _(wird ergänzt)_ | |

## Referenzinstallation

- Host-ddev: `sissy-demo.ddev.site` (Zugriff aus Sandbox via
  `host.docker.internal` + Host-Header), Shopware 6.7.13.0, frische
  Installation, FRW nicht durchlaufen, Credentials admin/shopware.
- Quellcode-Referenz: `shopware/shopware` Tag `v6.7.13.0`
  (Shallow-Clone im Sandbox-Scratchpad, reproduzierbar).
- Interviewpartner (Anwendersicht): Benny.

## Zählkonventionen (PHB Kap. 5)

1. **Komplexitäts-Näherung, konsequent für die gesamte Zählung:**
   - Elementarprozesse: **Average** → EI = 4 FP, EO = 5 FP, EQ = 4 FP
   - Datenbestände: **Low** → ILF = 7 FP, EIF = 5 FP
   - Kein fallweises „Auszählen" einzelner Funktionen.
2. **Ausgabe oder Abfrage:** im Zweifel **Ausgabe** (EO). Nur als EQ werten,
   wo die CPM-Kriterien unmittelbar erkennbar erfüllt sind (reine Anzeige
   ohne Ableitung/Berechnung). Druckausgaben/Dokumente: im Regelfall EO.
3. **Systemschnittstellen:** Unterscheidung EO/EQ irrelevant → EO.
   Fachlichen Inhalt erfragen, nicht die technische Struktur zählen
   (verschiedene fachliche Inhalte im selben Layout = mehrere EPs).
4. **Einmaligkeit:** gleiche Verarbeitungslogik + gleiche FTRs = ein EP,
   egal von wie vielen Stellen aufrufbar. Maximalausprägung zählt;
   eingeschränkte Varianten (Filter, Teilmengen) zählen nicht separat.
5. **Navigation, Reiter, Links ohne Datenübergabe:** zählen nicht.
   Links mit fachlicher Datenübergabe an andere Anwendung: EO.
6. **Listboxen:** keine Pauschalregel. Werteliste (diskreter Wertebereich,
   nicht gepflegt) = nichts; Daten aus ILF/EIF mit fachlichem Gehalt = EQ.
7. **Import/Export:** je Datenformat eigene Verarbeitungslogik = eigener EP.
8. **Hilfe/Meldungen:** Bestätigungsdialoge sind Teil des EP (DET, hier durch
   Näherung irrelevant). Feld-/Maskenhilfe je einmal für die Anwendung prüfen.
9. **Löschen/Ändern:** je gepflegtem Datenbestand eigene EIs (Standardfrage:
   zu jeder Neuanlage existieren Ändern? Löschen? Anzeigen? Liste? Drucken?).
10. **Codedaten** (technische Konfiguration, nicht fachlich gepflegt):
    kein Datenbestand.

## Dokumentationsstruktur

| Datei | Inhalt |
|---|---|
| `00-abgrenzung.md` | dieses Dokument |
| `10-datenbestaende.md` | ILF/EIF-Register mit logischer Gruppierung |
| `tree/*.md` | funktionaler Baum je Zählpaket, mit Zwischenbilanz |
| `90-rulings.md` | Entscheidungslog (nicht offensichtliche Wertungen, mit Begründung) |
| `91-fragen.md` | offene Fragen an den Anwender (Benny), mit Antworten |
| `99-bilanz.md` | Gesamtbilanz über alle Zählpakete |
