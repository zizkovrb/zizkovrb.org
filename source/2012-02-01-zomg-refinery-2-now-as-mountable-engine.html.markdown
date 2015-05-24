---
title: ZOMG! Refinery 2 now as Mountable Engine!
date: 2012-02-01 12:00 UTC
tags:
---

Most widely used Rails CMS (according to [ruby-toolbox](https://www.ruby-toolbox.com/categories/content_management_systems)) passed a big [change](https://github.com/resolve/refinerycms/pull/1234#issuecomment-3753169). You can send your thanks to [ugisozols](https://github.com/ugisozols) and [parndt](https://github.com/parndt). It is fully namespaced now and available as mountable engine, so you can easily attach it into your existing application.

You can try new Refinery from github master via rails template.

<script src="https://gist.github.com/1718707.js?file=refinery-test.sh" type="text/javascript"></script>

You can now mount refinery where you will need inside yours `config/routes.rb`.

<script src="https://gist.github.com/1718707.js?file=routes.rb" type="text/javascript"></script>

## Refinery settings refactored hard!

Instead of old style settings saved in your refinery_settings database table Refinery now provides a couple of initializers. You can find them in `config/initialiters/refinery`. You can specify there settings like site languages or site name.

There are also two brand new features in core.rb initializer. You can now specify custom backend assets (javascript or stylesheet) in `config/initializers/refinery/core.rb`. This is [my](https://github.com/simi) [work](https://github.com/resolve/refinerycms/pull/1266) and it is inspired by awesome [Greg Bell](https://github.com/gregbell)’s [Active Admin](https://github.com/gregbell/active_admin).

You can also specify html tags whitelist for included wysiwyg [WYMeditor](http://www.wymeditor.org/). This [feature](https://github.com/resolve/refinerycms/commit/f44241e8c81f4b82bd66ad433fb20fcef499abcf) is result of [parndt](https://github.com/parndt)’s awesome work. So you definitely should nominate him to [rubyhero](http://rubyheroes.com/) for his great work.

## Should I upgrade to use those cool features right now ?

If you are using some custom engines or overrided parts don’t do this. There is a lot of changes in namespacing and in conclusion there are not backwards compatible routes.

For adventurers: you can inspire by [parndt](https://github.com/parndt)’s [rework](https://github.com/resolve/refinerycms-blog/commit/33bfa4dd231e4042456b3a70059c9cf57af858cf) of [refinerycms-blog](https://github.com/resolve/refinerycms-blog) for latest refinery master branch. _Isn’t it another good reason for [rubyhero](http://rubyheroes.com) nomination ?_

