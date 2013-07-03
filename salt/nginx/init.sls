nginx:
  pkg:
    - installed
  service.running:
    - watch:
      - file: /etc/nginx/conf.d/proxy.conf
      - file: nginx_site_conf
    - require:
      - pkg: nginx


/etc/nginx/conf.d/proxy.conf:
  file.managed:
    - source: salt://nginx/proxy.conf
    - require:
      - pkg: nginx

nginx_site_conf:
  file.managed:
    - name: /etc/nginx/sites-enabled/{{ pillar['site_url'] }}.conf
    - source: salt://nginx/site.com.conf
    - template: jinja
    - context:
      site_url: {{ pillar['site_url'] }}
      virtualenv_name: {{ pillar['virtualenv_name'] }}
      django_dir: {{ pillar['django_dir'] }}
      username: {{ pillar['user'] }}
    - require:
      - pkg: nginx
