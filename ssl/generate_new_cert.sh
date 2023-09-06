#!/bin/bash

CONFFILE="eegfaktura-proxy.conf"
CSRFILE="eegfaktura-proxy.csr"
CRTFILE="certs/eegfaktura-proxy.crt"
KEYFILE="private/eegfaktura-proxy.key"
DHPARAM="certs/dhparam.pem"

OPENSSL=`which openssl`

#CLEANUP
if [ -f $CSRFILE ]; then
  rm $CSRFILE
fi

if [ -f $CRTFILE ]; then
  rm $CRTFILE
fi

if [ -f $KEYFILE ]; then
  rm $KEYFILE
fi

#Generate dhparam
$OPENSSL dhparam -dsaparam -out $DHPARAM 4096

#Generate new Key and CSR file
$OPENSSL req -nodes -newkey rsa:2048 -keyout $KEYFILE -out $CSRFILE -subj "/C=AT/ST=Upper Austria/L=Waizenkirchen/O=VFEEG/OU=Development/CN=eegfaktura-proxy" -config $CONFFILE

#Sign CSR with lifteime of 1 year
$OPENSSL req -key $KEYFILE -new -x509 -days 365 -out $CRTFILE -subj "/C=AT/ST=Upper Austria/L=Waizenkirchen/O=VFEEG/OU=Development/CN=eegfaktura-proxy" -config $CONFFILE

