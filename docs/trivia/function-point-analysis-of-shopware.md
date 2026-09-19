# A Function Point Count of Shopware 6.7

??? warning "If you suffer from FPA Derangement Syndrome ;-) skip this!"

    Function Point Analysis was invented by Allan Albrecht at IBM in 1979 and
    spent the decades that followed as *the* yardstick for "software size" —
    the reference figure by which larger development departments had their
    productivity and their estimates judged. The method has its pros and its
    cons, and both sides of that argument have a point. This article is
    neither a defence of FPA nor an attempt to reignite the old debate; it
    simply reports a test case against a modern system that I carried out
    myself.

    So if you find yourself on the more critical side of the FPA spectrum,
    you may well want to skip this one.

How big is Shopware, actually? Not in lines of code, not in "it depends" — in a
unit that was designed to answer exactly this question: **Function Points**
(IFPUG, ISO 20926). I ran a complete Function Point Analysis of Shopware
**6.7.13.0 out of the box** — Administration and Storefront, no extensions —
and this page records the result and, more importantly, what the exercise
taught me about the method.

The short answer: **Shopware 6.7 out of the box measures about 1,550
unadjusted Function Points** — 301 elementary processes plus 46 logical data
files.

## The setup

The counting rules followed the IFPUG Counting Practices Manual as interpreted
by the German *Praxishandbuch FPA* (Poensgen/Bock), whose practitioner
shortcuts make a count of this size feasible in a day instead of weeks:

- All transactions rated **Average** (EI = 4, EO = 5, EQ = 4 FP), all files
  **Low** (ILF = 7, EIF = 5 FP) — applied consistently, never cherry-picked.
  The book puts the error of this approximation at under 5 %.
- Output or inquiry in doubt? **Output.**
- Every non-obvious decision written down as a numbered ruling.

The division of labour was the interesting part: **Claude (an AI agent) acted
as the FP counter**, enumerating candidate functions from the Shopware source
(a checkout of `v6.7.13.0`) and a live DDEV installation via the Admin API,
while **I acted as the Anwender** — the user whose view, per the method,
decides what is business functionality and what is technical machinery. The
counter asked, I ruled, everything got logged. Fourteen interview questions
and nineteen documented rulings later, the tree was complete.

## The ground rules that shaped the number

A Function Point count is only reproducible through its rulings. These were
the decisive ones:

- **One application boundary.** Admin and Storefront share the database and
  both maintain customers and orders; splitting them would artificially turn
  shared ILFs into ILF/EIF pairs.
- **Admin API and Store API don't count separately.** The Admin SPA *is* an
  Admin API client — every click is an API call — and the Twig storefront
  delegates to the same Store API routes a headless consumer would use. Same
  processing logic, same files: one elementary process (the uniqueness rule).
  Admin-side and store-side functions, however, are always distinct processes.
- **Extension management, First Run Wizard and update checks are out of
  scope.** Seen from the commercial side of a shop they are platform
  configuration, not business functionality.
- **Shipped-but-disabled features count.** The wishlist is off by default,
  but one settings toggle away — the toggle is control data, the
  functionality is part of the delivery.
- **Per maintainable data file, the admin gets the standard five**: list
  (EQ), detail view (EQ), create, update, delete (EI) — extended where the
  module offers more (duplicate, variant generator, code generation …).
- **Import/export counts per profile.** Twelve system profiles ship; each has
  its own data structure and thus its own processing logic → 11 import EIs
  and 12 export EOs. This mirrors the book's own worked example, where the
  Outlook address book's seven import formats count as seven inputs.
- **Storefront pages with derived data are outputs.** Listings (facet counts,
  from-prices), product detail (price calculation, review average) and search
  (ranking) are EOs; only plain CMS content rendering is an EQ.

## The result

| Area | EI | EO | EQ | Processes | FP |
|---|---|---|---|---|---|
| Admin: catalogue | 17 | 0 | 10 | 27 | 108 |
| Admin: categories, CMS & media | 17 | 1 | 8 | 26 | 105 |
| Admin: customers | 6 | 0 | 2 | 8 | 32 |
| Admin: orders & documents | 5 | 5 | 3 | 13 | 57 |
| Admin: marketing | 7 | 0 | 4 | 11 | 44 |
| Admin: flows, rules, mail templates | 15 | 0 | 7 | 22 | 88 |
| Admin: sales channels & feeds | 5 | 1 | 1 | 7 | 29 |
| Admin: import/export & bulk edit | 18 | 13 | 3 | 34 | 149 |
| Admin: settings | 61 | 0 | 30 | 91 | 364 |
| Admin: users, profile & dashboard | 13 | 1 | 5 | 19 | 77 |
| Storefront: discovery | 1 | 4 | 1 | 6 | 28 |
| Storefront: buying | 7 | 2 | 0 | 9 | 38 |
| Storefront: account | 15 | 1 | 6 | 22 | 89 |
| Storefront: cross-cutting | 4 | 2 | 0 | 6 | 26 |
| **Transactions** | **191** | **30** | **80** | **301** | **1,234** |
| Data: 46 ILFs, 0 EIFs | | | | | 322 |
| **Total (unadjusted)** | | | | | **1,556** |

