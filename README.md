# MyCareRoster.com

Marketing, documentation, support, and privacy site for the MyCareRoster app,
published with GitHub Pages at https://mycareroster.com (custom domain in `CNAME`).

Plain HTML and one CSS file. No build step, no frameworks, no external libraries,
fonts, scripts, analytics, or cookies. `.nojekyll` stops GitHub from running Jekyll.

## Pages

| URL | File | Notes |
|---|---|---|
| `/` | `index.html` | Home |
| `/guide/` | `guide/index.html` | User guide. Describes version 1.0 (build 22). |
| `/support/` | `support/index.html` | Contact and FAQ |
| `/privacy/` | `privacy/index.html` | Privacy policy for the app and this website |
| — | `404.html` | Served by GitHub Pages for missing pages |

Each page repeats the same header and footer; when you change one, change all five.
Styles live in `assets/css/site.css`, with colours from the app's `CarePalette`.

## Keep current

- **Privacy policy:** bump "Last updated" whenever it changes, and keep it in step
  with the app's `docs/AppReviewNotes.md` and App Privacy answers.
- **Guide:** add the 1.1 sections (appointments, Paste Reminder, Paste Provider Details)
  when 1.1 is released.
- **Support email:** `support@mycareroster.com` (needs Cloudflare Email Routing).
  The app's `CareWebLinks` still points to `cadance.music/mycareroster/*` and
  `info@cadance.music` until the app is updated.
- **App Store link:** `https://apps.apple.com/app/id6816753619`.
- **Download badge:** the home page uses a text button. Once the app is live, download
  Apple's black "Download on the App Store" badge from
  https://developer.apple.com/app-store/marketing/guidelines/ (accepting Apple's
  artwork licence), save it as `assets/img/app-store-badge.svg`, swap the buttons for
  `<a class="store-badge" ...><img src="/assets/img/app-store-badge.svg" alt="Download on the App Store" height="54"></a>`,
  and add "the Apple logo" to the footer trademark line.

## Images

- Screenshots in `assets/img/*.webp` come from `MCRv1.butterkit/Assets` in the app repo
  (sample family only), resized with `cwebp`.
- Icons: export a 1024 × 1024 PNG from Icon Composer to `assets/icon-1024.png`, then run
  `tools/make-icons.sh` and `tools/make-og-card.sh`.

## Previewing locally

```sh
python3 -m http.server 8000
```

Then open http://localhost:8000. Links are root-relative (`/guide/`), so open the site
through a server rather than as a file.
