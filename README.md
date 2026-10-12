# A personal blog built with [Hugo](https://gohugo.io/).

## Run locally

```sh
hugo server
```

The site will be available at `http://localhost:1313/blog/`.

## Add pictures to the album

An album is a folder in `content/`, and each folder inside it is one chapter.

1. Make a folder for the trip, e.g. `content/photo-album-01/0006-lisbon/`
2. Put the pictures in an `images/` folder inside it
3. Add an `index.md` with a title and a date:

```md
---
title: "Lisbon, 2026"
date: 2024-01-06
draft: false
---
```

Chapters are ordered by date, newest first. Pictures are ordered by file name, last first.

For a second album, copy `content/photo-album-01/_index.md` into a new folder and change its title.

## Add a post

A folder in `content/posts/` with an `index.md` and an `images/` folder. To show the pictures, put this in the `index.md`:

```md
{{< picture-list "images/*">}}
```

## Publish

Commit all changes first, then run:

```sh
./publish.sh
```

This builds the site with Hugo and pushes the result to the `gh-pages` branch on GitHub.

## Previously used libraries

- https://github.com/codeclou/bilderrahmen, replaced by PhotoSwipe
