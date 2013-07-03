include:
  - virtualenv

gunicorn-pip:
  pip.installed:
    - name: gunicorn
    - bin_env: /home/{{ pillar['user'] }}/.virtualenvs/{{ pillar['virtualenv_name'] }}
    - require:
      - virtualenv: virtualenv-pip-install

/etc/gunicorn.conf.py:
  file.managed:
    - source: salt://gunicorn/gunicorn.conf.py
    - mode: 644
    - require:
      - pip: gunicorn-pip
