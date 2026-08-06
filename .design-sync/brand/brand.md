# Narity brand foundations

Narity is a software consulting company. The visual language is **dark, technical,
and calm**: a near-black ground, one raised panel surface, and a single blue→mint
gradient used sparingly as the only real colour event on the page.

## Palette

All colour comes from eight custom properties defined in `tokens/tokens.css`.
Use the token, never the literal hex — the hexes below are documentation only.

| Token | Value | Use it for |
|---|---|---|
| `--bg` | `#0b0d10` | The page ground. Every section sits on this. |
| `--panel` | `#12161b` | The one raised surface: cards, stats, product rows. |
| `--text` | `#e8eef5` | Headings and primary copy. |
| `--muted` | `#b7c2cf` | Secondary copy, labels, list items, nav at rest. |
| `--accent` | `#4fb3ff` | Blue. Links, focus rings, primary action, arrows. |
| `--accent-2` | `#7affc6` | Mint. Second gradient stop, checkmarks, link hover. |
| `--border` | `#232933` | Every 1px divider and card outline. |
| `--shadow` | `0 2px 8px rgba(0,0,0,.25)` | Resting elevation. |

There is **no light theme**. Don't synthesise one, and don't add colours outside
this set — no semantic success/warning/danger palette exists. If a state needs
signalling, use `--accent-2` for positive and `--muted` for inert.

## The brand gradient

One gradient carries the whole identity:

```css
linear-gradient(135deg, var(--accent), var(--accent-2))
```

It appears in exactly two forms, and both are load-bearing — don't invent a third:

1. **Gradient text** — big numerals and display headings, via
   `background-clip: text` with `-webkit-text-fill-color: transparent`.
   Used by `.hero h1`, `.stat-number`, `.product-name`, `.error-page h1`.
2. **Accent rules and hairlines** — the 3px bar under `.section-title`, the top
   edge that fades in on `.card:hover`, and the 1px masked border on `.stat`
   and `.product-card`.

Rule of thumb: at most one gradient-text element per screenful. It is an accent,
not a body treatment.

## Typography

**Inter** (300/400/600/700), loaded from the font host — the same link the live
site uses. Fallback stack: `system-ui, -apple-system, Segoe UI, Roboto, Arial,
sans-serif`. Body line-height is `1.6`.

Every display size is fluid, via `clamp()` — sizes track the viewport rather
than stepping at breakpoints:

| Role | Size |
|---|---|
| Hero `h1` | `clamp(28px, 6vw, 64px)`, line-height `1.1` |
| `.section-title` | `clamp(24px, 5vw, 42px)` |
| `.stat-number` | `clamp(40px, 8vw, 56px)`, weight 700 |
| `.product-name` | `clamp(28px, 4vw, 38px)`, weight 700 |
| Lead paragraph (`.lead`) | `clamp(16px, 3vw, 20px)`, `--muted` |
| Card body | `15px`, line-height `1.7` |

Keep new display text on `clamp()` rather than a fixed px size.

## Shape and elevation

Radii are consistent and worth matching exactly:

- `12px` — buttons and form inputs
- `16px` — cards, stats
- `20px` — product rows
- `100px` — tag pills

Elevation is quiet at rest (`var(--shadow)`) and lifts on hover:
`transform: translateY(-2px)` for buttons, `-4px` for cards and product rows,
with a deeper shadow. Transitions are `0.2s`–`0.4s ease`. Nothing bounces.

## Logos

Four lockups live in the site's `assets/`. Inlined here so they can be used
directly — all are dark-ground artwork.

**Wordmark** (`narity-logo-alt-wordmark.svg`) — the header lockup, 28px tall.
Gradient underline sits beneath the first letter only.

```svg
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 360 64" role="img" aria-label="Narity wordmark">
  <defs><linearGradient id="g" x1="0" y1="0" x2="1" y2="1"><stop offset="0%" stop-color="#4fb3ff"/><stop offset="100%" stop-color="#7affc6"/></linearGradient></defs>
  <g transform="translate(12,48)" fill="#e8eef5"><text x="0" y="0" font-family="Inter, system-ui, sans-serif" font-size="36" font-weight="700" letter-spacing="0.8">NARITY</text></g>
  <rect x="12" y="54" width="26" height="3" rx="1.5" fill="url(#g)"/>
</svg>
```

**Mark + wordmark** (`narity-logo-alt-mark.svg`) — for contexts needing a glyph.

```svg
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 300 64" role="img" aria-label="Narity logo">
  <defs><linearGradient id="grad" x1="0" y1="0" x2="1" y2="1"><stop offset="0%" stop-color="#4fb3ff"/><stop offset="100%" stop-color="#7affc6"/></linearGradient></defs>
  <g transform="translate(12,8)">
    <rect x="0" y="0" width="48" height="48" rx="12" fill="#0b0d10" stroke="#232933"/>
    <path d="M10 36 L10 14 L18 14 L30 30 L30 14 L38 14 L38 36 L30 36 L18 20 L18 36 Z" fill="url(#grad)"/>
  </g>
  <g transform="translate(72,32)" fill="#e8eef5"><text x="0" y="0" dominant-baseline="middle" font-family="Inter, system-ui, sans-serif" font-size="30" font-weight="700" letter-spacing="0.6">NARITY</text></g>
</svg>
```

**Monogram** (`favicon.svg`) — square 64×64, `#0b0d10` ground, `rx="12"`,
gradient N with a gradient underline. Use where only a glyph fits.

Also present: `narity-logo-alt-flow.svg` (flow motif) and `narity-logo-dark.svg`.
There is no light-ground variant — on a light surface, place the lockup on a
`--bg` panel rather than recolouring it.
