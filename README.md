# mattspeck.com

Personal site for Matt Speck — AI engineer, Seattle. Served by GitHub Pages from
`mjspeck/mjspeck.github.io` at [www.mattspeck.com](https://www.mattspeck.com/).

## Structure

Static, no build step. Three files do the work:

```
index.html      all content and markup
css/site.css    all styles
img/headshot.jpg
```

Fonts (Newsreader, IBM Plex Mono) load from Google Fonts. Everything else is local.

## Running it

Open `index.html` directly, or serve the folder to get root-relative paths right:

```sh
python3 -m http.server 8000
```

## Editing

Content lives in `index.html` as plain semantic HTML — edit it in place. Two conventions
are worth knowing:

- **Experience entries** carry a `--yrs` custom property (`<article class="role" style="--yrs:5.75">`).
  It sets a minimum height so an entry's vertical space on the page tracks how long the role
  actually lasted. Update it when you add or extend a role.
- **`.rise`** marks an element for the scroll-reveal. It's a no-op under
  `prefers-reduced-motion`, and elements without it are simply always visible.

Design tokens (color, type, spacing rhythm) are the `:root` custom properties at the top of
`css/site.css`.

## Deploying

Push to `master`. GitHub Pages publishes from the branch root; `CNAME` holds the custom domain.

## License

[MIT](LICENSE)
