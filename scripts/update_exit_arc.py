#!/usr/bin/env python3
"""Point Casks/exit-arc.rb at the latest exit-arc release, if it isn't already. Stdlib only."""
import hashlib
import json
import os
import re
import sys
import urllib.request
from pathlib import Path

CASK = Path(__file__).resolve().parent.parent / "Casks" / "exit-arc.rb"
API = "https://api.github.com/repos/meelijane/exit-arc/releases/latest"


def get(url):
    req = urllib.request.Request(url, headers={"User-Agent": "homebrew-tap-updater"})
    token = os.environ.get("GITHUB_TOKEN")
    if token and url.startswith("https://api.github.com/"):
        req.add_header("Authorization", f"Bearer {token}")
    with urllib.request.urlopen(req, timeout=60) as r:
        return r.read()


release = json.loads(get(API))
version = release["tag_name"].lstrip("v")
asset = next((a for a in release.get("assets", []) if a["name"] == "exit-arc.pyz"), None)
if not asset:
    sys.exit(f"Release {release['tag_name']} has no exit-arc.pyz yet.")

text = CASK.read_text()
current = re.search(r'version "([^"]+)"', text).group(1)
if current == version:
    print(f"exit-arc cask is already at {version}.")
    sys.exit(0)

sha = hashlib.sha256(get(asset["browser_download_url"])).hexdigest()
text = re.sub(r'version "[^"]+"', f'version "{version}"', text, count=1)
text = re.sub(r'sha256 "[0-9a-f]+"', f'sha256 "{sha}"', text, count=1)
CASK.write_text(text)
print(f"exit-arc cask: {current} -> {version} ({sha})")
