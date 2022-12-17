---
tag:
  - Testing 1234
  - Testing 5678
---

![This is an image in a figure block, this note is in a figcaption with **bold**, _italic_, `code` and a [link](http://www.w3.org/).](media/trip-to-new-york.jpeg)

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
>
> - list
> - list with [local link](index.html)
> - list with [external link](https://www.w3.org/)

```
This is a pre block, with **bold**, _italic_, `code`, a [local link](index.html)
and an [external link](https://www.w3.org/).
```

"This is a quote block, with **bold**, _italic_, `code`, a [local link](index.html)
and an [external link](https://www.w3.org/)."

-- Author, Source

![This is an image in a figure block, this note is in a figcaption with **bold**, _italic_, `code` and a [link](http://www.w3.org/).](media/trip-to-new-york.jpeg)


## Date Formatting

Testing dates represented as [Arvelie
date](https://wiki.xxiivv.com/site/arvelie.html)

- 2022.01.01 ++20220101 == 22A01
- 2022.01.14 ++20220114 == 22A14
- 2022.01.15 ++20220115 == 22B01
- 2022.01.28 ++20220128 == 22B14
- 2022.01.29 ++20220129 == 22C01
- 2022.02.11 ++20220211 == 22C14
- 2022.02.12 ++20220212 == 22D01
- 2022.02.25 ++20220225 == 22D14
- 2022.12.17 ++20221217 == 22Z01
- 2022.12.30 ++20221230 == 22Z14
- 2022.12.31 ++20221231 == 22+00
- 2024.12.31 ++20241231 == 24+01
