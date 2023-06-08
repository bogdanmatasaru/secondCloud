echo "updating env"

plutil -replace xcodeCloudBuild -bool YES ../eMAG/SupportingFiles/Shared/Environment/Environment.plist

if [[ $CI_WORKFLOW == *"Firebase"* ]]; then
	plutil -replace backendSettingsEnabled -bool YES ../eMAG/SupportingFiles/Shared/Environment/Environment.plist
else
	plutil -replace backendSettingsEnabled -bool NO ../eMAG/SupportingFiles/Shared/Environment/Environment.plist
fi