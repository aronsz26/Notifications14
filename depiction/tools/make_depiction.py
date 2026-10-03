# Writes the Sileo native depiction into the repo (aronsz26.github.io). Run:
# python3 depiction/tools/make_depiction.py https://aronsz26.github.io/depictions/notifications14 ~/aronsz26.github.io/depictions/notifications14/depiction/sileo.json
# (and copy screenshots/ + depiction/banner.jpg, icon.png there)
import json, sys
base = sys.argv[1].rstrip('/')
out = sys.argv[2]
shot = lambda n, t: {"url": f"{base}/screenshots/{n}", "accessibilityText": t}
details = [
    {"class": "DepictionScreenshotsView", "itemCornerRadius": 14, "itemSize": "{160, 284}", "screenshots": [
        shot("ios14.jpg", "With Notifications14: iOS 14 notifications"), shot("ios15.jpg", "Without: iOS 15 notifications")]},
    {"class": "DepictionMarkdownView", "useSpacing": True, "markdown":
        "**iOS 14's notifications, back on iOS 15.** iOS 15 still has the old notification design; "
        "Notifications14 switches it back on. No system files are changed."},
    {"class": "DepictionHeaderView", "title": "What it changes"},
    {"class": "DepictionMarkdownView", "useSpacing": True, "markdown":
        "🔔 **Notifications** – iOS 14's look on the lock screen, in Notification Center and as banners\n\n"
        "🌙 **Do Not Disturb** – iOS 14's card instead of the Focus pill\n\n"
        "⚙️ **Settings** – turn it on or off in Settings → Notifications14"},
    {"class": "DepictionSeparatorView"},
    {"class": "DepictionTableTextView", "title": "Compatibility", "text": "iOS 15 · rootless & rootful"},
    {"class": "DepictionTableTextView", "title": "Developer", "text": "aronsz26"},
    {"class": "DepictionTableButtonView", "title": "Source code & issues", "action": "https://github.com/aronsz26/Notifications14", "openExternal": True},
    {"class": "DepictionTableButtonView", "title": "Report a problem", "action": "https://github.com/aronsz26/Notifications14/issues", "openExternal": True},
]
changelog = [
    {"class": "DepictionMarkdownView", "useSpacing": True, "markdown":
        "**1.0**\n- First release: iOS 14's notifications on iOS 15, with an on/off switch in Settings"},
]
dep = {"minVersion": "0.1", "class": "DepictionTabView", "headerImage": f"{base}/depiction/banner.jpg",
       "tintColor": "#FF3B30", "tabs": [
           {"tabname": "Details", "class": "DepictionStackView", "views": details},
           {"tabname": "Changelog", "class": "DepictionStackView", "views": changelog}]}
json.dump(dep, open(out, "w"), indent=2, ensure_ascii=False)
