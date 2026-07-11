---
name: create-recipe
description: >-
  Create a new Jekyll recipe post from a URL, following existing menjabe
  conventions. Use when the user provides a recipe URL, asks to add a recipe
  from a link, or wants to import a recipe into _posts/.
---

# Create Recipe

Create a new recipe post in `_posts/` from a URL, matching the style of existing recipes.

## Input

| Parameter | Required | Notes |
|-----------|----------|-------|
| `url` | Yes | Recipe page to import |
| `category` | No | Ask the user if not provided or inferable from content |
| `title` | No | Override the title; otherwise derive from the source |

## Workflow

Copy this checklist and track progress:

```
Task Progress:
- [ ] Step 1: Fetch the URL
- [ ] Step 2: Read existing recipes for style reference
- [ ] Step 3: Extract and translate content to Catalan
- [ ] Step 4: Write the new post file
- [ ] Step 5: Verify format
```

### Step 1: Fetch the URL

Use `WebFetch` to retrieve the page content. If the page is paywalled or returns little text, tell the user and ask for the recipe text directly.

### Step 2: Read existing recipes

Read 1–2 files in `_posts/` to match tone, structure, and formatting. Current examples:

- `_posts/2025-12-25-cochinita-pibil.markdown` — multi-group ingredients and prep
- `_posts/2026-02-15-bizcocho-de-iogurt-mini.markdown` — simpler single-group recipe

### Step 3: Extract and adapt content

From the source page, extract title, ingredients, and steps. Then:

1. **Translate to Catalan** — all body text must be in Catalan, matching the site's locale.
2. **Group ingredients** — use `### Per <group>` subsections when the recipe has distinct components (e.g. sauce, marinade, dough). Use a single group like `### Per a la recepta` for simple recipes.
3. **Group preparation steps** — use `### <phase>` subsections when there are distinct phases (e.g. marinade, cooking, assembly).
4. **Adapt, don't copy verbatim** — rephrase steps in the site's voice; add practical notes (air fryer alternatives, substitutions) when relevant.
5. **Assign a category** — use an existing category from `_posts/` when it fits (`mexicana`, `airfryer`, etc.), or propose a new slug and confirm with the user.

### Step 4: Write the post file

**Filename:** `_posts/YYYY-MM-DD-slug.markdown`

- Date: today's date
- Slug: lowercase, hyphens, no accents (e.g. `pa-de-pessic-de-iogurt`)

**Front matter:**

```yaml
---
layout: single
title:  "Recipe Title"
date:   YYYY-MM-DD HH:MM:SS +0100
categories: category-slug
---
```

**Body template:**

```markdown
## Ingredients
### Per <group name>
  - ingredient 1
  - ingredient 2

## Preparació
### <phase name>
1. First step.
2. Second step.
```

**Formatting rules:**

- Ingredient bullets: two leading spaces before `-` (e.g. `  - 100g de farina`)
- Quote items with special characters: `  - "Tortilles" (de les petites millor)`
- Units inline: `1kg`, `100g`, `150ml`, `160º`, `140 ºC`
- Numbered steps in Preparació sections
- Blank line between ingredient groups and between prep phases

### Step 5: Verify

Before finishing, confirm:

- [ ] File is in `_posts/` with correct `YYYY-MM-DD-slug.markdown` name
- [ ] Front matter has `layout`, `title`, `date`, `categories`
- [ ] Body has `## Ingredients` and `## Preparació` sections
- [ ] All text is in Catalan
- [ ] Formatting matches existing posts (indentation, headings, lists)

Optionally preview with `make serve` or `make draft`.

## Additional resources

- For detailed examples and category reference, see [reference.md](reference.md)
