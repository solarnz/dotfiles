desktop:
    pkg.installed:
      - pkgs:
          - conky
          - i3lock
          - ifplugd
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
  pkg.installed:
      - pkgs:
        - lightdm
        - lightdm-gtk2-greeter

  service:
    - running
    - enable: True

ntpd:
  pkg.installed:
    - pkgs:
      - ntp

  service:
    - running
    - enable: True

docker:
  pkg:
    - installed

  service:
    - running
    - enable: True
