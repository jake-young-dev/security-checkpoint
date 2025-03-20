# security-checkpoint
github action to scan node and go apps for vulnerabilities, simple and fast

# Inputs
 - [manager] Required, vulnerability scans are made using tools based off of package manager (go|npm).
 - [panic] Required, determines if a found vulnerability will cause the workflow to fail, defaults to yes (yes|no).

# Requirements
Package managers must be installed before running this action

# Managers
- [go] govulncheck
- [npm] npm audit