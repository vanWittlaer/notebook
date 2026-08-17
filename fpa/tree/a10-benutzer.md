# Zählpaket A10 — Benutzer, Profil & Dashboard (Admin)

Status: **gezählt** (2026-08-15) · Module: sw-users-permissions,
sw-integration, sw-profile, sw-dashboard, sw-login

| Elementarprozess | Typ | Bestände (FTR) | FP | Bemerkung |
|---|---|---|---|---|
| Benutzerliste anzeigen | EQ | D-43 | 4 | |
| Benutzer-Detail anzeigen | EQ | D-43, D-44 | 4 | |
| Benutzer anlegen | EI | D-43, D-44 | 4 | |
| Benutzer ändern | EI | D-43, D-44 | 4 | |
| Benutzer löschen | EI | D-43 | 4 | |
| Rollenliste anzeigen | EQ | D-44 | 4 | |
| Rollen-Detail anzeigen | EQ | D-44 | 4 | Privilegienmatrix |
| Rolle anlegen | EI | D-44 | 4 | |
| Rolle ändern | EI | D-44 | 4 | |
| Rolle löschen | EI | D-44 | 4 | |
| Integrationsliste anzeigen | EQ | D-45 | 4 | |
| Integration anlegen | EI | D-45 | 4 | Modal, Schlüsselgenerierung Teil des EP |
| Integration ändern | EI | D-45 | 4 | |
| Integration löschen | EI | D-45 | 4 | |
| Eigenes Profil ändern | EI | D-43 | 4 | Self-Service-Teilmenge + Passwort, eigene Logik |
| Anmelden | EI | D-43 | 4 | Steuerdaten, Systemverhalten (PHB 4.2.1) |
| Abmelden | EI | D-43 | 4 | PHB-Präzedenz „Identität abmelden" (Kap. 4.2.12) |
| Passwort zurücksetzen | EI | D-43 | 4 | Anfordern + Neusetzen = ein EP |
| Dashboard-Statistik anzeigen | EO | D-24 | 5 | Umsatz/Bestellungen berechnet/aggregiert, bestätigt (R-19) |

## Nicht gewertet (mit Grund)

| Funktion | Grund |
|---|---|
| „Letzte Bestellungen" auf Dashboard | Teilmenge Bestellliste (Einmaligkeit) |
| Eigene API-Zugangsschlüssel im Profil | Teil von Profil ändern |
| Spracheinstellung der Admin-UI | UI-Personalisierung (user_config), technisch |
| SSO-/Inaktivitäts-Module (sw-sso-error, sw-inactivity-login) | technische Fehler-/Sessionbehandlung |

## Zwischenbilanz

| Typ | Anzahl | FP |
|---|---|---|
| EI | 13 | 52 |
| EO | 1 | 5 |
| EQ | 5 | 20 |
| **Summe A10** | **19 EPs** | **77 FP** |
