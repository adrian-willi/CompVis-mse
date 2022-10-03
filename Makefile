.DEFAULT_GOAL := help

###########################
# HELP
###########################
include *.mk

###########################
# VARIABLES
###########################
NOTEBOOK_DOCKER_START = docker-compose up
NOTEBOOK_DOCKER_STOP = docker-compose down -v

###########################
# PROJECT UTILS
###########################
.PHONY: clean
clean: ##@Utils Cleans the project
	@find . -name '*.pyc' -delete
	@find . -name '__pycache__' -type d | xargs rm -fr
	@rm -f .DS_Store
	@rm -f -R .pytest_cache
	@rm -f -R .idea
	@rm -f .coverage
	@rm -f .coverage*
	@rm -f -R .ipynb_checkpoints
	@find . -name '*,cover' -exec rm -r "{}" \;

###########################
# JUPYTER
###########################
.PHONY: start_jupyter
start_jupyter: ##@Jupyterlab Starts jupyter lab service
	@echo "Starting jupyter lab"
	$(NOTEBOOK_DOCKER_START)

.PHONY stop_jupyter
stop_jupyter: ##@Jupyterlab Stops jupyter lab service
	@echo "Stopping jupyter lab"
	$(NOTEBOOK_DOCKER_STOP)