---
# Base Environment
base:
  'roles:kubernetes':
    - match: grain
    - docker
    - k8s.repo
    - k8s

  'roles:docker':
    - match: grain
    - docker

  'roles:ubuntu1804':
    - match: grain
    - packages
    - repos
    - unattended_upgrades
    - users
  
  'roles:enlarged_disk':
    - match: grain
    - growfs
