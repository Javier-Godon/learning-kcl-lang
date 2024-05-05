import manifests

import .base.deployment
import .docker_compose_spec.compose

# Convert the `App` model into the docker compose config.
 
dockerComposeRender = lambda a: deployment.dockerCompose{
[a]

}

# Process multiple app instances and output them as docker config

# manifests.yaml_stream([deployment.dockerCompose.instances()])

manifests.yaml_stream(sum([dockerComposeRender(a) for a in compose.Compose.instances()], []),{sep:"---"})