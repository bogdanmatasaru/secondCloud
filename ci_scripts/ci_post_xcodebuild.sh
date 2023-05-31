if [ "$CI_WORKFLOW" = "Firebase Debug Build" ];
then
    git log -1 --pretty=%B
    echo "Uploading Firebase Debug Build"
    unzip firebase-tools-macos.zip
    ./firebase-tools-macos appdistribution:distribute $CI_AD_HOC_SIGNED_APP_PATH/testXCloud.ipa --app "$FIREBASE_APPID" --token "$FIREBASE_TOKEN" --groups "ios-testers" --release-notes "BRANCH: ${CI_BRANCH} \n\nRelease Notes:\n ${CI_GIT_REF}"
fi