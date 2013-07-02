secrets.json:
  file.managed:
    - name: /srv/www/secrets.json
    - source: salt://secrets/secrets.json
