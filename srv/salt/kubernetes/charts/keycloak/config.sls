/srv/kubernetes/manifests/keycloak:
  file.directory:
    - user: root
    - group: root
    - dir_mode: 750
    - makedirs: True

/srv/kubernetes/manifests/keycloak/values.yaml:
  file.managed:
    - require:
      - file:  /srv/kubernetes/manifests/keycloak
    - source: salt://kubernetes/charts/keycloak/files/values.yaml
    - user: root
    - group: root
    - mode: 644
