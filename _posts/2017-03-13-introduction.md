---
layout: post
title:  "My First Post"
date:   2017-04-26 21:35:22 -0800
---

This blog series is intended to document how to build a C extension for PHP 7.0/7.1.

Why create this blog? There are scant resources out there to teach you how to create PHP extensions and the ones you do find are out dated. If you'd like to look anyways, here are a few:

* [PHP Internals Book][php-internals-book]
* [Extending and Embedding PHP by Sara Golemon][php-book]
* various other websites that only build a "Hello World!" extension.

Throughout this series, we will talk about the data structures built into the Zend API as well as the rationale (my interpretation at least) for the design choices made by the core team.

[php-internals-book]: http://www.phpinternalsbook.com/
[php-book]: https://smile.amazon.com/Extending-Embedding-PHP-Sara-Golemon/dp/067232704X
