# Running Claude Code in DDEV

### Why?

1. Running Claude natively on your machine potentially gives it access to everything on it. Run Claude from inside your DDEV container instead, and it is restricted, by nature, to whatever that container can reach.
2. Everyone on the project gets the same version of Claude, with no individual installs to maintain.

Why not just use the Docker sandbox? It would give you even stronger isolation, thanks to its
built-in firewall. The sandbox, however, cannot run host commands, so Claude won't be able to run
`ddev` commands for you — which is often exactly what you want it to do for analysis and testing.
For the same reason, it cannot drive Playwright to evaluate and test the frontend, something Claude
Code does easily from inside the DDEV container.

### The ddev-claude-code add-on

#### Install the add-on

You can simply install this as a DDEV add-on in your project. Just run

```bash
ddev add-on get vanWittlaer/ddev-claude-code
```

This add-on also facilitates committing and signing commits from within the container.

Please note that there are several other DDEV extensions available to enable Claude Code; you can find an overview at <https://addons.ddev.com/?search=claude>. All of these extensions serve specific (and mostly useful) purposes. Ultimately, the decision is yours.

#### Restart DDEV and start Claude Code

*  `ddev restart`
* Start claude with `ddev claude`.
* The first time you will have to authenticate with your Claude account. Follow Claude instructions.

#### Committing and Signing

To allow Claude Code to commit to the project repo, you need to add a file `config.git-signing.local.yaml` to your `.ddev` folder. Also, run `ddev auth ssh` to forward your local private key to the container. Both are documented in the add-on's [readme](https://github.com/vanWittlaer/ddev-claude-code/blob/main/README.md).

#### Using PhpStorm's Claude Code Plugin

If you use PhpStorm's Claude Code plugin (highly recommended), open your IDE settings, navigate to Claude Code and set `ddev claude` as the Claude command.
