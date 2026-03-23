# A personal blog built with [Hugo](https://gohugo.io/).

## Run locally

```sh
hugo server
```

The site will be available at `http://localhost:1313/blog/`.

## Add new pictures

1. Place `.JPG` files in `_local/source/`
2. Run the generation script:

```sh
./parse-images.sh
```

This groups images into batches of 10 and creates the corresponding posts under `content/posts/`.

## Publish

Commit all changes first, then run:

```sh
./publish.sh
```

This builds the site with Hugo and pushes the result to the `gh-pages` branch on GitHub.
