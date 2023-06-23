#/bin/bash
# bash script that edits ./dockerfiles/jenkins.yaml file and paste $GITPOD_WORKSPACE_URL in the place of "http://127.0.0.1:8080/" in yaml file 
config_file="$GITPOD_REPO_ROOT/experimental_docker_compose_files/02_custom_docker_file_connecting_agent_and_controller/dockerfiles/jenkins.yaml"
service_url=$(echo $GITPOD_WORKSPACE_URL | awk -F/ '{print $3}')
echo $service_url
yq eval ".unclassified.location.url = \"https://8080-$service_url/\"" "$config_file" > "$config_file.tmp" && mv "$config_file.tmp" "$config_file"
