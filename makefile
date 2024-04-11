all:
	stow --no --verbose --target=$$HOME --restow */

delete:
	stow --no --verbose --target=$$HOME --delete */
