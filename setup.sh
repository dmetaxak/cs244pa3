THIS_SCRIPT=$(cd "$(dirname "${BASH_SOURCE}")" ; pwd -P)
export SPROUT_MODEL_IN="$THIS_SCRIPT/alfalfa/src/examples/sprout.model"
echo $SPROUT_MODEL_IN
export SPROUT_BT2="$THIS_SCRIPT/alfalfa/src/examples/sproutbt2"
export SPROUT_RELAY="$THIS_SCRIPT/alfalfa/src/examples/sprout-relay.sh"
export SPROUT_CLIENT="$THIS_SCRIPT/alfalfa/src/examples/sprout-client.sh"
echo $SPROUT_BT2
export SERVER="$THIS_SCRIPT/sourdough/examples/tcpserver"
export CLIENT="$THIS_SCRIPT/sourdough/examples/tcpclient"

