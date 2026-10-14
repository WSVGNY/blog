# A personal blog built with [Hugo](https://gohugo.io/).

## Run locally

```sh
hugo server --renderToMemory
```

The site will be available at `http://localhost:1313/blog/`. `--renderToMemory` keeps the server out of `public/`, which `publish.sh` uses.

## Add a post

A post is a folder in `content/posts/` with an `index.md` and an `images/` folder:

```md
---
title: "Lisbon, 2026"
date: 2024-01-09
draft: false
---

Some text above the pictures.

{{< light-table "images/*" >}}

Some text below the pictures.
```

`{{< light-table "images/*" >}}` shows the pictures matching the pattern, where it is written: all of them small on one sheet, like a contact sheet, ordered by file name, last first. Clicking one opens it big. Posts are listed newest first, by date.

## Publish

Commit all changes first, then run:

```sh
./publish.sh
```

This builds the site with Hugo and pushes the result to the `gh-pages` branch on GitHub.

## Previously used libraries

- https://github.com/codeclou/bilderrahmen, replaced by PhotoSwipe
