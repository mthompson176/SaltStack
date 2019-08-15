wazuh_package:
{% if grains['id'] != 'tf-wazuh-101' %}
  pkg.installed:
    - pkgs:
      - wazuh-agent
    - hold: True
  require:
    - pkgrepo: wazuh.wazuh_repo
{% else %}
  cmd.run:
    - name: echo "Nothing to Run here."

{% endif %}

wazuh-agent:
{% if grains['id'] != 'tf-wazuh-101' %}
  service.running:
    - enable: True
    - watch:
      - file: /var/ossec/etc/ossec.conf
    - require:
      - cmd: wazuh_agent_init
{% else %}
  cmd.run:
    - name: echo "Nothing to Run here."

{% endif %}
  
/var/ossec/etc/ossec.conf:
{% if grains['id'] != 'tf-wazuh-101' %}
  file.managed:
    - source: salt://wazuh/files/var/ossec/etc/ossec.conf.jinja
    - user: root
    - group: ossec
    - mode: 640
    - require:
      - pkg: wazuh_package
{% else %}
  cmd.run:
    - name: echo "Nothing to Run here."

{% endif %}

wazuh_agent_init:
{% if grains['id'] != 'tf-wazuh-101' %}
  cmd.run:
    - name: /var/ossec/bin/agent-auth -m tf-wazuh-101.theforce.lan
    - unless:
      - test -s /var/ossec/etc/client.keys
{% else %}
  cmd.run:
    - name: echo "Nothing to Run here."

{% endif %}
