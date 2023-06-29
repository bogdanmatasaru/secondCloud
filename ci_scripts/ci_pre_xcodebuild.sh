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
if [[ -d "$CI_APP_STORE_SIGNED_APP_PATH" ]]; then
  TESTFLIGHT_DIR_PATH=../TestFlight
  mkdir $TESTFLIGHT_DIR_PATH
  git fetch --deepen 3 && git log -3 --pretty=format:"%s" >! $TESTFLIGHT_DIR_PATH/WhatToTest.en-US.txt
fi