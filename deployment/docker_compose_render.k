import manifests

import .deployment

# Convert the `App` model into the docker compose config.

# Process multiple app instances and output them as docker config
manifests.yaml_stream(deployment.dockerCompose)
# manifests.yaml_stream(sum([dockerComposeRender(a) for a in app.App.instances()], []),{sep:"---"})