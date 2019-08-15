unattended-upgrades:
  pkg.installed: []
  service.running:
    - enable: True
    - watch:
      - file: /etc/apt/apt.conf.d/50unattended-upgrades
    - require:
      - pkg: unattended-upgrades

/etc/apt/apt.conf.d/20auto-upgrades:
  file.absent

/etc/apt/apt.conf.d/10periodic:
  file.managed:
    - source: salt://files/etc/apt/apt.conf.d/10periodic
    - user: root
    - group: root
    - mode: 644

/etc/apt/apt.conf.d/50unattended-upgrades:
  file.managed:
    - source: salt://files/etc/apt/apt.conf.d/50unattended-upgrades
    - user: root
    - group: root
    - mode: 644
    - require:
      - pkg: unattended-upgrades
