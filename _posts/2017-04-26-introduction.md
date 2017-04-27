---
layout: post
title:  "Continuous Deployment Pipeline for a Jekyll Blog on Google Cloud Storage"
date:   2017-04-26 21:35:22 -0800
---

This blog series is intended to show how you can create a static webpage using
Jekyll and serve the pages from Google Cloud Storage. Additionally, we'll set
up a continuous deployment pipeline without needing a third party service --
only free features of the Google Cloud Platform.

Why create this blog? First, for most people, a static website is good enough
for their use cases. A personal website generally doesn't need a server
generating dynamic pages. Second, it serves as the dogfood app for this whole
process.

Everything here will be open source and available on GitHub.
