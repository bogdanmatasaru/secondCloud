echo "Downloading Strings"
unzip loco.zip
./loco/loco.rb

plutil -replace rb -string "yourNewValue" ENV.plist