---
tag:
  - Testing 1234
  - Testing 5678
---

# Testing... 1, 2, 3...

This is how I test the formatting through my `Makefile` plus `lua` script in
combination with [pandoc](https://pandoc.org/). Most of it works out-of-the-box,
some stuff I needed to customise.

# header1
## header2
### header3
#### header4
##### header5

This is a paragraph, with **bold**, _italic_, `code`, a [local link](index.html)
and an [external link](https://www.w3.org/).

> This is a paragraph inside an article block, with **bold**, _italic_, `code`,
> a [local link](index.html) and an [external link](https://www.w3.org/).

```
This is a pre block, with **bold**, _italic_, `code`, a [local link](index.html)
and an [external link](https://www.w3.org/).
```

"This is a quote block, with **bold**, _italic_, `code`, a [local link](index.html)
and an [external link](https://www.w3.org/)."

-- Author, Source

![This is an image in a figure block, this note is in a figcaption with **bold**, _italic_, `code` and a [link](http://www.w3.org/).](media/trip-to-new-york.jpeg)
