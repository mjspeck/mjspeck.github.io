# AGENTS.md

Guidance for coding agents working in this repository.

## Commit messages

All commits must follow [Conventional Commits](https://www.conventionalcommits.org/):

```
<type>[optional scope]: <description>

[optional body]

[optional footer]
```

The description is lowercase, imperative mood, and has no trailing period.
Keep the subject line under 72 characters. Wrap the body at 72 columns.

Types used here:

| Type | Use for |
|---|---|
| `feat` | New or changed page content, sections, or visual design |
| `fix` | Broken layout, links, accessibility defects, rendering bugs |
| `docs` | README, this file, code comments |
| `style` | Formatting that does not change rendered output |
| `refactor` | Restructuring markup or CSS with no visible change |
| `chore` | Dependencies, tooling, `.gitignore`, repo housekeeping |

Breaking changes take a `!` after the type (`feat!:`) or a `BREAKING CHANGE:`
footer.

Examples:

```
feat: add speaking engagements section
fix: prevent horizontal overflow on narrow viewports
chore: ignore editor swap files
```

## Repository

This is the personal site for Matt Speck, served by GitHub Pages from the
`main` branch root at [www.mattspeck.com](https://www.mattspeck.com/).
`CNAME` holds the custom domain.

Static, no build step. Three files carry the site:

```
index.html      all content and markup
css/site.css    all styles
img/headshot.jpg
```

Fonts (Newsreader, IBM Plex Mono) load from Google Fonts. Everything else is
local. Do not introduce a build pipeline, framework, or package manager
without being asked — the absence of one is deliberate.

## Conventions

- **`--yrs`** on `.role` entries (`<article class="role" style="--yrs:5.75">`)
  sets a minimum height so an entry's vertical space tracks how long the role
  actually lasted. Update it when adding or extending a role.
- **`.rise`** marks an element for the scroll-reveal. It is a no-op under
  `prefers-reduced-motion`; elements without it are always visible.
- Design tokens (color, type, spacing rhythm) are the `:root` custom
  properties at the top of `css/site.css`. Derive new values from them rather
  than hardcoding.

## Before committing

- Check the page at both a wide viewport and ~390px. The body must never
  scroll horizontally — verify `scrollWidth === clientWidth`.
- Keyboard focus must stay visible, and motion must respect
  `prefers-reduced-motion`.

To preview, serve the folder rather than opening the file directly:

```sh
python3 -m http.server 8000
```

## Pushing

This account has GitHub email privacy enabled. Commits authored with the
personal gmail address are **rejected on push**. Use:

```
Matt Speck <20689127+mjspeck@users.noreply.github.com>
```

Do not force-push shared history. Open a pull request against `main`.
