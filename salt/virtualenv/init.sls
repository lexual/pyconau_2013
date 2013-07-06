include:
  - gitrepo

virtualenvwrapper:
   pkg:
     - installed

pip-dependencies:
  pkg.installed:
    - pkgs:
      - libpq-dev
      - python-dev

virtualenv-pip-install:
  virtualenv.manage:
    - name: /home/{{ pillar['user'] }}/.virtualenvs/{{ pillar['virtualenv_name'] }}
    - system_site_packages: False
    - runas: {{ pillar['user'] }}
    - requirements: {{ pillar['code_dir'] }}/deploy-requirements.txt
    - require:
      - git: git-clone
      - pkg: pip-dependencies
      - pkg: virtualenvwrapper

local-requirements:
  pip.installed:
    - requirements: {{ pillar['code_dir'] }}/local-requirements.txt
    - bin_env: /home/{{ pillar['user'] }}/.virtualenvs/{{ pillar['virtualenv_name'] }}
    - require:
      - virtualenv: virtualenv-pip-install
