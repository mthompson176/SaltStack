/tmp/growfs.sh:
  cmd.run:
    - onchanges:
      - file: /tmp/growfs.sh
  file.managed:
    - source: salt://files/tmp/growfs.sh
    - mode: 755
