# Frontend Work with Claude Code and Playwright

Install the Playwright ddev add-on to your project:

```bash
ddev add-on get codingsasi/ddev-playwright
ddev restart
ddev install-playwright
```

Add a file `.mcp.json` to your project root folder (or extend it if already existing):

```json
{
  "mcpServers": {
    "playwright": {
      "command": "npx",
      "args": [
        "-y", "@playwright/mcp@latest",
        "--headless", "--browser=chromium",
        "--no-sandbox", "--ignore-https-errors", "--isolated"
      ],
      "env": { "PLAYWRIGHT_BROWSERS_PATH": "/opt/playwright-browsers" }
    }
  }
}
```

Tell Claude to use Playwright for browser preview and screenshots.
