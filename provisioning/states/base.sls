base:
    pkg.installed:
      - pkgs:
        - {{ pillar['pkgs']['vim'] }}
        - git
        - python
        - sudo
        - the_silver_searcher
        - zsh
