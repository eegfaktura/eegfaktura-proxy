#!/bin/sh

SED=`which sed`

#if CERT_FILE ENV var is set
if [ "$CERT_FILE" != "" ]; then
    #and KEX_FILE ENV var is set
    if [ "$KEY_FILE" != "" ]; then
      #Change KEY and CERT File in config to ENV values
      $SED -i "s|ssl_certificate /etc/ssl/certs/eegfaktura-proxy.crt|ssl_certificate $CERT_FILE|g" /etc/nginx/nginx.conf
      $SED -i "s|ssl_certificate_key /etc/ssl/private/eegfaktura-proxy.key|ssl_certificate_key $KEY_FILE|g" /etc/nginx/nginx.conf
    fi
fi

