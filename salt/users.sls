matt:
  user.present:
    - fullname: Matt Thompson
    - shell: /bin/bash
    - home: /home/matt
    - uid: 1000
    - gid: 1000
    - password: $6$SALTsalt$S2Q.hIEm9SkcwoJgAntYTF8kY1A3JAKTe1FKustoyPKb/ffsVcuwA2VfHPBpOnBEFRna03DxEaQ920sQhMGCb0
    - groups:
      {% if grains['os'] == 'Ubuntu' %}
      - sudo
      {% endif %}
    - optional_groups:
      - docker
  ssh_auth.present:
    - user: matt
    - enc: ssh-rsa
    - source: salt://ssh_keys/matt.id_rsa.pub
    - config: '%h/.ssh/authorized_keys'
