echo "Downloading Strings"
unzip loco.zip
./loco/loco.rb

echo "updating env"
plutil -replace rb -string "firebaseDistributinBuild" ../eMAG/SupportingFiles/Shared/env/env.plist