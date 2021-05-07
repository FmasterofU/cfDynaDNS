#!/bin/bash

<<COMMENT
	This program updates a CloudFlare DNS record with the current IP addres of the host. It should be only distributed along with its license file.
COMMENT

ZONE=$(cat ~/.cf/igorsikuljak.rs/zone)
DNS_RECORD=$(cat ~/.cf/igorsikuljak.rs/dns_record)
USERNAME=$(cat ~/.cf/igorsikuljak.rs/user_mail)
API_KEY=$(cat ~/.cf/igorsikuljak.rs/global_key)
DNS_NAME=$(cat ~/.cf/igorsikuljak.rs/domain_name)
DNS_TYPE='A'
DNS_TTL='120'
CF_PROXY='false'

CURR_IP=$(curl ifconfig.co/)

COMMAND=curl\ -X\ PUT\ \"https://api.cloudflare.com/client/v4/zones/${ZONE}/dns_records/${DNS_RECORD}\"\ -H\ \"X-Auth-Email:\ ${USERNAME}\"\ -H\ \"X-Auth-Key:\ ${API_KEY}\"\ -H\ \"Content-Type:\ application/json\"\ --data\ \'\{\"type\":\"${DNS_TYPE}\"\,\"name\":\"${DNS_NAME}\"\,\"content\":\"${CURR_IP}\"\,\"ttl\":${DNS_TTL}\,\"proxied\":${CF_PROXY}\}\'

eval ${COMMAND}


<<COMMENT
	You can get your DNS record DNS by listing all DNS records in a zone (you can find your zone id on the right side of the domains overview page)
		curl -X GET "https://api.cloudflare.com/client/v4/zones/YOUR_ZONE_ID/dns_records" \
		     -H "X-Auth-Email: YOUR_USERNAME" \
		     -H "X-Auth-Key: YOUR_API_KEY" \
		     -H "Content-Type: application/json"
COMMENT
