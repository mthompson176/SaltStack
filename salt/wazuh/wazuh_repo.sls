wazuh_repo:
  {% if grains['os'] == 'Ubuntu' %}
  pkgrepo.managed:
    - name: deb https://packages.wazuh.com/3.x/apt/ stable main
    - file: /etc/apt/sources.list.d/wazuh.list
    - gpgcheck: 1
    - key_url: https://packages.wazuh.com/key/GPG-KEY-WAZUH
    - refresh: True
  {% endif %}
