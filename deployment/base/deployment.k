import docker_compose_spec.compose
import docker_compose_spec.services
import docker_compose_spec.volumes

dockerCompose: compose.Compose {
    services: {
        "postgres": services.ServiceTopLevel {
            image: "postgres:16.2"
            volumes: [{
                source = "./postgres"
                target = "/var/lib/postgresql/data"
            }]
            ports: [services.Port {
                target = 5432
                published = 5432
            }]
            environment: {
                "POSTGRES_USER": "postgres"
                "POSTGRES_PASSWORD": "postgres"
                "POSTGRES_DB": "postgres"
                "POSTGRES_HOST": "postgres"
            }
        }

        "hazelcast": services.ServiceTopLevel {
            image: "hazelcast/hazelcast@sha256:bc0830a073cc024ad47aae79d173e22a48e8824934b05fe611b98076142d9255"
            volumes: [{
                source = "./hazelcast"
                target = "/opt/hazelcast/CLASSPATH_EXT"
            }]
            ports: [services.Port {
                target = 5701
                published = 5701
            }]
            environment: {
                "HZ_CLUSTERNAME": "dob"
            }
        }
        
    }
    volumes: {
        "postgres": volumes.VolumeTopLevel {
            name: "postgres"
        }
        "hazelcast": volumes.VolumeTopLevel {
            name: "hazelcast"
        }
    }
}
