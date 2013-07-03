base:
  '*':
    - common
    - postgresql
    - gitrepo
    - virtualenv
    - secrets
    - nginx
    - gunicorn
    - supervisor
  #'role:django_website':
  #  - match: grain
  #  - common
