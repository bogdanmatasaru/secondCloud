if [[ $CI_WORKFLOW == *"Firebase"* ]]; then
    echo "Uploading Firebase Debug Build"
    search_dir=$CI_AD_HOC_SIGNED_APP_PATH
    for entry in "$search_dir"/*
    do
      echo "$entry"
    done
    unzip firebase-tools-macos.zip
    ./firebase-tools-macos appdistribution:distribute $CI_AD_HOC_SIGNED_APP_PATH/$CI_PRODUCT.ipa --app "$FIREBASE_APPID" --token "$FIREBASE_TOKEN" --groups "ios-testers" --release-notes "BRANCH: ${CI_BRANCH} \n\nRelease Notes:\n $(git log -1 --pretty=%B) \n ${CI_GIT_REF}"
fi