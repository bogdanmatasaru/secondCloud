echo "Downloading Strings"
unzip loco.zip
./loco/loco.rb

echo "updating env"
plutil -replace xcodeCloudBuild -bool YES ../eMAG/SupportingFiles/Shared/Environment/Environment.plist
if [[ $CI_WORKFLOW == *"Firebase"* ]]; then
	plutil -replace backendSettingsEnabled -bool YES ../eMAG/SupportingFiles/Shared/Environment/Environment.plist
else
	plutil -replace backendSettingsEnabled -bool NO ../eMAG/SupportingFiles/Shared/Environment/Environment.plist
fi

echo "Creating release notes"
TESTFLIGHT_DIR_PATH=../TestFlight
mkdir $TESTFLIGHT_DIR_PATH
echo "BRANCH: ${CI_BRANCH} \n\nRelease Notes:\n $(git log -3 --pretty=%B) \n ${CI_GIT_REF}" > $TESTFLIGHT_DIR_PATH/WhatToTest.en-US.txt