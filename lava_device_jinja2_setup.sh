#### copy /lab-nfs-02/scratch/Thamizh/lava_regression entire folder into your working area
#### go to lava_regression folder
### then launch the script eg:  source lava_device_jinja2_setup.sh board_name (hwak/titan/wnc) tag_no(like 51) web_pdu (192.168.3.247) port_no (8)
### ex command : source lava_device_jinja2_setup.sh hawk 41 192.168.3.247 8
## corresponding files are generated in lava_regression/board_setup/*  and copied to koti's area also


current_dir=`pwd`
export board_name=$1
export tag_no=$2
export web_pdu=$3 
export port_no=$4 
cd ${current_dir}/board_setup
mkdir -p ${board_name}_${tag_no}
sed \
-e 's?/lab-nfs/koti/lava-apc/power\(.*\)_51.sh?/lab-nfs/koti/lava-apc/power\1'_$tag_no'.sh?' \
-e 's?/lab-nfs/koti/lava-apc/flash\(.*\)_51.sh?/lab-nfs/koti/lava-apc/flash\1'_$tag_no'.sh?' \
-e 's?/lab-nfs/koti/lava-apc/boot\(.*\)_51.sh?/lab-nfs/koti/lava-apc/boot\1'_$tag_no'.sh?' \
${current_dir}/template/jinja_template >> ${current_dir}/board_setup/${board_name}_${tag_no}/b0-$board_name-$tag_no.jinja2
cp ${current_dir}/template/flash_b0_hawk_template.sh ${current_dir}/board_setup/${board_name}_${tag_no}/flash_b0_${board_name}_${tag_no}.sh               
cp ${current_dir}/template/power_off_b0_hawk_template.sh ${current_dir}/board_setup/${board_name}_${tag_no}/power_off_b0_${board_name}_${tag_no}.sh
cp ${current_dir}/template/power_off_on_b0_hawk_template.sh ${current_dir}/board_setup/${board_name}_${tag_no}/power_off_on_b0_${board_name}_${tag_no}.sh 
cp ${current_dir}/template/power_on_b0_hawk_template.sh ${current_dir}/board_setup/${board_name}_${tag_no}/power_on_b0_${board_name}_${tag_no}.sh  
cp ${current_dir}/template/bootns_b0_hawk_template.sh ${current_dir}/board_setup/${board_name}_${tag_no}/bootns_b0_${board_name}_${tag_no}.sh  
cp ${current_dir}/template/boots_b0_hawk_template.sh ${current_dir}/board_setup/${board_name}_${tag_no}/boots_b0_${board_name}_${tag_no}.sh
sed -i 's/192.168.3.247/'$web_pdu'/; s/olDlyOff 8/olDlyOff '$port_no'/' ${current_dir}/board_setup/${board_name}_${tag_no}/power_off_b0_${board_name}_${tag_no}.sh
sed -i 's/power_on_b0_hawk_51.sh/power_on_b0_'$board_name'_'$tag_no'.sh/' ${current_dir}/board_setup/${board_name}_${tag_no}/power_off_on_b0_${board_name}_${tag_no}.sh
sed -i 's/power_off_b0_hawk_51.sh/power_off_b0_'$board_name'_'$tag_no'.sh/' ${current_dir}/board_setup/${board_name}_${tag_no}/power_off_on_b0_${board_name}_${tag_no}.sh
cp ${current_dir}/board_setup/${board_name}_${tag_no}/* /lab-nfs/koti/lava-apc/
scp ${current_dir}/board_setup/${board_name}_${tag_no}/b0-$board_name-$tag_no.jinja2 equser@192.168.3.198:/etc/lava-server/dispatcher-config/devices/
cd ../

#// web pdu & power off and power on as arg , tag name ,board name   
#//sed 's?/lab-nfs/koti/lava-apc/power\(.*\)_51.sh?/lab-nfs/koti/lava-apc/power\1'_$tag_no'.sh?;s?/lab-nfs/koti/lava-apc/flash\(.*\)_51.sh?/lab-nfs/koti/lava-apc/flash\1'_$tag_no'.sh?;s?/lab-nfs/koti/lava-apc/boot\(.*\)_51.sh?/lab-nfs/koti/lava-apc/boot\1'_$tag_no'.sh?'/lab-nfs/scratch/Thamizh/lava_regression/template/jinja_template >> /lab-nfs/scratch/Thamizh/lava_regression/board_setup/${board_name}_{tag_no}/b0-$board_name-$tag_no.jinja2
