#!/bin/bash

sed -i -e "s/##CHANGE_APP_NAME##/$FLY_APP_NAME/g" /etc/headscale/config.yaml

supervisord