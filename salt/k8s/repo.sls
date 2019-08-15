kubernetes_repo:
  {% if grains['os'] == 'Ubuntu' %}
  pkgrepo.managed:
  {% if grains['osfinger'] == 'Ubuntu-18.04' %}
    - name: deb http://apt.kubernetes.io/ kubernetes-xenial main
  {% endif %}  
  {% if grains['osfinger'] == 'Ubuntu-16.04' %}
    - name: deb http://apt.kubernetes.io/ kubernetes-xenial main
  {% endif %}
    - file: /etc/apt/sources.list.d/kubernetes.list
    - gpgcheck: 1
    - key_url: https://packages.cloud.google.com/apt/doc/apt-key.gpg
    - refresh: True
  {% endif %}
