#!/bin/bash
GF_HOME=/home/hmtrung/test/EMSworkspace/glassfish5
ASASMIN=bin/asadmin
DOMAIN_NAME=trunghoang

DOMAIN_STATUS=$($GF_HOME/$ASASMIN list-domains | grep -w "$DOMAIN_NAME running")


# Stop glassfish before remove domain
stopGlassfish(){
    $GF_HOME/$ASASMIN list-domains | grep -w "$DOMAIN_NAME running"
    if [ $? == 0 ];
    then
        ./stop-domain.sh
    fi
}

# Check domain name is existed or not
checkDomainExisted(){
    $GF_HOME/$ASASMIN list-domains | grep -w $DOMAIN_NAME
    return $?
}

# Remove domain
deleteGlassfishDomain(){
    if checkDomainExisted;
    then
        stopGlassfish
        $GF_HOME/$ASASMIN delete-domain --domaindir $GF_HOME/glassfish/domains $DOMAIN_NAME
    else
        echo "Domain $DOMAIN_NAME isn't existed. Please check again!"
    fi
}

deleteGlassfishDomain
#checkDomainExisted