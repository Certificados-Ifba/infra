#!/usr/bin/env bash
EMAIL=${EMAIL}
DOMAIN=${DOMAIN-localhost}
USER=${USER-admin}
PASS=${PASS-admin}

printf "${USER}:$(openssl passwd -apr1 ${PASS})\n" > ./htpasswd

echo "deploying traefik stack in https mode"
docker stack deploy -c docker-compose.yml infra
echo "Traefik UI is available at:"
echo "- https://${DOMAIN}"
