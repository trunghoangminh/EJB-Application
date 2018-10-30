#!/bin/bash
GF_HOME=/home/hmtrung/test/EMSworkspace/glassfish5
ASASMIN=bin/asadmin
DOMAIN_NAME=trunghoang

startDomain(){
    $GF_HOME/$ASASMIN start-domain $DOMAIN_NAME
}

startDomain