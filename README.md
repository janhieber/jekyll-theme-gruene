# gruene-theme

> [!CAUTION]
> Dieses Theme ist nur ein mit KI erstelltes Konzept. Es ist weder richtig getestet noch fertig für den Produktiveinsatz. Benutzung auf eigene Gefahr!

Ein schlichtes Jekyll-Theme für Orts- und Kreisverbände – mit News und Terminen auf der Startseite.

> **Inoffiziell.** Dieses Theme ist kein offizielles Angebot von Bündnis 90/Die Grünen.
> Logo, Schriften (GrueneType, GrueneSans) und Bilder sind **nicht** enthalten und
> müssen von jedem Verband selbst eingebunden werden (Lizenz beim Landes-/Bundesverband erfragen).

## Mitmachen
Du kannst gerne Änderungen via Pull Request einreichen!

## Einbinden (als Git-Submodule)

```sh
git submodule add https://github.com/janhieber/jekyll-theme-gruene _theme
```

`Gemfile`:

```ruby
source "https://rubygems.org"
gem "jekyll", "~> 4.3"
gem "jekyll-theme-gruene", path: "_theme"
```

`_config.yml`:

```yaml
theme: jekyll-theme-gruene
title: Ortsverband Musterstadt
subtitle: Bündnis 90/Die Grünen
description: "Website des Ortsverbands Musterstadt"

logo: /assets/img/logo.svg        # optional
favicon: /favicon.ico             # optional
hero_image: /assets/img/hero.jpg  # optional, sonst grüner Verlauf

email: info@example.org
instagram: ""
facebook: ""
mastodon: ""

exclude: [_theme, Gemfile, Gemfile.lock, vendor, README.md]

# Pflicht – wird von Jekyll nicht aus dem Theme übernommen:
permalink: /news/:year/:month/:title/
future: true   # sonst werden Termine mit Datum in der Zukunft nicht erzeugt

collections:
  termine:
    output: true
    permalink: /termine/:title/

defaults:
  - scope: { path: "", type: posts }
    values: { layout: post }
  - scope: { path: "", type: termine }
    values: { layout: termin }
  - scope: { path: "" }
    values: { layout: page }
```

Dann:

```sh
bundle install
bundle exec jekyll serve
```

Klonen eines bestehenden Projekts: `git clone --recursive …` (oder danach `git submodule update --init`).
Theme aktualisieren: `git submodule update --remote _theme` und committen.

## Inhalte

### Startseite – `index.html`

```yaml
---
layout: home
hero_line1: Herzlich
hero_line2: willkommen!
hero_text: Wir setzen uns für ein grünes Musterstadt ein.
hero_button: { title: Mitmachen, url: /mitmachen/ }
---
```

### News – `_posts/2026-11-20-titel.md`

```yaml
---
title: Unsere Anträge zum Haushalt
category: Gemeinderat
image: /assets/img/haushalt.jpg   # optional
---
Text …
```

### Termine – `_termine/2026-12-05-infostand.md`

```yaml
---
title: Infostand auf dem Wochenmarkt
datum: "2026-12-05 09:00"
ende: "12:00"          # optional
ort: Marktplatz        # optional
---
Beschreibung …
```

### Übersichtsseiten

`news/index.html` mit `layout: news` und `termine/index.html` mit `layout: termine`
(jeweils mit `title:`).

### Navigation – `_data/navigation.yml`

```yaml
main:
  - { title: News, url: /news/ }
  - { title: Termine, url: /termine/ }
secondary:            # optional, grüne Leiste unter dem Header
  - { title: Ortsverband, url: /ortsverband/ }
footer:
  - { title: Impressum, url: /impressum/ }
  - { title: Datenschutz, url: /datenschutz/ }
```

## Anpassen

- **Schriften / eigenes CSS:** eigene Datei `_includes/head-custom.html` anlegen, z. B.

  ```html
  <style>
    @font-face { font-family: gruenetype; src: url("/assets/fonts/gruenetype.woff2") format("woff2"); }
    @font-face { font-family: gruenesans; src: url("/assets/fonts/gruenesans.woff2") format("woff2"); }
  </style>
  ```

- **Farben:** CSS-Variablen (`--tanne`, `--klee`, `--grashalm`, …) in `head-custom.html` überschreiben.
- **Beliebige Datei überschreiben:** gleichnamige Datei in der Website anlegen, z. B. `_includes/footer.html`.

## Hinweis zu Terminen

„Kommende Termine“ und „vor X Tagen“ werden beim Bauen der Seite berechnet.
Die Seite sollte daher regelmäßig (z. B. täglich per GitHub Action / Cronjob) neu gebaut werden.

## Lizenz

Code: MIT. Gilt nicht für Logos, Schriften oder Bilder der Partei.

## Credits
Dieses Theme wurde inspiriert von https://gruene-filderstadt.de.  
Erstellt mit Hilfe von Claude Opus 5.5.
