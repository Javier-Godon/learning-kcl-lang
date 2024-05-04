schema NetworkTopevel:
    driver: str = 'bridge'
    attachable?: bool
    external?: bool
    internal?: bool
    name?: str 