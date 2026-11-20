# Linux Administration - Week 4

This repository contains the files for the Week 4 assignment: hourly backups and MariaDB replication between Server A and Server B.

## Links
- Server A (counter): http://195.148.21.184/viikko2/
- Server B (read-only replica and documentation): http://86.50.20.121/viikko4/

## Files
- `server-a/backup_www.sh` - script that copies `/var/www/html` to Server B
- `server-a/crontab.txt` - cron schedule (runs once per hour)
- `server-a/mariadb-primary.cnf` - MariaDB settings for Server A
- `server-b/mariadb-replica.cnf` - MariaDB settings for Server B
- `server-b/app.py` - Flask app on Server B (read-only)
- `server-b/templates/index.html` - Week 4 page on Server B
