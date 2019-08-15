elk_repo:
  {% if grains['os'] == 'Ubuntu' %}
  pkgrepo.managed:
    - name: deb https://artifacts.elastic.co/packages/6.x/apt stable main
    - file: /etc/apt/sources.list.d/elastic.list
    - gpgcheck: 1
    - key_url: https://artifacts.elastic.co/GPG-KEY-elasticsearch
    - refresh: True
  {% endif %}
