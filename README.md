# cfDynaDNS
Service for automatic updating of CloudFlare's DNS record with the current Host's IP address.

```sudo cp cfdnsupdater.service /etc/systemd/system/cfdnsupdater.service```
```sudo systemctl enable cfdnsupdater```
```sudo systemctl start cfdnsupdater```
