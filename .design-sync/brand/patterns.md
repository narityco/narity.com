# Narity page patterns

Every pattern below is markup that already exists on narity.com and is styled by
the shipped `styles.css`. Copy the structure verbatim — the class names carry all
the styling, so a changed wrapper or a dropped nesting level loses the design.

## Page skeleton

```html
<header class="site-header">
  <div class="container row between center">
    <a class="brand" href="#home"><img class="brand-logo" src="…wordmark.svg" alt="Narity"></a>
    <button class="nav-toggle" aria-label="Menu" aria-expanded="false">
      <span></span><span></span><span></span>
    </button>
    <nav class="nav">
      <a class="nav-link active" href="#home">Home</a>
      <a class="nav-link" href="#services">Services</a>
    </nav>
  </div>
</header>

<main>…sections…</main>

<footer class="site-footer">
  <div class="container row between center">
    <small>&copy; 2026 Narity Limited. All rights reserved.</small>
    <small><a class="footer-link" href="/privacy.html">Privacy</a></small>
  </div>
</footer>
```

`.site-header` is sticky with a blurred translucent ground. `.nav-toggle` is
hidden above 768px and becomes the hamburger below it; `.nav` collapses into a
dropdown that needs the `open` class toggled on both elements to appear.

## Section rhythm

A page is a stack of `<section>`s, each wrapping its content in `.container`
(max 1120px). **`<section>` is styled globally: 72px vertical padding and
`min-height: 100vh`, centred vertically.** That full-viewport default is right
for a marketing page and wrong for most app screens — for compact sections,
override with `style="min-height:auto"`.

```html
<section id="services" class="services">
  <div class="container">
    <h2 class="section-title">What we do</h2>
    <div class="grid three">…</div>
  </div>
</section>
```

`.section-title` draws a 60px gradient rule beneath itself and is
`display:inline-block`, so it hugs its text. Inside `.contact` it is re-centred.

## Hero

```html
<section id="home" class="hero">
  <div class="container hero-layout">
    <div class="hero-content">
      <h1>Software that works, so you can focus on your business</h1>
      <p class="lead">One or two sentences of positioning.</p>
      <div class="cta">
        <a class="btn primary" href="#contact">Work with us</a>
        <a class="btn" href="#services">What we do</a>
      </div>
    </div>
    <div class="hero-visual"><img src="…illustration.svg" alt=""></div>
  </div>
</section>
```

Two equal columns that stack under 860px. `.hero-visual` is hidden entirely
under 768px, so the hero must read without it. `.cta` buttons go full-width on
mobile.

## Cards

```html
<div class="grid three">
  <div class="card">
    <div class="card-icon"><img src="…icon.svg" alt=""></div>
    <h3>Architecture &amp; Design</h3>
    <p>One or two sentences. Keep card copy short.</p>
  </div>
</div>
```

`.grid.two` and `.grid.three` both collapse to one column under 860px. Card
icons are 40px and rendered through an `invert`/`hue-rotate` filter, so supply
**monochrome** artwork — a full-colour icon will come out wrong.

## Stats

```html
<div class="about-stats">
  <div class="stat">
    <span class="stat-number">20+</span>
    <span class="stat-label">Years experience</span>
  </div>
</div>
```

`.stat-number` is gradient text. Keep the value short — two or three glyphs plus
a `+` or `%`.

## Checklist

```html
<ul class="checklist">
  <li>Engineering-first mindset</li>
</ul>
```

Renders a mint `✓` via `::before`; supply no bullet or icon of your own.

## Product / link row

A whole-row anchor, one per row, for linking out to a product or case study.

```html
<a href="https://ataca.io/" target="_blank" rel="noopener" class="product-card">
  <div class="product-info">
    <h3 class="product-name">ataca<span class="product-tld">.io</span></h3>
    <p class="product-desc">One sentence on what it is.</p>
    <div class="product-tags"><span>Messaging</span><span>Email Delivery</span></div>
  </div>
  <div class="product-arrow">&rarr;</div>
</a>
```

`.product-tags span` needs no class — the pill styling is a descendant rule.
`.product-tld` continues `.product-name` in pure gradient, for the domain suffix.
The row stacks vertically under 768px.

## Form

```html
<div class="contact-wrapper">
  <form class="contact-form" method="post" action="…">
    <label><span>Your name</span><input type="text" name="name" required></label>
    <label><span>Message</span><textarea name="message" rows="5" required></textarea></label>
    <button class="btn primary" type="submit">Send</button>
  </form>
</div>
```

The `<label>`-wraps-`<span>`-plus-control structure is what produces the stacked
label/field layout — a separate `for=`/`id=` pairing renders unstyled. Inputs
are 500px max via `.contact-wrapper`, and focus draws an `--accent` ring.

## Long-form and error pages

`.legal` is the reading layout: 820px measure, `.legal-meta` for the "last
updated" line, `.legal-list` for bulleted lists, `.legal h2` for subheadings.
`.error-page` centres a giant gradient numeral over a `.lead` and a `.btn`.

## Buttons

`.btn` is the secondary/default: panel fill, 1px border, 12px radius, 44px min
height. `.btn.primary` adds the blue gradient fill with dark `#081018` text —
one primary per view. Both lift 2px on hover. There is no size or ghost variant;
don't invent one.
