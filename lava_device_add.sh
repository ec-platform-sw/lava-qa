export tag_name=$2
export device_name=$1
export worker_ip=$3
export device_type="b0-edgeq-raptor2"
sudo lava-server manage device-tags create $tag_name  "description :$tag_name"
sudo lava-server manage devices add $device_name --device-type $device_type --worker $worker_ip --tags $tag_name
