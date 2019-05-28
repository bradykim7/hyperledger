set -ev

# I don't know this codes meaning but it said that "Don't rewrite paths for Window Git Bash Users
export MSYS_NO_PATHCONV=1

# remove all of things on docker(containers, networks, images and volumes)
# docker-compose -f docker-compose.yml down

docker-compose -f docker-comopse-ca.yml up -d ca.example.com
docker-compose -f docker-compose.yml up -d orderer.example.com
docker-compose -f docker-compose.yml up -d peer0.org1.example.com 
docker-compose -f docker-compose.yml up -d couchdb

docker ps -a

# Waiting time for HLF to start

export FABRIC_START_TIMEOUT=15
sleep ${FABRIC_START_TIMEOUT}


