#!/bin/bash
default='/files/php/newwcjs/'
code=$default'code/'

#扫描code目录，裁减过滤重复测试机，s1~s8,t1,qa
test_machine=`ls $code | awk -F '_' '{print $1}' | uniq`

#for i in 's1' 's2' 's3' 's4' 's5' 's6' 's7' 's8' 't1' 'qa'
for i in $test_machine
do
        #ls到软链，根据>作为分割符，裁剪得到的真正地址
        test_machine_dir=`ls -l $default$i/default | cut -f 2 -d '>'`
        #根据/作为分割符，得到s6_default_xxx这样的文件名
        test_machine_dir=${test_machine_dir##*/}
#       echo $test_machine_dir
        mv $code$test_machine_dir $code'BAK_'$test_machine_dir
done

test_machine_dir=`ls -l ${default}s7/default2 | cut -f 2 -d '>'`
test_machine_dir=${test_machine_dir##*/}
#echo $test_machine_dir
mv $code$test_machine_dir $code'BAK_'$test_machine_dir

cd $code
rm -rf s* qa* t*
#批量将文件夹名带BAK_的替换为空
rename 's/BAK_//' *
