export board_name=$1
export tag_no=$2
export web_pdu=$3
working_dir=$(pwd)
cd /lab-nfs/scratch/Thamizh/lava_regression/board_setup
mkdir -p ${board_name}_${tag_no}
sed \
-e 's?/lab-nfs/koti/lava-apc/power\(.*\)_51.sh?/lab-nfs/koti/lava-apc/power\1'_$tag_no'.sh?' \
-e 's?/lab-nfs/koti/lava-apc/flash\(.*\)_51.sh?/lab-nfs/koti/lava-apc/flash\1'_$tag_no'.sh?' \
-e 's?/lab-nfs/koti/lava-apc/boot\(.*\)_51.sh?/lab-nfs/koti/lava-apc/boot\1'_$tag_no'.sh?' \
/lab-nfs/scratch/Thamizh/lava_regression/template/jinja_template >> /lab-nfs/scratch/Thamizh/lava_regression/board_setup/${board_name}_{tag_no}/b0-$board_name-$tag_no.jinja2
cp /lab-nfs/scratch/Thamizh/lava_regression/template/flash_b0_hawk_template.sh /lab-nfs/scratch/Thamizh/lava_regression/board_setup/${board_name}_${tag_no}/flash_b0_${board_name}_${tag_no}.sh               
cp /lab-nfs/scratch/Thamizh/lava_regression/template/power_off_b0_hawk_template.sh /lab-nfs/scratch/Thamizh/lava_regression/board_setup/${board_name}_${tag_no}/power_off_b0_${board_name}_${tag_no}.sh
cp /lab-nfs/scratch/Thamizh/lava_regression/template/power_off_on_b0_hawk_template.sh /lab-nfs/scratch/Thamizh/lava_regression/board_setup/${board_name}_${tag_no}/power_off_on_b0_${board_name}_${tag_no}.sh 
cp /lab-nfs/scratch/Thamizh/lava_regression/template/power_on_b0_hawk_template.sh /lab-nfs/scratch/Thamizh/lava_regression/board_setup/${board_name}_${tag_no}/power_on_b0_${board_name}_${tag_no}.sh  
cp /lab-nfs/scratch/Thamizh/lava_regression/template/bootns_b0_hawk_template.sh /lab-nfs/scratch/Thamizh/lava_regression/board_setup/${board_name}_${tag_no}/bootns_b0_${board_name}_${tag_no}.sh  
cp /lab-nfs/scratch/Thamizh/lava_regression/template/boots_b0_hawk_template.sh /lab-nfs/scratch/Thamizh/lava_regression/board_setup/${board_name}_${tag_no}/boots_b0_${board_name}_${tag_no}.sh  
sed -i 's/192.168.3.247/'$web_pdu'/' /lab-nfs/scratch/Thamizh/lava_regression/board_setup/${board_name}_${tag_no}/power_off_b0_${board_name}_${tag_no}.sh
sed -i 's/power_on_b0_hawk_51.sh/power_on_b0_'$board_name'_'$tag_no'.sh/' /lab-nfs/scratch/Thamizh/lava_regression/board_setup/${board_name}_${tag_no}/power_off_on_b0_${board_name}_${tag_no}.sh
sed -i 's/power_off_b0_hawk_51.sh/power_off_b0_'$board_name'_'$tag_no'.sh/' /lab-nfs/scratch/Thamizh/lava_regression/board_setup/${board_name}_${tag_no}/power_off_on_b0_${board_name}_${tag_no}.sh

// relative path
// need to scp koti ( destination=)
// web pdu & power off and power on as arg , tag name ,board name   
//sed 's?/lab-nfs/koti/lava-apc/power\(.*\)_51.sh?/lab-nfs/koti/lava-apc/power\1'_$tag_no'.sh?;s?/lab-nfs/koti/lava-apc/flash\(.*\)_51.sh?/lab-nfs/koti/lava-apc/flash\1'_$tag_no'.sh?;s?/lab-nfs/koti/lava-apc/boot\(.*\)_51.sh?/lab-nfs/koti/lava-apc/boot\1'_$tag_no'.sh?'/lab-nfs/scratch/Thamizh/lava_regression/template/jinja_template >> /lab-nfs/scratch/Thamizh/lava_regression/board_setup/${board_name}_{tag_no}/b0-$board_name-$tag_no.jinja2
