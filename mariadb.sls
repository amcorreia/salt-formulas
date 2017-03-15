mariadb-pkgs:
  pkg.installed:
    - pkgs:
      - mariadb-server
      - mariadb-client

/etc/mysql/conf.d/amcorreia.cnf:
  ini.options_present:
  - watch_in:
    - service: mysql
  - sections:
      client:
        # CHARACTER SETS
        default-character-set          : utf8

      mysqld:
        # CHARACTER SETS
        character-set-server           : utf8 
        collation-server               : utf8_general_ci 
        character_set_server           : utf8 
        collation_server               : utf8_general_ci 

        # GENERAL #
        default-storage-engine         : InnoDB
        socket                         : /var/run/mysqld/mysqld.sock
        pid-file                       : /var/run/mysqld/mysqld.pid

        # MyISAM #
        key-buffer-size                : 32M
        myisam-recover                 : FORCE,BACKUP

        # SAFETY #
        max-allowed-packet             : 16M
        max-connect-errors             : 1000000
        skip-name-resolve              : 1
        # sql-mode                       : STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_AUTO_VALUE_ON_ZERO,NO_ENGINE_SUBSTITUTION,NO_ZERO_DATE,NO_ZERO_IN_DATE,ONLY_FULL_GROUP_BY
        sysdate-is-now                 : 1
        innodb                         : FORCE
        
        # BINARY LOGGING #
        # log-bin                        : /var/lib/mysql/mysql-bin
        # expire-logs-days               : 10
        # sync-binlog                    : 1

        # CACHES AND LIMITS #
        # When making adjustments, make tmp_table_size/max_heap_table_size equal
        tmp-table-size                 : 32M
        max-heap-table-size            : 32M
        query-cache-type               : 0
        query-cache-size               : 0
        max-connections                : 500
        thread-cache-size              : 50
        open-files-limit               : 65535
        table-definition-cache         : 1024
        table-open-cache               : 2048

        # INNODB #
        innodb-flush-method            : O_DIRECT
        innodb-log-files-in-group      : 2
        innodb-log-file-size           : 512M
        innodb-flush-log-at-trx-commit : 1
        innodb-file-per-table          : 1
        innodb-buffer-pool-size        : 4G
        innodb-buffer-pool-instances   : 4

        # LOGGING #
        log-error                      : /var/log/mysql/mysql-error.log
        log-queries-not-using-indexes  : 1
        long-query-time                : 3
        slow-query-log                 : 1
        slow-query-log-file            : /var/log/mysql/mysql-slow.log

mysql:
  service:
    - running
    - enable: True
    - restart: True

#max_allowed_packet=32M
#sort_buffer_size=4M
#max_connections=300
#connect_timeout=10
#read_buffer_size=4M
#interactive_timeout=100
#read_rnd_buffer_size=4M
#table_cache=4096
#join_buffer=2M
#local-infile=0
#query_cache_limit=3M
#thread_cache_size=256
#max_connect_errors=10
#thread_concurrency=24
#skip-external-locking
#key_buffer=256M
#tmp_table_size=256M
#max_heap_table_size=256M
#thread_stack=128K
#wait_timeout=500
#slow_query_log_file=/var/lib/mysql/slow_query.log
