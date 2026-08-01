# Narity Brand — read this first

**This design system ships no components.** narity.com is a hand-written static
site, so the brand exists as a stylesheet, not a React library. `_ds_bundle.js`
is deliberately empty and `window.NarityBrand` has no exports — ignore the
"Loading" and "Components" sections below; there is nothing to import.

What you get instead: narity's real production stylesheet, its tokens, Inter, and
the class vocabulary below. **Build with plain HTML/JSX elements and narity's
class names** — `<div className="card">`, not a `<Card>` component. Every class
listed here is defined in the shipped CSS and styles itself with no wrapper,
provider, or theme setup. Link `styles.css` and the design is on-brand.

## The idiom

Semantic classes, not utilities. There is no `p-4`, no `text-lg`, no colour
utility — the class names describe *what a thing is*, and all styling follows.
For layout glue of your own, write CSS using the tokens: `var(--bg)`,
`var(--panel)`, `var(--text)`, `var(--muted)`, `var(--accent)`, `var(--accent-2)`,
`var(--border)`, `var(--shadow)`. Those eight are the entire palette. **Dark
ground only — there is no light theme.**

## Class vocabulary

| Family | Classes |
|---|---|
| Layout | `.container` (1120px), `.narrow` (840px), `.row` + `.center`/`.between`, `.grid` + `.two`/`.three` |
| Header / nav | `.site-header`, `.brand`, `.brand-logo`, `.nav`, `.nav-link` + `.active`, `.nav-toggle` (+`.open` to expand) |
| Hero | `.hero`, `.hero-layout`, `.hero-content`, `.hero-visual`, `.lead`, `.lead-alt`, `.cta` |
| Actions | `.btn`, `.btn.primary` |
| Sections | `.section-title`, `.services`, `.about`, `.products`, `.contact` |
| Cards | `.card`, `.card-icon` |
| Stats | `.about-stats`, `.stat`, `.stat-number`, `.stat-label`, `.checklist` |
| Product rows | `.product-card`, `.product-info`, `.product-name`, `.product-tld`, `.product-desc`, `.product-tags`, `.product-arrow` |
| Forms | `.contact-wrapper`, `.contact-form` (styles bare `input`/`textarea`/`label` inside) |
| Footer | `.site-footer`, `.footer-link` |
| Long-form | `.legal`, `.legal-meta`, `.legal-list`, `.error-page` |

## Two gotchas that will bite

1. **`<section>` is globally styled to `min-height: 100vh`** with 72px vertical
   padding and vertical centring. Correct for a marketing page, wrong for app
   screens — add `style={{minHeight: 'auto'}}` on compact sections.
2. **Several classes style their children by descendant rule**, so structure is
   load-bearing: `.contact-form label > span + input`, `.product-tags > span`,
   `.checklist > li`, `.card > h3 + p`. Copy the nesting from
   `guidelines/patterns.md` rather than reshaping it.

## Where the truth is

- `styles.css` — the entry; `@import`s `tokens/fonts.css`, `tokens/tokens.css`,
  and `_ds_bundle.css` (narity's full production stylesheet, 15KB). Read
  `_ds_bundle.css` before styling anything bespoke.
- `guidelines/brand.md` — palette, the blue→mint gradient and its two sanctioned
  uses, the fluid `clamp()` type scale, radii, and the logo SVGs inline.
- `guidelines/patterns.md` — copyable markup for every page pattern.

## Idiomatic example

```jsx
<section className="services" style={{minHeight: 'auto'}}>
  <div className="container">
    <h2 className="section-title">What we do</h2>
    <div className="grid three">
      <div className="card">
        <div className="card-icon"><img src={icon} alt="" /></div>
        <h3>Cloud &amp; Infrastructure</h3>
        <p>Kubernetes, AWS, GCP — infrastructure that just works.</p>
      </div>
    </div>
    <div className="cta">
      <a className="btn primary" href="#contact">Work with us</a>
      <a className="btn" href="#services">What we do</a>
    </div>
  </div>
</section>
```
