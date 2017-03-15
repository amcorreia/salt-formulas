
php-pkgs:
  pkg.installed:
    - pkgs:
        - php5-fpm
        - php5-mysqlnd

/etc/php5/fpm/pool.d/www.conf:
  file.absent:
    - name: /etc/php5/fpm/pool.d/www.conf

/etc/php5/fpm/php.ini:
  ini.options_present:
    - watch_in:
      - service: php5-fpm
    - sections:
        PHP:
          display_errors : 'Off'
          error_reporting : 'E_ERROR'
          max_execution_time : 180
        Session:
          session.save_handler : '"memcached"'
          session.save_path : '"127.0.0.1:11211"'

/etc/php5/fpm/conf.d/05-opcache.ini:
  ini.options_present:
    - watch_in:
      - service: php5-fpm
    - sections:
        opcache:
          opcache.enable : 1
          opcache.memory_consumption : 256
          opcache.interned_strings_buffer : 16
          opcache.max_accelerated_files : 7963
          opcache.revalidate_freq : 60
          #opcache.save_comments : 0
          #opcache.load_comments : 0
          opcache.fast_shutdown : 1
          opcache.enable_cli : 1 

/etc/php5/fpm/pool.d/site-example.conf:
  file.managed:
    - source: salt://php/site-example.conf
    - user: root
    - group: root
    - mode: 644

php5-fpm:
  service:
    - running
    - enable: True
    - restart: True
