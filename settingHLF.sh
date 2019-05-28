#	 Everything Written by MSkim ( brady ) 
#	 This File would be making the cli 
#
#

# Exit on first error 
set -e 
export MSYS_NO_PATHCONV=1
starttime=$(date +%s)
CC_SRC_LANGUAGE=${1:-"javascript"}
CC_SRC_LANGUAGE=`echo "$CC_SRC_LANGUAGE" | tr [:upper:] [:lower:]`


CC_RUNTIME_LANGUAGE=node # chaincode runtime language is node.js only 
CC_SRC_PATH=/opt/gopath/src/github.com/vote_/javascript

echo The chaincode language ${CC_SRC_LANGUAGE} is the only way.

function clearContainers(){
	CONTAINER_IDS=$(docker ps -qa)
	if [ -z "$CONTAINER_IDS" -o "$CONTAINER_IDS" == " " ]; then
		echo "---- No Containers Available for deletion ----"
	else 
		docker rm -f $CONTAINER_IDS
	fi
}

# clean the keystore
rm -rf ./hfc-key-store

docker-compose -f docker-compose.yml up -d ca.example.com orderer.example.com peer0.



