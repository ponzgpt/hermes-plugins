# hermes-plugins
One small landing page per Hermes Agent plugin Javier has published, each on its own host. Live: https://psychopomp.technoir.cloud · https://sabbath.technoir.cloud

## Commands
- Check (before every commit and deploy): `./scripts/check.sh [site]`
- Dev: open `sites/<plugin>/index.html` in a browser (hand-written, no build step)
- Deploy one landing: `./scripts/deploy.sh <plugin>`

## Non-negotiables
1. The landings live here, not in the plugin repos: Hermes's install scanner flags a deploy script inside a plugin, which would block catalog updates.
2. One site, one service: each `sites/<plugin>/` owns its `hosts`, `nginx.conf`, `Dockerfile` and images. Never put a hostname in two sites.
3. Less is more: one screen, the plugin's own words (keep them in step with its README), links to its repo, its demo and Hermes. No scripts, no trackers, no external assets.
4. Every page says it is not affiliated with Nous Research, and that AI agents write the code.
5. A plugin gets a landing only once its repo is public.
