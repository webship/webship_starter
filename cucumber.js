module.exports = {
  default: {
    timeout: 30000,
    requireModule: ['tsx/cjs'],
    require: [
      'node_modules/webship-js/tests/step-definitions/**/*.js',
      'node_modules/@webship-js/drupal-core-steps/tests/step-definitions/**/*.js', // @webship-js/drupal-core-steps: login by handle, the testing users, named pages, messages, listings, the editor, the media library, access control, site structure.
      'tests/step-definitions/**/*.js',
    ],
    paths: ['tests/features/**/*.feature'],
    format: [
      '@cucumber/pretty-formatter',
      'json:tests/reports/cucumber_report.json',
    ],
    formatOptions: {
      colorsEnabled: true,
      theme: {
        'feature keyword': ['bold', 'blue'],
        'feature name': ['blue', 'underline'],
        'feature description': ['blueBright'],
        'scenario keyword': ['bold', 'magenta'],
        'scenario name': ['magenta', 'underline'],
        'step keyword': ['bold', 'green'],
        'step text': ['greenBright', 'italic'],
      },
    },
    worldParameters: {
      launchUrl: process.env.LAUNCH_URL || 'http://localhost',
      minWaitTime: {
        page: 3000,
        before_scenario: 0,
        after_scenario: 0,
        before_step: 0,
        after_step: 0,
      },
      assets_folder: "/assets/",
      // Keep these in sync with scripts/webship.users.yml, the source of
      // truth for the usernames add-testing-users.sh actually creates.
      users: {
        Admin: {
          username: "Admin",
          email: "test.admin@webship.org",
          password: "dD.123123ddd"
        },
        "Authenticated user": {
          username: "Authenticated user",
          email: "test.authenticated@webship.org",
          password: "dD.123123ddd"
        },
        "Content editor": {
          username: "Content editor",
          email: "test.content_editor@webship.org",
          password: "dD.123123ddd"
        }
      }
    },
  },
};
