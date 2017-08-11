
docker-repo:
    pkgrepo.managed:
      - repo: deb [arch=amd64] https://download.docker.com/linux/debian jessie stable
      - dist: jessie
      - file: /etc/apt/sources.list.d/docker.list
      - key_url: http://download.docker.com/linux/debian/gpg
      - keyid: 0EBFCD88
      - keyserver: ha.pool.sks-keyservers.net
      - gpgcheck: 1
#      - require_in:
#          - pkg: docker-ce


docker-dependencies:
   pkg.installed:
    - pkgs:
      - python-software-properties
      - apt-transport-https
      - ca-certificates

docker-ce:
  pkg.latest:
    - require:
      #- repo: docker-repo
      - pkg: docker-dependencies

docker:
  service.running:
    - require:
      - pkg: docker-ce

