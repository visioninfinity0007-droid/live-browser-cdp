# Live Browser CDP

A visual Chromium browser with noVNC preview and Chrome DevTools Protocol access.

## Ports

- `6901` — noVNC browser preview
- `5901` — VNC
- `9222` — Chrome DevTools Protocol

## Environment Variables

```env
VNC_PASSWORD=vision_browser_2026
START_URL=https://www.google.com
CDP_PORT=9222
CHROME_USER_DATA_DIR=/data/chrome-profile
```

## Coolify

Use Dockerfile build.

Expose ports:

```text
6901
9222
```

Domain:

```text
https://browser.visioninfinity.co
```

Persistent storage mount:

```text
/data/chrome-profile
```

Custom Docker Options:

```text
--shm-size=1gb
```

## Test noVNC

Open:

```text
https://browser.visioninfinity.co
```

## Test CDP

From the VPS, get the container IP and run:

```bash
curl http://CONTAINER_IP:9222/json/version
```

Expected response includes:

```json
{
  "Browser": "Chrome/...",
  "webSocketDebuggerUrl": "ws://..."
}
```
