#!/bin/bash

echo "Starting security audit"

echo "Parsing package manager"
# . is the default input and used to ensure required inputs are set, since actions don't for whatever reason
if [[ "$PACKAGE_MANAGER" == "." ]]; then
    echo "FATAL: Manager input required"
    exit 1
fi

echo "Auditing project with $PACKAGE_MANAGER"

#npm audit
if [[ "$PACKAGE_MANAGER" == "npm" ]]; then
    VULNS=$(npm audit)
    if [[ "$VULNS" == "found 0 vulnerabilities" ]]; then
        echo "No vulnerabilities found, audit passed!"
        exit 0
    else
        if [[ "$ERROR_ON_VULN" == "no" ]]; then
            echo "$VULNS"
            exit 0
        else
            echo "FATAL: Vulnerabilities found, details below"
            echo "$VULNS"
            exit 1
        fi
    fi
fi

#govulncheck
if [[ "$PACKAGE_MANAGER" == "go" ]]; then
    VULNS=$(govulncheck ./...)
    #if vulns are found the exit status is 1
    if [ $? -eq 0 ]; then
        echo "No vulnerabilities found, audit passed!"
        exit 0
    else
        if [[ "$ERROR_ON_VULN" == "no" ]]; then
            echo "$VULNS"
            exit 0
        else
            echo "FATAL: Vulnerabilities found, details below"
            echo "$VULNS"
            exit 1
        fi
    fi
fi

echo "Done"