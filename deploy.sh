#!/usr/bin/env bash
EMAIL=${EMAIL}
DOMAIN=${DOMAIN-localhost}
USER=${USER-admin}
PASS=${PASS-admin}
PROTOCOL=${PROTOCOL-http}

printf "${USER}:$(openssl passwd -apr1 ${PASS})\n" > ./htpasswd

if [ ${PROTOCOL} == "http" ] 
  then
    echo "deploying traefik stack in http mode"
    docker stack deploy -c infra_http.yml infra
    echo "Traefik UI is available at:"
    echo "- http://${DOMAIN}"
  else
    echo "deploying traefik stack in https mode"
    docker stack deploy -c infra_https.yml infra
    echo "Traefik UI is available at:"
    echo "- https://${DOMAIN}"
fi