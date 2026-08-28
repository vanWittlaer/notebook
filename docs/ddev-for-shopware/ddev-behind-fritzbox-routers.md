# DDEV behind Fritz!Box Routers

`ddev start` succeeds, but the browser answers `https://myshop.ddev.site` with
"server IP address could not be found". Nothing is wrong with your project — the
Fritz!Box is swallowing the DNS answer, and being the default router in so many
German homes and offices, it hits us here disproportionately often.

`ddev.site` is a real domain whose wildcard record resolves to `127.0.0.1`. A
Fritz!Box discards DNS answers that point from a public name into the local
network — *DNS rebind protection* — and cannot tell your project apart from an
attack. Confirm with `ping -c 1 myshop.ddev.site`: "No address associated with
hostname" means the name never resolved.

## The fix

In the Fritz!Box interface at <http://fritz.box>, go to **Home Network → Network
→ Network Settings → Additional Settings → DNS Rebind Protection** (*Heimnetz →
Netzwerk → Netzwerkeinstellungen → Weitere Einstellungen → DNS-Rebind-Schutz*)
and enter `ddev.site` in the **Host name exceptions** field
(*Hostname-Ausnahmen*).

That one entry covers every project, since they all live under `*.ddev.site`. It
takes effect immediately; add a custom `project_tld` on its own line if you use
one.

If you cannot change the router, ddev's
[troubleshooting guide](https://docs.ddev.com/en/stable/users/usage/troubleshooting/#dns-rebinding-prohibited-mostly-on-fritzbox-routers)
lists the alternatives — a public resolver such as `1.1.1.1`, or living with
ddev's `/etc/hosts` fallback, which is what the recurring sudo prompt on `ddev
start` comes from.
