NAME = tomatobar

.PHONY: all clean fclean

all:
	@echo "Installing $(NAME)..."
	brew install --cask $(NAME)

local:
	@echo "Building $(NAME) locally..."
	xcodebuild -project TomatoBar.xcodeproj -scheme TomatoBar -configuration Debug build

force:
	@echo "Install Pomodoro if he doesn't appear in the menu bar"
	-brew uninstall --cask tomatobar
	rm -rf ~/Library/Application\ Support/TomatoBar
	brew install --cask tomatobar
	open /Applications/TomatoBar.app

fclean:
	@echo "Uninstalling $(NAME)..."
	brew uninstall --cask $(NAME)

fclean_local:
	@echo "Cleaning local build of $(NAME)..."
	xcodebuild -project TomatoBar.xcodeproj -scheme TomatoBar -configuration Debug clean