## Docker Commands

| Command | Description |
|--------|-------------|
| `docker search ubuntu -f stars=100 -f is-official=true --no-trunc` | Search Ubuntu images with 100+ stars, official, full description |
| `docker images` | List images installed in local system |
| `docker build .` | Build an image using Dockerfile in current directory |
| `docker build -f /path/Dockerfile -t myrepo:1 -q .` | `-f` specify Dockerfile path; `-t` set repo:tag; `-q` quiet mode |
| `docker tag 145bc68e9cb4 maze/atag:0.1` | Assign repository:tag to an image ID |
| `docker rmi 145bc68e9cb4 1a9affda8c8b` | Remove images by ID (not used by running containers) |
| `docker ps` | List running containers |
| `docker ps -a` | List all containers (running + exited) |
| `docker run --name app1 -p 3000:8080 -d -it --rm myapp:1 echo "hello world"` | Run container with name, port mapping, detached, interactive, auto-remove |
| `docker stop f35df7c41040 f4609f56b123` | Stop containers by ID |
| `docker stop $(docker ps -q)` | Stop all running containers |
| `docker rm 0c6942c491bc 18a7e2c7e380` | Remove stopped containers |
| `docker run --rm -it $(docker build -q .)` | Build, run, and remove container in one line |


## Docker Hub Commands

| Command | Description |
|--------|-------------|
| `docker login` | Log in to Docker Hub |
| `docker logout` | Log out from Docker Hub |
| `docker pull frolvlad/alpine-gcc`<br>`docker pull omarekik/maze:1.0.0` | Pull images from Docker Hub |
| `docker build . -t omarekik/maze:1.0.0`<br>`docker tag 15d94ab30478 omarekik/maze:1.0.0`<br>`docker push omarekik/maze:1.0.0` | Build, tag, and push image to Docker Hub |


## Dockerfile Instructions

| Instruction | Description |
|------------|-------------|
| `FROM image` | Base image to start with |
| `COPY path1 path2` | Create path2 if missing and copy content of path1 |
| `WORKDIR path` | Set working directory for following commands |
| `RUN cmd` | Execute a command during build |
| `ARG` | Define a build-time argument |
| `CMD ["./script.sh"]` | Default command to run when container starts |


## Troubleshooting

| Issue | Solution |
|-------|----------|
| Permission denied when connecting to Docker daemon | `sudo groupadd docker`<br>`sudo usermod -aG docker $USER`<br>`newgrp docker` |

