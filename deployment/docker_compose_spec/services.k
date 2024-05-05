# https://github.com/compose-spec/compose-spec/blob/master/05-services.md
import regex

schema ServiceTopLevel:
    command?: [str]
    configs?: [Config]
    container_name?: str
    depends_on?: [str]
    environment?: {str:str}
    image: str
    networks?: [Network]
    platform?: str
    ports?: [Port]
    profiles?: [Profile]
    pull_policy: "allways" | "never" | "if_not_present" | "build" = "if_not_present"
    restart: "no" | "always" | "on-failure" | "unless-stopped" = "no"
    volumes?: [Volume]


schema Port:
    """The container port"""
    target?: int | str
    """The publicly exposed port.
    It is defined as a string and can be set as a range using syntax start-end.
    It means the actual port is assigned a remaining available port, within the set range."""
    published?: int | str
    """The Host IP mapping, unspecified means all network interfaces (0.0.0.0)."""
    host_ip?: str
    protocol: "tcp" | "udp" | "sctp" = "tcp"
    mode?: "host" | "ingress" = "ingress"
    name?: str

schema Profile:
    profile: str

    check:
        regex.match(profile, "[a-zA-Z0-9][a-zA-Z0-9_.-]+")

schema Config:
    source?: str
    target?: str
    uid?: str
    gid?: str
    mode?: int

schema Volume:
    type: "volume" | "bind" | "tmpfs" | "npipe" | "cluster" = "volume"
    """he source of the mount, a path on the host for a bind mount, or the name of a volume defined in the Volume_top_level"""
    source?: str
    """The path in the container where the volume is mounted."""
    target?: str
    read_only?: bool
    bind?: Bind
    volume?: Volume_in
    tmpfs?: Tmpfs
    consistency?: str

schema Bind:
    propagation?: str
    create_host_path?: str
    selinux: "z" | "Z"

schema Volume_in:
    nocopy?: str
    subpath?: str

schema Tmpfs:
    size?: str
    mode?: str

schema Network:
    aliases?: [str]

