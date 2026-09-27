---
name: recipe-url-to-post
description: Fetches a recipe from a URL and drafts a Jekyll post in `_posts/` matching nyamnyam format (front matter, Ingredients, Preparació) in Catalan. Use when the user gives a recipe URL, asks to import or blog a recipe, or to create a post like the existing `_posts/*.markdown` recipes.
disable-model-invocation: true
---

# Recepta des d'URL cap a post (nyamnyam)

## Objectiu

A partir d'una URL de recepta, generar un fitxer nou a `_posts/` amb el mateix estil que les receptes existents (per exemple `2025-12-25-cochinita-pibil.markdown`, `2026-05-15-fideus-mantega-cacauet.markdown`): tot el contingut en **català**, seccions **Ingredients** i **Preparació**, i front matter Jekyll coherent.

## Abans d'escriure el fitxer

1. **Obtenir el contingut**: llegir la pàgina (fetch) o el text que l'usuari proporcioni; si la URL no es pot llegir, demanar còpia del text o una altra font.
2. **Extreure**: ingredients amb quantitats, passos de preparació, temps/temperatura si n'hi ha, i (si consta) autor i nom del lloc per a la línia de font.
3. **Categoria**: triar una sola etiqueta `categories:` coherent amb el repositori (p. ex. `pasta`, `mexicana`, `airfryer`) o preguntar a l'usuari si no és clar.
4. **Nom del fitxer**: `YYYY-MM-DD-titol-en-kebab-case.markdown` (data d'avui o la que indiqui l'usuari; fus horari `+0100` com als exemples si no es diu el contrari).
5. **Títol del post**: nom del plat en català (natural, no traducció mot a mot forçada).

## Format del fitxer (obligatori)

Reproduir aquest patró:

```markdown
---
layout: single
title:  "Títol en català"
date:   YYYY-MM-DD HH:MM:SS +0100
categories: categoria
---

## Ingredients
### Subtítol del grup (p. ex. Per la salsa)
  - ingredient amb quantitat i unitats en català
  - ...

## Preparació
### Subtítol del grup (alineat amb ingredients o fases)
1. Pas en català.
2. ...

*Font: [Nom del lloc — Títol original o adaptat](URL completa), Autor si es coneix.*
```

### Detalls d'estil (com als posts de referència)

- Exactament dues capçaleres markdown de nivell 2: `## Ingredients` i `## Preparació` (mantenir el mot «Ingredients» com als exemples del repo).
- Sota cada secció, usar `###` per agrupar (p. ex. «Per la carn», «Muntatge»).
- Llistes d'ingredients: dues espais abans del guionet: `  - element`.
- Passos: llista numerada `1.`, `2.`, …
- La línia `*Font: ...*` és opcional però recomanable quan la recepta ve d'una URL concreta; enllaç markdown complet al mateix URL d'on s'ha tret la informació.

## Idioma

- Tot el cos del post en català: títols de subsecció, ingredients, passos i notes.
- Noms propis de plat o ingredient molt habituals en una altra llengua es poden mantenir entre cometes si ajuda (com «Tortilles» a l'exemple de cochinita).

## Després de generar

- Revisar que quantitats i passos siguin plausibles respecte a la font; si la pàgina era incompleta, indicar què s'ha suposat o demanar aclariment.