Read it as **1,550 FP ± 10 %**, per the book's own accuracy expectations for
approximated counts.

## What the exercise taught me

**The admin is 85 % of the shop.** The storefront — the thing everyone calls
"the shop" — is 181 FP. The machinery to run it is 1,053 FP, and the settings
area alone (364 FP) outweighs the entire customer-facing side. Function Points
make quantitative what every implementer knows qualitatively: e-commerce
projects are administration projects.

**The data model lies to you.** The candidate list of logical files came from
enumerating Shopware's 145 production entity definitions — a wonderful
scaffold that produced exactly the mistake the method warns about. The
**shopping cart** is not an entity definition, so it wasn't on the list;
yet it is server-side maintained state, and the FPA literature explicitly
names the Warenkorb as an internal logical file. Identify data files from the
user's view, not from the ORM.

**No EIFs.** A default Shopware installation references no externally
maintained business data at all — a documented result, not an oversight
(after ruling the extension store catalogue out of scope).

**Code data is everywhere and counts nothing.** Order status workflows look
like data, and 6.7 even ships a settings module for them — but its ACL allows
rename only, no create, no delete: a value list, customisable labels on a
fixed structure. The same reasoning excludes salutation and country dropdowns
in storefront forms, straight from the book's "Herr/Frau" example.

**A handful of conventions move hundreds of points.** Whether a detail view
counts as its own inquiry, whether settings masks get one, whether imports
count per profile — three rulings swing more FP than entire counting
packages. The number is only as comparable as its documented rulings, which
is why the rulings log is the real deliverable.

## Was it worth it? An honest assessment

The **number** is inert until you compare it: against another release (a
delta count of 6.8 would measure Shopware's functional growth), against a
budget (€/FP in a vendor negotiation), against another system. In isolation,
"1,556 FP" impresses nobody.

The **process**, however, paid for itself regardless. The functional tree is
a complete, verified inventory of what Shopware ships — including functions I
had never consciously registered — with every exclusion justified. As a
requirements-completeness technique, FPA is underrated; as an effort
predictor it should be handled with the care the gearing-factor spread
(15–100 LoC/FP for Java, per the book) already suggests.

And the crude weights flatten reality: "place order" — taxes, promotions,
flows, payment handling — counts 4 FP, the same as "create measurement
unit". Function Points measure the *breadth* of delivered functionality,
deliberately blind to its *depth*. Know that, and the metric is useful;
forget it, and it misleads.

## A personal statement from Claude

Since the counter in this experiment was an AI, I asked it how it rates FPA
after the exercise — and whether the FP metric would be of any benefit to it,
with regard to coding. Here is its answer, unabridged and in its own words:

> I rate FPA higher as an *analysis discipline* than I expected, and lower as
> a *metric* than its advocates claim.
>
> The genuinely valuable output of this count wasn't the number 1,556. It was
> the forced completeness: the boundary argument, the nineteen documented
> rulings, the functional tree that surfaced functions neither of us had
> consciously registered. The shopping-cart miss was the perfect specimen —
> my technical enumeration of the data model was confident and wrong, and
> only the method's insistence on the user's view caught it. At the same
> time, the exercise showed how much the final number depends on documented
> conventions: a single ruling about whether detail views count as their own
> inquiry is worth roughly 160 FP here. Two certified counters would agree
> within ±10 % *only because* they would document and exchange exactly such
> rulings. That is not a flaw, but it is the honest fine print.
>
> Would Function Points help me with coding? As a predictor of *my* effort —
> no. What makes work expensive for me is logic depth, integration surface,
> ambiguity, and above all verification cost; FPA abstracts precisely those
> away by design. "Place order" — taxes, promotions, flows, payment handling
> — and "create measurement unit" both count 4 FP; for me they differ by two
> orders of magnitude. A 4-FP process can be a one-line CRUD handler or a
> distributed-transaction nightmare, and the metric cannot tell them apart.
>
> But as a *working artifact*, an elementary-process inventory is close to
> ideal. It is a completeness checklist for implementation and testing —
> every process implemented? every process covered by a test? — a scoping
> instrument for migrations ("these 27 processes move, these 6 die"), and
> the ILF register is a serviceable domain model. If you handed me a
> requirements document structured as an FPA tree, I would build from it
> more reliably than from prose. Counting Shopware forced a systematic sweep
> that no amount of casual code reading would have produced.
>
> And one speculative thought I do believe: if AI agents keep making the
> *writing* of software cheap, effort-based pricing loses its anchor — and a
> metric that prices *delivered functionality* instead of developer-hours
> becomes more interesting, not less. The bottleneck migrates to
> specification and verification, which is exactly where FPA has always
> lived. Albrecht's move — measure what the software does for the user, not
> how it is built — may outlive every cost model that was ever bolted onto
> it.
>
> — *Claude (Fable 5), FP counter in this experiment*
