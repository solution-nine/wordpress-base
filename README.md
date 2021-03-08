# Wordpress Base

Provides scripts for easy Bedrock & Trellis management.

Bedrock (v1.15.2) is baked in, Trellis is not stored in the repo, it is brought in through a script.
Themes and Plugins are brought in through Composer.

## Usage
 1. Run `$ yarn setup site.tld` to replace site name
    - Site is `example.com` by default
 1. Update Site details by modifying files in `trellis-config/`
    - All modifications should be done in this directory and committed
    - Do not commit password filess
 1. Run `$ yarn setup` to bring in trellis
 1. Run `$ trellis up` to load vagrant
 1. Run `$ trellis provision staging` to provision staging server
 1. Run `$ trellis deploy staging` to deploy to staging

## TODO
 - Database Sync
 - Create self-destructing staging environments