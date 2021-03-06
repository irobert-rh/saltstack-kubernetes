/etc/kubernetes/pki:
  file.directory:
    - user: root
    - group: root
    - dir_mode: 750
    - makedirs: true

/etc/kubernetes/pki/encryption-config.yaml:
  file.managed:
    - require:
      - file: /etc/kubernetes/pki
    - user: root
    - group: root
    - dir_mode: 644
    - source: salt://kubernetes/role/master/kubeadm/templates/encryption-config.yaml.j2
    - template: jinja