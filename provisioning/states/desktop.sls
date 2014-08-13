desktop:
    pkg.latest:
      - pkgs:
          - conky
          - docker
          - i3lock
          - kdebase-konsole
          - keychain
          - mpc
          - mpd
          - mpv
          - ncmpcpp
          - nginx
          - openssh
          - openvpn
          - redshift
          - scrot
          - xautolock
          - xclip
          - xfce4-clipman-plugin
          - xorg-xrdb

sddm:
  pkg:
    - purged

  service:
    - dead
    - enable: False

lightdm:
  pkg.latest:
      - pkgs:
        - lightdm
        - lightdm-gtk2-greeter

  service:
    - running
    - enable: True
