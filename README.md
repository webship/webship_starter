# Webship Starter

The Webship site template: the [Website Starter](https://www.drupal.org/project/website_starter) with documentation,
products and releases, a newsletter and social sharing. It brings the Webship 11.0.x
distribution to recipes.

Maintained by [Webship](https://www.drupal.org/project/webship). Webship and the Website Starter use the
[UI Suite UIkit](https://www.drupal.org/project/ui_suite_uikit) theme, with [UIkit](https://getuikit.com) and
[HTMX](https://htmx.org), on top of Drupal and [Display Builder](https://www.drupal.org/project/display_builder).
No Layout Builder displays and no Drupal Canvas.

![Webship Starter](screenshot.webp)

## Install

With the [Website](https://www.drupal.org/project/website) project template and DDEV:

```shell
composer create-project drupal/website my_site
cd my_site
ddev config --project-type=drupal --docroot=web
ddev start
ddev launch
```

The [Webship](https://www.drupal.org/project/webship) installer lists the site templates: choose Webship Starter.

From the command line:

```shell
ddev drush site:install webship -y
```

On an installed site:

```shell
ddev composer require drupal/webship_starter
ddev drush recipe ../recipes/webship_starter
```

## What you get

- Everything in the Website Starter: page layout, Webpage and Web Blog, contact webform, menus and demo content.
- [Web Doc](https://www.drupal.org/project/webdoc): documentation book pages, with a Documentation page at `/docs`.
- [Web Releases](https://www.drupal.org/project/webreleases): products and release notes, at `/products`.
- [Web Newsletter](https://www.drupal.org/project/webnewsletter): a newsletter subscription webform.
- [Webshare](https://www.drupal.org/project/webshare): social sharing buttons.

## Tests

```shell
yarn install
LAUNCH_URL=https://my-site.ddev.site yarn test
```
