#!/bin/bash
GF_HOME=/home/hmtrung/test/EMSworkspace/glassfish5
ASASMIN=bin/asadmin
DOMAIN_NAME=trunghoang
ADMIN_PORT=4848
HTTP_PORT=8080
DOMAIN_ADMIN_USER=trunghoang
PASSWORD_FILE=password.txt

GF_CMD="$GF_HOME/$ASASMIN -u $DOMAIN_ADMIN_USER -W $PASSWORD_FILE -I false"
# Check domain name is existed or not
checkDomainExisted(){
    result=$($GF_HOME/$ASASMIN list-domains | grep -w $DOMAIN_NAME)
    return $?
}

# Add some configurations for domain here
configureDomain(){
    $GF_CMD --port $ADMIN_PORT multimode --file configure.txt
}

# Create domain
createGlassfishDomain(){
    if ! checkDomainExisted ;
    then
        $GF_CMD create-domain --adminport $ADMIN_PORT --instanceport $HTTP_PORT --domaindir $GF_HOME/glassfish/domains $DOMAIN_NAME
        configureDomain
    else
        echo "Domain $DOMAIN_NAME is existed. Please check again!"
    fi
}

createGlassfishDomain