# How to generate INSTANCE\_ID and APP\_SECRET

INSTANCE\_ID

```bash
openssl rand -hex 32
```

APP\_SECRET - there is a command provided by Shopware

```bash
bin/console system:generate-app-secret
```
