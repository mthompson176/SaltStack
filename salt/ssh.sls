/etc/ssh/sshd_config:
  file.managed:
  {%if grains['osfinger'] == 'Ubuntu-16.04' %}
  - source: salt://files/etc/ssh/sshd_config.xenial
  {% endif %}
  {% if grains['osfinger'] == 'Ubuntu-18.04' %}
  - source: salt://files/etc/ssh/sshd_config.bionic
  {% endif %}
  - user: root
  - group: root
  - mode: 644

sshd:
  service.running:
    - enable: True
    - watch:
      - file: /etc/ssh/sshd_config
    - require:
      - file: /etc/ssh/sshd_config
    - reload: True
