# security-checkpoint
github action to ensure projects have no vulnerabilities for security-minded applications

# Usage
## Inputs
 - [manager] Required, vulnerability scans are made using tools based off of package manager (go|npm).
## Example
```
- name: "Check for vulns"
  uses: https://github.com/jake-young-dev/security-checkpoint@master #use a tag
  with:
   manager: npm
```

# Requirements
Package managers must be installed before running this action

# Managers
- [go] govulncheck
- [npm] npm audit
