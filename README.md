# security-checkpoint
github action to ensure projects have no vulnerabilities

# Inputs
 - [manager] Required, vulnerability scans are made using tools based off of package manager (go|npm).

# Requirements
Package managers must be installed before running this action

# Managers
- [go] govulncheck
- [npm] npm audit