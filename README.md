# MyCareRoster.com

Marketing, documentation, support, and privacy site for the MyCareRoster app,
published with GitHub Pages at https://mycareroster.com (custom domain in `CNAME`).

Plain HTML and one CSS file. No build step, no frameworks, no external libraries,
fonts, scripts, analytics, or cookies. `.nojekyll` stops GitHub from running Jekyll.

## Pages

| URL | File | Notes |
|---|---|---|
| `/` | `index.html` | Home |
| `/guide/` | `guide/index.html` | User guide. Describes version 1.2 (build 24). |
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
  The app's `CareWebLinks` (1.2) still points to `cadance.music/mycareroster/*`, which
  redirect here, and `info@cadance.music`, until the app is updated.
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

- Screenshots in `assets/img/*.webp` are the 1.2 raw captures in the app repo's
  `AppStoreScreenshots/1.2-captures/` (sample family only), resized with
  `cwebp -q 80 -m 6 -resize`: iPhone 6.3 to 400 × 870 and 800 × 1740, iPad 13 to
  900 × 675 and 1600 × 1200.
- Icons: export a 1024 × 1024 PNG from Icon Composer to `assets/icon-1024.png`, then run
  `tools/make-icons.sh` and `tools/make-og-card.sh`.

## Previewing locally

```sh
python3 -m http.server 8000
```

Then open http://localhost:8000. Links are root-relative (`/guide/`), so open the site
through a server rather than as a file.
