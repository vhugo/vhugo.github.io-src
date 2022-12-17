---
author:
- Aristotle
- Peter Abelard
---

# This site is a collection of my observations, thoughts and experiences

It is the result of attempting to maintain a personal website. A place to
quietly share projects, ideas and experiments.

In the past, I tried different tools for content management and static website
generators and have tried creating my own. This time, I thought of the minimal
effort required to apply my own workflow  with existing tools instead of
following one from a specialized tool.

### Makefile

The terminal shell is my starting point. I like working on terminal and I value
the idea of [local first](local-first.html) and [digital
preservation](digital-preservation.html) over any fancy tools and services.

**Markdown**: I like markdown. It has enough text formating option without
disrupting the plain text look and feel of the document.

**YAML**: I think YAML looks cleaner than JSON for metadata information.
For when my files need metadata.

**NO-JS**: I want the site to work virtually anywhere. I want to minimize the
use of Javascript. Unless, in place I find it essential. Probably, not on the
pages of this site.

I've chosen [Pandoc](https://pandoc.org) as a solution to convert my Markdown to
HTML. Easy to install and did a great job, so I adopted it - I also found out
it had a customization option using Lua. Bonus points.

Then I decided to use [make](https://gnu.org/software/make/) to build the site.
This tool was not designed for that purpose, but I enjoy typing `make` in the
terminal.

- [source](https://github.com/vhugo/vhugo.github.io-src/)

### Motivation - the motive to motion.

This is not my first attempt creating and maintaining a personal website (I lost
count of how many). But they all started because I was motivated and inspired by
someone's website. This time was no exception.

This time the inspiration came from [Devine Lu Linvega](https://wiki.xxiivv.com)
and from the people listed on the [Merveilles Webring](https://webring.xxiivv.com/)
index. The design was stolen from Devine's wiki with some modifications to meet
my preferences. Thanks Devine.

### Latest changes

- ++20221217 : implemented [Arvelie date](https://wiki.xxiivv.com/site/arvelie.html) format in my custom Pandoc's writer.
