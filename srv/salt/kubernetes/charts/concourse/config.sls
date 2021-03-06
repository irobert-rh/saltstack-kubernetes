/srv/kubernetes/manifests/concourse:
  file.directory:
    - user: root
    - group: root
    - dir_mode: 750
    - makedirs: True

/srv/kubernetes/manifests/concourse/values.yaml:
  file.managed:
    - require:
      - file:  /srv/kubernetes/manifests/concourse
    - source: salt://kubernetes/charts/concourse/templates/values.yaml.j2
    - user: root
    - group: root
    - mode: 755
    - template: jinja

/srv/kubernetes/manifests/concourse/secrets:
  file.directory:
    - require:
      - file: /srv/kubernetes/manifests/concourse
    - user: root
    - group: root
    - dir_mode: 750
    - makedirs: True