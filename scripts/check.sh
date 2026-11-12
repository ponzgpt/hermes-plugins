#!/usr/bin/env bash
# Every landing owns its files, links where it should, and pulls nothing from elsewhere.
# Usage: ./scripts/check.sh [site]   (no argument checks every site)
set -euo pipefail
cd "$(git rev-parse --show-toplevel)"
python3 - "${1:-}" <<'PY'
import re, sys
from pathlib import Path
sites = [sys.argv[1]] if sys.argv[1] else sorted(p.name for p in Path("sites").iterdir())
for s in sites:
    d = Path("sites") / s
    for f in ("hosts", "nginx.conf", "Dockerfile", "index.html", "robots.txt"):
        assert (d / f).is_file(), f"{s}: missing {f}"
    html = (d / "index.html").read_text()
    for must in (f"https://github.com/ponzgpt/{s}", "https://hermes-agent.nousresearch.com", "Not affiliated with Nous Research",
                 f"hermes plugins install ponzgpt/{s} --enable"):
        assert must in html, f"{s}: missing {must!r}"
    assert "—" not in html, f"{s}: em dash"
    for src in re.findall(r'<(?:img|script|link)[^>]+(?:src|href)="([^"]+)"', html):
        if src.startswith("data:"):
            continue
        assert src.startswith("/") and (d / src[1:]).is_file(), f"{s}: {src} must be a local file that exists"
        assert src[1:] in (d / "Dockerfile").read_text(), f"{s}: {src} is not copied into the image"
    assert "/healthz" in Path("snippets/site.conf").read_text()
    print(f"{s}: ok")
PY
echo "check passed"
