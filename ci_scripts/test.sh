echo "updating env"

plutil -replace xcodeCloudBuild -bool YES ../eMAG/SupportingFiles/Shared/Environment/Environment.plist
plutil -replace backendSettingsEnabled -bool YES ../eMAG/SupportingFiles/Shared/Environment/Environment.plist