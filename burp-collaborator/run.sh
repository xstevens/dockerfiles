#!/bin/bash

set -e

# env vars that should be set by docker run
export BURP_SERVER_DOMAIN=${BURP_SERVER_DOMAIN:-"burpcollaborator.ecorp.com"}
export BURP_SSL_DOMAIN=${BURP_SSL_DOMAIN:-$SERVER_DOMAIN}
export BURP_METRICS_PATH=${BURP_METRICS_PATH:-"ae6bf3b062d2492fb9cf7579781271f6"}

# render configuration
confd -onetime -backend env

# run collaborator
java -jar burpsuite.jar --collaborator-server --collaborator-config=collaborator.conf
