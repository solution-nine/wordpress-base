#!/usr/bin/env bash
cd trellis/
vagrant ssh -- -t 'cd /srv/www/example.com/current && wp db export --exclude_tables=wp_users,wp_usermeta,wp_wfLeechers,wp_wfTrafficRates,wp_wfFileMods db/site.sql'
cd ..
mv site/db/site.sql database/site.sql