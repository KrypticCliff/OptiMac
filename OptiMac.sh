#!/bin/bash

###### Checks and deletes Inventory script  ######
printf "Removing Inventory Script...\n"

if [ -e /Library/LaunchAgents/inventory_update.plist ] || [ -e /Applications/inventory_update.app ]; then
	sudo rm -v /Library/LaunchAgents/inventory_update_1010.plist
	sudo rm -v /Library/LaunchAgents/inventory_update.plist
	sudo rm -rv /Applications/inventory_update.app;
	printf "File has been successfully removed!\n\n"

elif [ ! -e /Library/LaunchAgents/inventory_update.plist ]; then
	printf "No Inventory Script found.\n\n"
	
else
	printf "Error has occurred when removing Inventory_Update.\n\n"
fi


###### Checks and deletes Temp User Accounts ######
printf "Removing User accounts...\n"

if [ -e /Users/00*/ ]; then
	sudo rm -rv /Users/00*/
	printf "Temp Accounts have been successfully removed!\n\n"
	
elif [ ! -e /Users/00*/ ]; then
	printf "No Temp Users found.\n\n"
	
else
	printf "Error has occurred when removing Temp User Accounts.\n\n"
fi


###### Injects Custom Task Bar with Minimum icons ###### 
printf "Copying Custom TaskBar to System Folder...\n"
cp -v ~/Desktop/OptiMac/com.apple.dock.plist /System/Library/User\ Template/English.lproj/Library/Preferences/
printf "\n"


###### Disables Animations and Speeds Tp Display Time ######
printf "Disabling Mac Animations...\n"

defaults write -g NSAutomaticWindowAnimationsEnabled -bool false
defaults write -g NSScrollAnimationEnabled -bool false
defaults write -g NSWindowResizeTime -float 0.001
defaults write -g QLPanelAnimationDuration -float 0
defaults write -g NSScrollViewRubberbanding -bool false
defaults write -g NSDocumentRevisionsWindowTransformAnimation -bool false
defaults write -g NSToolbarFullScreenAnimationDuration -float 0
defaults write -g NSBrowserColumnAnimationSpeedMultiplier -float 0
defaults write com.apple.dock autohide-time-modifier -float 0
defaults write com.apple.dock autohide-delay -float 0
defaults write com.apple.dock launchanim -bool false
defaults write com.apple.dock expose-animation-duration -float 0
defaults write com.apple.dock springboard-show-duration -float 0
defaults write com.apple.dock springboard-hide-duration -float 0
defaults write com.apple.dock springboard-page-duration -float 0
defaults write com.apple.finder DisableAllAnimations -bool true
defaults write com.apple.Mail DisableSendAnimations -bool true
defaults write com.apple.Mail DisableReplyAnimations -bool true

defaults write NSGlobalDomain NSWindowResizeTime .001
defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool false
printf "Animations have been Disabled\n\n"

printf "Please Reboot Device to Apply Changes...\n"