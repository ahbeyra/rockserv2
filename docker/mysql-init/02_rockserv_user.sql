CREATE USER IF NOT EXISTS 'rockserv'@'%' IDENTIFIED BY 'change_me';
GRANT ALL PRIVILEGES ON `r2_dillfrog`.* TO 'rockserv'@'%';
GRANT ALL PRIVILEGES ON `r2_fuzzem`.* TO 'rockserv'@'%';
