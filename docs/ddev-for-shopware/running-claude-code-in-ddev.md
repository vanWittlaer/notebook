# Running Claude Code in ddev

### Why?

1. Running Claude natively on your machine potentially gives it access to everything what's on your machine. If you run Claude just from within your ddev container, it is, by nature, restricted to what is available from within it.
2. Provide the same version of Claude to all project team mates without the need for individual installs.

### The ddev-claude-code add-on

#### Install the add-on

You can simply install this as a ddev add-on in your project. Just run

```bash
ddev add-on get vanWittlaer/ddev-claude-code
```

This add-on also facilitates committing and signing commits from within the container.

Please note that there are several other ddev extensions available to enable Claude Code; you can find an overview at <https://addons.ddev.com/?search=claude>. All of these extensions serve specific (and mostly useful) purposes. Ultimately, the decision is yours.

#### Restart ddev and start Claude Code

*  `ddev restart`
* Start claude with `ddev claude`.
* The first time you will have to authenticate with your Claude account. Follow Claude instructions.

#### Committing and Signing

To allow Claude Code to commit to the project repo, you need to add a file `config.git-signing.local.yaml` to your `.ddev` folder. Also, run `ddev auth ssh` to forward your local private key to the container. Both is documented in the add-on's [readme](https://github.com/vanWittlaer/ddev-claude-code/blob/main/README.md).

#### Using PhpStorm's Claude Code Plugin

If you use PhpStorm's Claude Code plugin (highly recommended), open your IDE settings, navigate to Claude Code and set `ddev claude` as the Claude command.
