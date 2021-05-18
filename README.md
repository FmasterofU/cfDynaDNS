# cfDynaDNS - Solve your dynamic public IP problems
## A Service for automatic updating of CloudFlare's DNS record with the current Host's IP address.


### Configuration for the script

Create a file/folder structure like this:
```
user's home directory
|
├── .cf
│   ├── igorsikuljak.rs
│   |   ├── dns_record
│   |   ├── domain_name
│   |   ├── global_key
│   |   ├── user_mail
│   |   └── zone
|   ├── *other dns name*
|   └── ...
|
```
- create a `.cf` folder in your (ROOT user is advised) home directory, and then a `*domain name*` subdirectory
- in the domain name's directory create files with names `zone`, `dns_record`,  `global_key`, `user_mail` and `domain_name`; each containing only its corresponding value (CF Zone id, CF DNS record id,  global CF API key - or a specific API key, your CF username, and the domain name)
- Manualy change the static TTL value (120 seconds) or CF Proxy status (default: disabled) for your needs
- change permissions for the file (to be executable) by executing `sudo chmod a+xcfdnsupdater.sh`

### Configuration and preparation of the systemd service file

- if needed, change the `RestartSec` value to the frequency in witch the updater should run (in seconds, default is on every 10 minutes = 600 seconds); Keep in mind the CF's limits, currently it's 1200 requests max in 5 minutes, per account
- if needed, set the user context, same user in which home directory are the `.cf` and `cfDynaDNS` directories located, by changing the `User` value (default is `root`)
- move the service file to systemd's system services directory by executing ```sudo cp cfdnsupdater.service /etc/systemd/system/cfdnsupdater.service```

### Start the service

- (optional) set it to schedule automaticaly on every susequent system startup by executing ```sudo systemctl enable cfdnsupdater```
- start the service by executing ```sudo systemctl start cfdnsupdater```


### Enjoy your CloudFlare Dynamic DNS.




#### Note to self
This script and/or service was created because the original general DynDNS program is now lost (not to mention the licensing issues) and as I'm currently using only CF services, this turns out to all that I need (and probably will ever need).
