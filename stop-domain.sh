#!/bin/bash
GF_HOME=/home/hmtrung/test/EMSworkspace/glassfish5
ASASMIN=bin/asadmin
DOMAIN_NAME=trunghoang

stopDomain(){
    $GF_HOME/$ASASMIN stop-domain $DOMAIN_NAME
}

stopDomain