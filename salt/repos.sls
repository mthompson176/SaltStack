/etc/apt/sources.list:
  file.managed:
  {% if grains['osfinger'] == 'Ubuntu-16.04' %}
  - source: salt://files/etc/apt/sources.list.xenial
  {% endif %}
  {% if grains['osfinger'] == 'Ubuntu-18.04' %}
  - source: salt://files/etc/apt/sources.list.bionic
  {% endif %}
  - user: root
  - group: root
  - mode: 644
