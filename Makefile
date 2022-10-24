container = accessthedatacontainer
app = accessthedata-ckan-1 
# || 
PORT = 5000

binn: 
	- docker-compose -f docker-compose.dev.yml run --rm ckan bash
dev: 
	- docker-compose down -v
	- docker-compose -f docker-compose.yml -f docker-compose.dev.yml up -d

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

portlist:
	- sudo lsof -i :80

container: 
	- docker-compose -f docker-compose.dev.yml run --rm ckan bash
