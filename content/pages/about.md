---
author:
- Aristotle
- Peter Abelard
---

# This site is a collection of my own observations, thoughts and experiences

It is the result of attempting to maintain a personal website. A place to
quietly share projects, ideas and experiments.

In the past, I tried different tools specifically for content management and
static website generators and even started creating my own. This time, I thought
of what would be the minimal require to create my own workflow instead of
following one from a specialized tool.

### Makefile

A terminal shell is my starting point. I value the conceptS of [local
first](local-first.html) and [digital preservation](digital-preservation.html)
over any fancy tool/service or format.

**Markdown**: I like markdown. It has enough text formating without disrupting
the plain text look and feel of the document. It does not have forced
indentation or markup.

**YAML**: I think YAML looks cleaner than JSON for metadata information.
Whenever my files need metadata.

**NO-JS**: I want the site to work virtually anywhere. I will minimize the
effort to achieve that by avoiding Javascript. Unless where I think it is
essential. Not on the pages of this site.

First I looked for a solution to convert Markdown to HTML.
[Pandoc](https://pandoc.org) did a great job, so I adapted it - I also found out
it had a customization option using Lua.

Then I decided to use [make](https://gnu.org/software/make/) to make the site.
This tool was not design for that purpose, but I enjoy typing `make` in the
terminal.

- [source](https://github.com/vhugo/vhugo.github.io-src/)

### Motivation - the motive to motion.

This is not my first attempt creating and maintaining a personal website (I lost
count of how many). But they all started because I was motivated and inspired by
someone's website. This time was no exception.

This time the inspiration came from [Devine Lu Linvega](https://wiki.xxiivv.com)
and from the people listed on the [Webring](https://webring.xxiivv.com/)
index. The design was stolen from Devine's wiki with some modifications to meet
my preferences.
