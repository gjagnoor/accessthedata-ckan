container = accessthedatacontainer
app = accessthedata-ckan-1 
# || 
PORT = 3000

dev: 
	- docker-compose -f docker-compose.yml -f docker-compose.dev.yml up --build -d

prod: 
	- docker-compose -f docker-compose.yml -f docker-compose.prod.yml up -d --build

kill-container: 
	- docker rm ${container} -fv

list-containers: 
	- docker ps -a

explore-image:
	- docker exec -it ${app} bash

container-logs:
	- docker logs ${app}
