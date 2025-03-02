#!/bin/bash

echo "Starting security audit"

if [[ "$SHELL_INPUT" == "." ]]; then
    echo "FATAL: Shell input required (go|npm)"
    exit 1
fi

echo "Auditing project with $SHELL_INPUT"

if [[ "$SHELL_INPUT" == "npm" ]]; then
    VULNS=$(npm audit)
    if [[ "$VULNS" == "found 0 vulnerabilities"]]; then
        echo "No vulnerabilities found, audit passed!"
        exit 0
    else
        echo "FATAL: Vulnerabilities found, details below"
        echo "$VULNS"
        exit 1
    fi
fi

if [[ "$SHELL_INPUT" == "go" ]]; then
    VULNS=$(govulncheck ./...)
    if [ $? -eq 0 ]; then
        echo "No vulnerabilities found, audit passed!"
        exit 0
    else
        echo "FATAL: Vulnerabilities found, details below"
        echo "$VULNS"
        exit 1
    fi
fi

echo "Done"