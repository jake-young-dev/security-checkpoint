# security-checkpoint
A very simple action to check for vulnerabilities in projects.

# Usage
## Inputs
 - [manager] Required, vulnerability scans are made using tools based off of package manager (go|npm).
 - [panic] Optional, determines if workflow error's when vulnerabilities are found (yes|no).

## Example
```
- name: "Check for vulns"
  uses: https://github.com/jake-young-dev/security-checkpoint@master #use a tag
  with:
   manager: npm
   panic: no #prevents errors when vulns are detected
```

# Requirements
Package managers like Go and Node must be installed before running this action

# Managers
- [go] govulncheck
- [npm] npm audit