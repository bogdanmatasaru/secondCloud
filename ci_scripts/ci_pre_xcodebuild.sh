echo "Downloading Strings"
unzip loco.zip
./loco/loco.rb


if [ "$CI_WORKFLOW" = "Firebase Debug Build" ];
then
	echo "Updating build version"
	agvtool new-version -all 999999
fi