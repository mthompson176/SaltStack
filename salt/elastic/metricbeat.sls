metricbeat_package:
  pkg.installed:
    - pkgs:
      - metricbeat
    - refresh: True
    - hold: True
  require:
    - pkgrepo: elastic.elk_repo

metricbeat:
  service.running:
    - enable: True
    - watch:
      - pkg: metricbeat_package
      - file: /etc/metricbeat/metricbeat.yml

/etc/metricbeat/metricbeat.yml:
  file.managed:
  {% if grains['id'].startswith('tf-nas') %}
    - source: salt://elastic/files/etc/metricbeat/metricbeat.yml.nas.jinja
  {% else %}
    - source: salt://elastic/files/etc/metricbeat/metricbeat.yml.jinja
  {% endif %}
    - user: root
    - group: root
    - mode: 640
    - require:
      - pkg: metricbeat_package
