# Wordpress Base

Provides scripts for easy Bedrock & Trellis management.

Bedrock (v1.15.2) is baked in, Trellis is not stored in the repo, it is brought in through a script.
Themes and Plugins are brought in through Composer.

## Usage
 1. Update Site info by modifying files in `trellis-config/`
 	- Site is `example.com` by default
 2. Run `$ scripts/setup.sh` to bring in trellis
 3. Run `$ trellis up` to load vagrant
 4. Run `$ trellis provision staging` to provision staging server
 5. Run `$ trellis deploy staging` to deploy to staging
 
 
## TODO
 - Database Sync
 - Create self-destructing staging environments