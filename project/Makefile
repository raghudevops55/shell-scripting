help:	## Show this help.
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'

catalogue:	## Install Catalogue Component for RoboShop Project
	@sh components/catalogue.sh

cart:		## Install Cart Component for RoboShop Project
	@sh components/cart.sh

