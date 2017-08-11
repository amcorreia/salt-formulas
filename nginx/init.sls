
nginx-extras:
  pkg:
    - installed

nginx-h5bp:
  git.latest:
    - name: https://github.com/h5bp/server-configs-nginx.git
    - target: /etc/nginx-h5bp/
    - user: root

/etc/nginx/nginx.conf:
  file.replace:
    - name: /etc/nginx/nginx.conf
    - pattern: 'logs/access.log main;'
    - repl: /var/log/nginx/access.log main;
    - pattern: 'error_log  logs/error.log warn;'
    - repl: error_log  /var/log/nginx/error.log warn;
    - pattern: 'user www www;'
    - repl: 'user www-data www-data;'

