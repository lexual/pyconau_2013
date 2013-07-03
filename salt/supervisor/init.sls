include:
  - gunicorn
  #- local_settings


{% for app in pillar['supervisor_apps'] %}
/etc/supervisor/conf.d/supervisord.{{ app }}.conf:
  file.managed:
    - source: salt://supervisor/supervisord.{{ app }}.conf
    - mode: 644
    - template: jinja
    - makedirs: True
    - context:
      virtualenv_name: {{ pillar['virtualenv_name'] }}
      code_dir: {{ pillar['code_dir'] }}
      django_dir: {{ pillar['django_dir'] }}
      username: {{ pillar['user'] }}
    - require_in:
      - pkg: supervisor
{% if app == 'gunicorn' %}
    - require:
      - file: /etc/gunicorn.conf.py
{% endif %}

{{ app }}:
  supervisord.running:
    - restart: False
    - require:
      - pkg: supervisor
    - watch:
      - file: /etc/supervisor/conf.d/supervisord.{{ app }}.conf
{% endfor %}

supervisor:
  pkg.installed:
    - require:
      #- file: local_settings.py
      - file: /etc/gunicorn.conf.py
      - virtualenv: virtualenv-pip-install
      - git: git-clone
