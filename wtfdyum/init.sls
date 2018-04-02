{% from 'wtfdyum/map.jinja' import wtfdyum with context %}

wtfdyum.dependencies:
  pkg.installed:
    - pkgs:
      - redis-server
      - openjdk-8-jre
      - supervisor
  file.symlink:
    - name: /usr/bin/java
    - target: /usr/lib/jvm/java-8-openjdk-amd64/jre/bin/java
    - user: root
    - group: root
    - mode: 775

{{ wtfdyum.path }}/wtfdyum-{{ wtfdyum.version }}.zip:
  file.managed:
    - source: https://bintray.com/artifact/download/jchampemont/wtfdyum/wtfdyum-{{ wtfdyum.version }}.zip
    - source_hash: https://bintray.com/artifact/download/jchampemont/wtfdyum/wtfdyum-{{ wtfdyum.version }}.zip.md5
    - user: {{ wtfdyum.user }}
    - group: {{ wtfdyum.user }}
    - mode: 644
    - makedirs: True
  archive.extracted:
    - name: {{ wtfdyum.path }}/
    - source: {{ wtfdyum.path }}/wtfdyum-{{ wtfdyum.version }}.zip
    - user: {{ wtfdyum.user }}
    - group: {{ wtfdyum.user }}
    - overwrite: True
    - watch:
      - file: {{ wtfdyum.path }}/wtfdyum-{{ wtfdyum.version }}.zip

{{ wtfdyum.path }}/wtfdyum-{{ wtfdyum.version }}/startup.sh:
  file.managed:
    - source: salt://wtfdyum/files/startup.sh
    - user: {{ wtfdyum.user }}
    - group: {{ wtfdyum.user }}
    - mode: 744
    - template: jinja
    - context:
        wtfdyum: {{ wtfdyum }}

/etc/supervisor/conf.d/wtfdyum.conf:
  file.managed:
    - source: salt://wtfdyum/files/wtfdyum.conf
    - user: root
    - group: root
    - mode: 644
    - template: jinja
    - context:
        wtfdyum: {{ wtfdyum }}

  supervisord.running:
    - name: wtfdyum
    - restart: True
    - update: True
    - user: root
    - watch:
      - file: /etc/supervisor/conf.d/wtfdyum.conf
      - file: {{ wtfdyum.path }}/wtfdyum-{{ wtfdyum.version }}.zip
      - archive: {{ wtfdyum.path }}/wtfdyum-{{ wtfdyum.version }}.zip
      - file: {{ wtfdyum.path }}/wtfdyum-{{ wtfdyum.version }}/startup.sh