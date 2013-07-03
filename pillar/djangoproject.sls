{% if grains['is_dev'] %}
user: vagrant
username: vagrant
{% else %}
user: ubuntu
username: ubuntu
{% endif %}
code_dir: /srv/www/djangoproject.com
django_dir: /srv/www/djangoproject.com
site_url: dj_docs.lexual.com
virtualenv_name: djangoproject
supervisor_apps:
  - gunicorn
  #- celery
