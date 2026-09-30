# Webship Starter

The Webship site template: a site to manage software, with documentation, products and releases,
a newsletter and social sharing. It brings the Webship 11.0.x distribution to recipes.

Maintained by [Webship](https://www.drupal.org/project/webship). Built with the
[UI Suite UIkit](https://www.drupal.org/project/ui_suite_uikit) theme, with [UIkit](https://getuikit.com) and
[HTMX](https://htmx.org), on top of Drupal and [Display Builder](https://www.drupal.org/project/display_builder).
No Layout Builder displays and no Drupal Canvas.

The site template works on its own: it applies the Web Admin, Web SEO, Web Security, Web Development, Web Page,
Web Assets, Web Editor, Web Config, Web Doc, Web Releases and Web Newsletter default recipes, the Web Dashboard
recipe and core recipes, never another site template.

![Webship Starter](screenshot.webp)

## Install

Composer runs inside DDEV, so nothing is needed on your machine but DDEV itself. Start from the
[Website](https://www.drupal.org/project/website) project template, which ships this site template:

```shell
mkdir -p ~/workspace/projects/my-webship-site
cd ~/workspace/projects/my-webship-site
ddev config --project-type=drupal11 --docroot=web --php-version=8.4
ddev start
ddev composer create-project drupal/website:^1.0@alpha
ddev drush site:install ../recipes/webship_starter -y --account-name=webmaster --site-name="My Webship Site"
ddev launch
```

Or open the site with `ddev launch` and pick Webship Starter in the installer.

On an installed site, apply it as a recipe:

```shell
ddev composer require drupal/webship_starter:^1.0@alpha
ddev drush recipe ../recipes/webship_starter
```

## What you get

- **Content types**: Webpage, with the media library (images, documents, audio, video) of Web Assets.
- **Example content** that teaches as you read it: a front page, a *Make it yours* page about editing the pages
  and changing the look, and a *Support* page with a short FAQ. Everything is about Marigold, a made-up task
  board, so you can see a product, its docs and its support desk working together, then replace it.
- **A page layout** built in Display Builder with UIkit components: sticky navbar with logo, main and account
  menus, offcanvas menu on small screens, content section and footer with menus and social links.
- [Web Doc](https://www.drupal.org/project/webdoc): documentation book pages, with a Documentation page at `/docs`
  and three guides: getting started, your first board, and questions and answers.
- [Web Releases](https://www.drupal.org/project/webreleases): products and release notes, at `/products`, with
  the Marigold example product and two of its releases.
- [Web Newsletter](https://www.drupal.org/project/webnewsletter): a newsletter subscription webform.
- [Webshare](https://www.drupal.org/project/webshare): social sharing buttons.
- **Contact webform** with anti-spam protection, at `/contact`.
- **Administration**: [Web Admin](https://www.drupal.org/project/webadmin) with Gin and its toolbar, Coffee,
  Project Browser and automatic updates; the Webmaster and Editorial default dashboards of the
  [Web Dashboard recipe](https://www.drupal.org/project/webdash), built with Display Builder.
- **SEO and security**: [Web SEO](https://www.drupal.org/project/webseo) with breadcrumbs, redirects, path
  aliases, metatags and the XML sitemap; [Web Security](https://www.drupal.org/project/websecurity) with anti-spam
  protection and login by email or username.
- **Editing and configuration**: the editor and configuration management features of Webship.
- **Design system**: the UI Suite UIkit theme with its UI Styles utilities, UI Skins design tokens (light and
  dark color modes) and UI Icons pack.
- **The look**: a calm blue (`#2448C4`), near-black headings and the fonts of the operating system, with a
  second palette for the dark mode. It is all UI Skins settings of the theme, under *Appearance > CSS variables*,
  so you can change it without CSS.

## Page layouts and the administration theme

The page layouts are built for UI Suite UIkit, the front theme, and stay out of the pages UIkit Admin renders:

- The Home layout adds the *Current theme* condition
  (`current_theme: ui_suite_uikit`) to the path they target.
- The default layout keeps no condition: Display Builder takes a page layout without conditions for the
  default one. [Web Admin](https://www.drupal.org/project/webadmin) keeps it out of the pages another theme
  renders, like the log in, password reset and registration screens it shows in UIkit Admin.

A site installed from an earlier release gets the default layout fixed by updating Web Admin. The
conditional layouts get the condition with:

```shell
ddev drush php:eval '
foreach (\Drupal::entityTypeManager()->getStorage("page_layout")->loadMultiple() as $layout) {
  if (!$layout->isDefault() && !$layout->getConditions()->has("current_theme")) {
    $layout->getConditions()->addInstanceId("current_theme", ["id" => "current_theme", "negate" => FALSE, "theme" => "ui_suite_uikit"]);
    $layout->save();
  }
}'
```

## Image credits

The photos in `content/file` are released under CC0 (public domain dedication), and were resized for the web:

| File | Photo | Author | License |
| --- | --- | --- | --- |
| `developer-laptop-code.jpg` | [Laptop coding programs](https://commons.wikimedia.org/wiki/File:Laptop_coding_programs_(Unsplash).jpg) | Tirza van Dijk | CC0 |
| `code-on-monitor.jpg` | [Code on computer monitor](https://commons.wikimedia.org/wiki/File:Code_on_computer_monitor_(Unsplash).jpg) | Markus Spiske | CC0 |
| `code-editor-laptop.jpg` | [Code editor on a laptop](https://commons.wikimedia.org/wiki/File:Pexels-luis-gomes-546819.jpg) | Luis Gomes | CC0 |
| `team-planning-laptops.jpg` | [Planning with laptops](https://commons.wikimedia.org/wiki/File:Helloquence-61189.jpg) | Helloquence | CC0 |

`make-it-yours-light.jpg` and `make-it-yours-dark.jpg` are screenshots of this site template, distributed with
this project under GPL-2.0-or-later.

## Requirements

- Drupal 11.4 or later.
- PHP 8.3 or later.
- Composer 2.

## Tests

```shell
yarn install
LAUNCH_URL=https://my-site.ddev.site yarn test
```
