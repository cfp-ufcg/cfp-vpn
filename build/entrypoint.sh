#!/bin/bash

configfile="/etc/headscale/config.yaml"
if [ -f "$configfile" ];then
    echo "Config File Found."
else
    echo "Config File Not Found, Creating it..."
    cp /config.yaml $configfile
    sed -i -e "s/##CHANGE_APP_NAME##/$FLY_APP_NAME/g" $configfile
fi

aclsfile="/etc/headscale/acls.hujson"
if [ -f "$aclsfile" ];then
    echo "ACLs File Found."
else
    echo "ACLs File Not Found, Creating it..."
    cp /acls.hujson $aclsfile
fi

supervisord
