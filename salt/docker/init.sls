install docker:
  pkg.installed:
    - name: docker.io

docker-compose:
  file.managed:
    - name: /usr/local/bin/docker-compose
    - source:  https://github.com/docker/compose/releases/download/1.24.1/docker-compose-Linux-x86_64
    - source_hash: https://github.com/docker/compose/releases/download/1.24.1/docker-compose-Linux-x86_64.sha256
    - user: root
    - group: root
    - mode: 755
