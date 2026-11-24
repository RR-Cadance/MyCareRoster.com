# MyCareRoster.com

Marketing, documentation, support, and privacy site for the MyCareRoster app,
published with GitHub Pages at https://mycareroster.com (custom domain in `CNAME`).

Plain HTML and one CSS file. No build step, no frameworks, no external libraries,
fonts, scripts, analytics, or cookies. `.nojekyll` stops GitHub from running Jekyll.

## Pages

| URL | File | Notes |
|---|---|---|
| `/` | `index.html` | Home |
| `/guide/` | `guide/index.html` | User guide. Describes version 1.6 (build 44). |
| `/support/` | `support/index.html` | Contact and FAQ |
| `/privacy/` | `privacy/index.html` | Privacy policy for the app and this website |
| — | `404.html` | Served by GitHub Pages for missing pages |

Each page repeats the same header and footer; when you change one, change all five.
Styles live in `assets/css/site.css`, with colours from the app's `CarePalette`.

## Keep current

- **Privacy policy:** bump "Last updated" whenever it changes, and keep it in step
  with the app's `docs/AppReviewNotes.md` and App Privacy answers.
- **Guide and support:** update for each app release, checking UI labels against the app's
  source. Don't name calendar services (Google, Exchange, and so on) or claim every calendar
  works until that's tested.
- **Support email:** `support@mycareroster.com` (needs Cloudflare Email Routing).
  From 1.3 the app's `CareWebLinks` opens `https://mycareroster.com/privacy/` and
  `/support/` directly. Versions 1.0 to 1.2.1 still open `cadance.music/mycareroster/*`,
  which redirect here, so keep those redirects. The app's Send Feedback still emails
  `info@cadance.music` (`CareWebLinks.supportEmail`) until the app is updated.
- **App Store link:** `https://apps.apple.com/app/id6816753619`.
- **Smart App Banner:** every page's `<head>` has
  `<meta name="apple-itunes-app" content="app-id=6816753619">`, which shows Apple's
  install (or Open) banner in Safari on iPhone and iPad. Keep it on new pages.
- **Download badge:** the home page uses a text button. Once the app is live, download
  Apple's black "Download on the App Store" badge from
  https://developer.apple.com/app-store/marketing/guidelines/ (accepting Apple's
  artwork licence), save it as `assets/img/app-store-badge.svg`, swap the buttons for
  `<a class="store-badge" ...><img src="/assets/img/app-store-badge.svg" alt="Download on the App Store" height="54"></a>`,
  and add "the Apple logo" to the footer trademark line.

## Images

- Screenshots in `assets/img/*.webp` show the sample family in Teal, Dark (the default).
  iPhone images are 1.6 (build 44) captures from an iPhone 18 Pro simulator, made with the
  app repo's `scripts/capture-screenshots.sh` (`--theme teal --appearance dark`); iPad images
  are the 1.4 raw captures in `AppStoreScreenshots/1.4-captures/iPad-13/`, which still match
  1.6 for the screens used. Resized with `cwebp -q 80 -m 6 -resize`: iPhone 6.3 to
  400 × 870 and 800 × 1740, iPad 13 to 900 × 675 and 1600 × 1200.
- | Image | Capture |
  |---|---|
  | `iphone-roster` | `-screen home` |
  | `iphone-family-kate`, `iphone-family-isla` | `-screen family`, `--member kate` / `isla` |
  | `iphone-team-thyroid` | `-screen team --member kate --team Thyroid` |
  | `iphone-gp-whitfield` | `-screen provider --member kate` |
  | `iphone-profile-locked`, `iphone-profile-conditions` | `-screen locked` / `conditions`, `--member june` |
  | `iphone-member-appointments` | `-screen memberappointments --member kate` |
  | `iphone-summary` | `-screen summaryhealth --member kate` |
  | `iphone-theme`, `iphone-icon` | `-screen theme` / `icon`, `--member june` |
  | `ipad-team-thyroid`, `ipad-appointments`, `ipad-provider-lee` | 1.4 iPad `03-team`, `07-appointments`, `09-provider` |
- `assets/img/og-card.png` embeds `iphone-roster-800.webp`; rerun `tools/make-og-card.sh`
  when that image changes.
- Icons: export a 1024 × 1024 PNG from Icon Composer to `assets/icon-1024.png`, then run
  `tools/make-icons.sh` and `tools/make-og-card.sh`.

## Previewing locally

```sh
python3 -m http.server 8000
```

Then open http://localhost:8000. Links are root-relative (`/guide/`), so open the site
through a server rather than as a file.
