import docker_compose_spec.configs
import docker_compose_spec.networks
import docker_compose_spec.services
import docker_compose_spec.volumes

schema Compose:
    services: {str:services.ServiceTopLevel}
    volumes?: {str:volumes.VolumeTopLevel}
    networks?: {str:networks.NetworkTopevel}
    configs?: {str:configs.ConfigTopLevel}

