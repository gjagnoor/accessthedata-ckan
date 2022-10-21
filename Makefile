container = accessthedatacontainer
app = accessthedata
PORT = 8000

dev: 
	- docker-compose -f docker-compose.yml -f docker-compose.dev.yml up -d --build

prod: 
	- docker-compose -f docker-compose.yml -f docker-compose.prod.yml up -d --build

kill-container: 
	- docker rm ${container} -fv

list-containers: 
	- docker ps -a

explore-image:
	- docker exec -it ${container} bash

container-logs:
	- docker logs ${app}