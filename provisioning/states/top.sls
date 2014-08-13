base:
    '*':
        - vim
        - base

    # My laptop
    'nodename:phobos':
        - match: grain
        - desktop
        - laptop

    # My home desktop
    'nodename:kappa':
        - match: grain
        - desktop
