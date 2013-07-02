git:
  pkg:
    - installed


github.com:
  ssh_known_hosts:
    - name: github.com
    - present
    - user: {{ pillar['user'] }}
    - fingerprint: 16:27:ac:a5:76:28:2d:36:63:1b:56:4d:eb:df:a6:48
    #- require:
    #  - user: {{ pillar['user'] }}
    #- require:
    #  - file: ssh_config_dir


code_root_dir:
  file.directory:
    - name: {{ pillar['code_dir'] }}
    - user: {{ pillar['user'] }}
    - group: {{ pillar['user'] }}
    - makedirs: True
    #- require:
    #  - user: {{ pillar['user'] }}

git-clone:
  git.latest:
    - name: https://github.com/django/djangoproject.com.git
    - rev: master
    - target: {{ pillar['code_dir'] }}
    - runas: {{ pillar['user'] }}
    - require:
      - file: code_root_dir
      #- ssh_known_hosts: github.com
      #- file: deploy_key
      - pkg: git
