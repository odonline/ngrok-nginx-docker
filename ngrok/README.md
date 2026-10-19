# Ngrok Configuration Guide (v3)

Ngrok uses a configuration file (`ngrok.yml`) to store your authentication token and endpoint configurations.

---

## 1. Default File Locations

Depending on your operating system, `ngrok.yml` is located at:

| OS | Default Location |
| :--- | :--- |
| **Windows** | `%LOCALAPPDATA%\ngrok\ngrok.yml` (e.g. `C:\Users\<user>\AppData\Local\ngrok\ngrok.yml`) |
| **macOS** | `~/Library/Application Support/ngrok/ngrok.yml` |
| **Linux** | `~/.config/ngrok/ngrok.yml` |

---

## 2. Setting Up Your Authtoken

Before starting the tunnel, authenticate your Ngrok agent:

```bash
ngrok config add-authtoken <YOUR_TOKEN>
```

This will automatically create or update your default `ngrok.yml` with your account's authtoken.

---

## 3. Adding the Switcher Endpoint

Open your `ngrok.yml` and add the `endpoints` section from [ngrok.example.yml](file:///ngrok.example.yml):

```yaml
version: "3"
agent:
  authtoken: <YOUR_AUTHTOKEN>

endpoints:
  - name: my-switcher-endpoint
    url: https://YOUR-SUBDOMAIN.ngrok-free.app # (Optional if using free static domain)
    upstream:
      url: 3010 # Must match SWITCHER_PORT
```

---

## 4. Starting Ngrok

You can start the tunnel using either:

### Method A: Start named endpoint from default config
```bash
ngrok start my-switcher-endpoint
```

### Method B: Start directly specifying a local config file
```bash
ngrok start --config ./ngrok/ngrok.example.yml my-switcher-endpoint
```

### Method C: Simple CLI tunnel (without endpoint config)
```bash
ngrok http 3010 --url=YOUR-SUBDOMAIN.ngrok-free.app
```
