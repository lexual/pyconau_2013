postgresql:
  pkg.installed:
    - name: postgresql-9.1
  service.running:
    - enabled: True


{% for db in ['vagrant', 'djangoproject', 'code.djangoproject'] %}
{{ db }}:
    postgres_user.present:
        - password: {{ db }}
        - runas: postgres
        - require:
            - service: postgresql
    postgres_database.present:
        - encoding: UTF8
        - lc_ctype: en_US.UTF8
        - lc_collate: en_US.UTF8
        - template: template0
        - owner: {{ db }}
        - runas: postgres
        - require:
            - postgres_user: {{ db }}
{% endfor %}
