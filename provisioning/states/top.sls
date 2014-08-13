base:
    '*':
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

    # My work desktop
    'nodename:chris-trotman':
        - match: grain
        - desktop
