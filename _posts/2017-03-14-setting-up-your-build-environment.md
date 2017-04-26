---
layout: post
title:  "Setting Up Your Build Environment"
date:   2017-03-14 09:12:00 -0800
categories: docker
comments: true
---

When building a PHP extension, we must consider what version of PHP we would like to support. In most cases, we will want to support multiple flavors of PHP. For each of these flavors of PHP, we (or the developer) will have to compile the extension.

What are these "flavors"? Let's take a look.

## PHP Version

First, and most obviously, is the exact version of PHP we want to support. As of this writing, the currently supported versions of PHP are 5.6.x, 7.0.x, and 7.1.x. If you want to support all 3 of the versions, you will want a different build environment for each version.

## Zend Thread Safety (ZTS)

ZTS is an optional feature that can be enabled when you compile PHP. It allows you to enable POSIX thread usage in your C code and also allow you to use the [pthreads extension][pthreads].

## OS Type

You may also want to make your extension available for Windows users. I won't go into this as I don't have experience working on it.

So how can we set up a development environment that allows us to compile all these combinations on a single development machine? Enter Docker.

## Docker

[Docker][docker] is a platform that allows you to build reusable containers that contain just the dependencies you need. When running, it is essentially a lightweight virtual machine. We can utilize docker to separate our dependencies when trying to run multiple versions of PHP.

We'll create one `Dockerfile` which we will use to build each version of PHP we want to develop against. Here's the example `Dockerfile`:

{% highlight docker %}
{% include Dockerfile %}
{% endhighlight %}

We can use this to create several development images that we can further use. For example, we want to build an image for PHP 7.1.3 with ZTS support:

{% highlight bash %}
$ docker build --build-arg PHP_VERSION=7.1.3 --build-arg PHP_OPTIONS="--enable-maintainer-zts" -t php-build-71-zts .
{% endhighlight %}

This image will be created and tagged as `php-build-71-zts`. We can now use this image for further development work by running it:

{% highlight bash %}
$ docker run --rm -it php-build-71-zts /bin/bash
{% endhighlight %}

This drops us into a bash session within a container running the php image. Let's make sure we have the correct version installed.

{% highlight bash %}
root@5f24f8b48465:/src/php# php -v
PHP 7.1.3 (cli) (built: Mar 14 2017 17:47:22) ( ZTS )
Copyright (c) 1997-2017 The PHP Group
Zend Engine v3.1.0, Copyright (c) 1998-2017 Zend Technologies
{% endhighlight %}

Success! We can now do this again for each version of PHP and each option we want. For subsequent posts, we will create:

* `php-build-71-zts` - 7.1.3 with ZTS
* `php-build-71` - 7.1.3 without ZTS
* `php-build-70-zts` - 7.0.17 with ZTS
* `php-build-70` - 7.0.17 without ZTS

[pthreads]: http://php.net/manual/en/book.pthreads.php
[docker]: https://www.docker.com/
