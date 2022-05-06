#/bin/bash
docker-compose build app
docker-compose up -d
docker-compose exec app bash
docker ps -a
