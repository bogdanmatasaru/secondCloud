if [[ $CI_WORKFLOW == *"Firebase"* ]]; then
    echo "Uploading Firebase Debug Build"
    ls CI_AD_HOC_SIGNED_APP_PATH
    unzip firebase-tools-macos.zip
    ./firebase-tools-macos appdistribution:distribute $CI_AD_HOC_SIGNED_APP_PATH/$CI_PRODUCT.ipa --app "$FIREBASE_APPID" --token "$FIREBASE_TOKEN" --groups "ios-testers" --release-notes "BRANCH: ${CI_BRANCH} \n\nRelease Notes:\n $(git log -1 --pretty=%B) \n ${CI_GIT_REF}"
fi

echo "Creating release notes"
TESTFLIGHT_DIR_PATH=../TestFlight
mkdir $TESTFLIGHT_DIR_PATH
echo "BRANCH: ${CI_BRANCH} " > $TESTFLIGHT_DIR_PATH/WhatToTest.en-US.txt
echo " " >> $TESTFLIGHT_DIR_PATH/WhatToTest.en-US.txt
echo "Last 3 commits:" >> $TESTFLIGHT_DIR_PATH/WhatToTest.en-US.txt
git fetch --deepen 3 && git log -3 --pretty=format:"%s" >> $TESTFLIGHT_DIR_PATH/WhatToTest.en-US.txt