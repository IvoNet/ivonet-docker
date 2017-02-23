# Wait for service agent

Is an Ansible playbook that polls a service for aliveness

Docker does not wait for services to start and sometimes there is a 
dependency between instances. With this ansible docker image you
have the means to ensure that all is done in order.

It's a workaround for making docker work when a service is slow to start

Right now there is a long running issue on [github](https://github.com/docker/compose/issues/374) discussing this issue


## Build

```bash
docker build -t ivonet/waif-for-service-agent .
```

## Example docker-compose.yml file

```yml
version: '2'

services:
  db: 
    image: mysql:5.6
    hostname: db
    ports:
      - "3306:3306"
    environment:
      MYSQL_ROOT_PASSWORD: password
      
  wait-for-service-agent:
    image: ivonet/wait-for-service-agent
    links:
      - db
    environment:
      PROBE_HOST: "db"
      PROBE_PORT: "3306"
    command: ["probe.yml"]
```

this docker compose file will poll the db service on port 3306 
until it is alive or its timeout param has been reached.