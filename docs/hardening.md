# Host hardening checklist

These steps are optional but recommended for a public server.

## Firewall (UFW)

```
sudo ufw allow 22/tcp
sudo ufw allow 4000/tcp
sudo ufw allow 2331/tcp
sudo ufw allow 8080/tcp
sudo ufw enable
```

If you map the web container to a different port, adjust the rule accordingly.

## Fail2ban

Install fail2ban on the host and enable the default sshd jail:

```
sudo apt-get install fail2ban
sudo systemctl enable --now fail2ban
```

If you want to add a custom jail for Rockserv2, consider writing a filter that
matches repeated login failures once the server emits them to a log file.
