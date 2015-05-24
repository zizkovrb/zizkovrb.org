---
title: 'Refinery 2, episode: New engines'
date: 2012-02-09 12:00 UTC
tags:
---

I’m really suprised, because more than 500 people were reading my [last](http://retro.apicko.cz/blog/2012/02/01/zomg-refinery-2-now-as-mountable-engine/) ([first](http://retro.apicko.cz/blog/2012/02/01/zomg-refinery-2-now-as-mountable-engine/)) article about new [Refinery CMS](http://refinerycms.com/) features. I decided to write more about new Refinery 2 features. This article will focus on new Refinery engine generator. It is really new hot stuff.

## What are those refinery engines about?

Refinery comes with engine and form generator. Engine generator create whole CRUD on backend and pages on frontend. [Refinery](http://refinerycms.com/) 1 (still stable now) had engine generator also, but it was very limited. I want to share some examples how to use new engine generator to make your life easier.

### Introducing new engine generator in dumb examples

#### Simple engine for serving ads

We have nothing, only shell and bundler with installed latest stable rails.

<script src="https://gist.github.com/00ee8e62ca321ef1f507.js?file=ads.sh" type="text/javascript"></script>

In `vendor/engines/retro_rubies` is generated Refinery engine with ad model and complete admin CRUD. Engine is called retro_rubies, fully namespaced into Marketing namespace and backend is tested with few rspec requests. That’s great start. You can add some ad partial into `vendor/engines/retro_rubies/app/views/marketing/ads/_ad.html.erb` and render it in layout with some random ad.

#### Team members engine

So we have some basic ad functionality. Now we will add our team members.

<script src="https://gist.github.com/00ee8e62ca321ef1f507.js?file=team-members.sh" type="text/javascript"></script>

This will generate both backend and frontend parts. So you can add team members in admin and view list and detail on frontend. Just few CSS tweaks and it is finished.

#### Team member quotes

It will be nice to add quotes to our team members, so we can show random member with his quote on each page.

<script src="https://gist.github.com/00ee8e62ca321ef1f507.js?file=team-member-quotes.sh" type="text/javascript"></script>

Now we just need to add model relations.

<script src="https://gist.github.com/00ee8e62ca321ef1f507.js?file=model.rb" type="text/javascript"></script>

And finally edit quote form for better UI.

<script src="https://gist.github.com/00ee8e62ca321ef1f507.js?file=view.html.erb" type="text/javascript"></script>

Now we just need to tweak layout again. Mabye create some `member_quote` partial and render it with random quote where we want.

#### And what about localized site?

Refinery’s one great feature is localization support. Now with my [hot patch](https://github.com/resolve/refinerycms/pull/1292), you can generate fully localized engines as well. Engine generator is extended with `--i18n` option. If we want translateble quotes from last paragraph, we just need to run this line to generate quotes.

<script src="https://gist.github.com/00ee8e62ca321ef1f507.js?file=localized.sh" type="text/javascript"></script>

Now name and content will be saved in separate table. But it will act transparently thanks to [globalized3 gem](https://github.com/svenfuchs/globalize3). In backend you will be able to translate name and content column.

#### Conclusion

I know those examples are really stupid. But in short, we can generate what we need and with small tweaks we can achieve great result just in few minutes. You can pack all generated stuff into one engine or split into multiple (by `--engine` option). You can divide logic in engine with `--namespace` option and specify translated columns with `--i18n` option. When you don’t need frontend, just add `--skip-frontend` and it will be skipped. There are also included some basic readme.md and gemspec in every generated engine. And suprisingly all generated features are shipped with some basic specs (i18n also). You can just aim to add some custom logic instead of repeating same code again and again.

## And what about some custom contact form?

There is also form engine generator. You can easily generate contact or job application form. It’s super easy. I think this doesn’t need longer description.

<script src="https://gist.github.com/00ee8e62ca321ef1f507.js?file=contact-form.sh" type="text/javascript"></script>

## Should I try now or not?

Those features are really new. `--i18n` feature is [not merged](https://github.com/resolve/refinerycms/pull/1292) into master now. There are also some issues with generating engines into one namespace (db/seeds.rb). But I’ll try to fix them ASAP. I can recommend to experiment with those features for now. Mainly [bug reports](https://github.com/resolve/refinerycms/issues) are welcome. Refinery 2 with all those features should be released before March.

## Next?

I’m preparing article about using [RefineryCMS](http://refinerycms.com/) with [Twitter bootstrap](http://twitter.github.com/bootstrap/). OK, I’m lying. I’m preparing one lowcost RefineryCMS site with Twitter bootstrap and I will probably release twitter-bootstrap engine for RefineryCMS. All you will need to do is adding it into your Gemfile. If you would like to read article about building whole site from scratch using RefineryCMS and Twitter bootstrap left me some comment here or [tweet me](https://twitter.com/retrorubies). Also feel free to follow me on [Twitter](https://twitter.com/retrorubies) if you like my [articles](http://retro.apicko.cz/).
