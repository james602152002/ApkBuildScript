#! /bin/bash
cd $HOME/StudioProjects/Saury
./gradlew clean
./gradlew assembleRelease
cp $HOME/StudioProjects/Saury/app/build/outputs/apk/release/app-release.apk $HOME/Documents

cd $HOME/Documents

for filename in `ls |grep Saury |sort -r`;
	    do         #循环当前目录下的文件
			array[$x]=$filename   #文件名给数组索引为x的元素
		    let "x+=1"      #改变索引指针，步长1
##		    echo $filename;
	    done	

lastVersion=${array[0]};
primName=${lastVersion%_*};
version=${lastVersion##*_beta};
version=${version%.apk*};
currentVersion=$((version+1));
destApkName=${primName}_beta$currentVersion.apk;
echo $destApkName;
mv app-release.apk ${destApkName}; 
