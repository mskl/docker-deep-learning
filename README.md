# Deep Learning Docker Image
Unified docker environment for DL development. Contains Jupyter, TF2.3 and Tensorboard.

## Setup on Oracle cloud
To setup the requirements (NVIDIA drivers and docker plugin) see the [ORACLE.md](ORACLE.md).

## Setup
The following tutorial uses `deepdream` project as an example. Replace this with the name of your own project.

> NOTE: It is possible that you don't have docker-compose installed. In that case simply install it with `sudo pip install docker-compose`.

Clone the current project onto your development server
```bash
git clone git@github.com:mskl/docker-deep-learning.git
```

Enter the folder and clone your project. If you want to run multiple projects, clone this dir, rename it to something else and then rename it again for different projects.
```bash
cd docker-deep-learning
git clone git@github.com:mskl/deepdream.git
```

Edit the `.env` file and change the values to your liking
```bash
# Which GPUs are visible to the docker
NVIDIA_VISIBLE_DEVICES=all

# Port running Jupyter Notebook
JUPYTERPORT=43603

# Port running TensorBoard server
TENSORBOARDPORT=43604

# Name of the project directory
PROJECTFOLDER="./deepdream/"

# Preferably your nickname. If you are running multiple projects on same server,
# use different project names in each so there are no conflicts between them
COMPOSE_PROJECT_NAME="matyas"
```

## Usage
Once the setup is done, you can use the following commands to interactively interact with the running docker images. Makefile contains paths to GPU image which requires nvidia driver to be installed. In case of running on device without nvidia driver, you can interact with docker by simply using `docker-compose up` and so on. The GPU commands are:

- `make build` to build a docker image
- `make run` to build, run and follow logs of an image
- `make stop` to stop a running image
- `make bash` to open bash inside running image

Once the container is running, the services should be by default accessible at:
- tensorboard - [http://127.0.0.1/43604](http://127.0.0.1/43604)
- jupyter-notebook - [http://127.0.0.1/43603](http://127.0.0.1/43603)

When using tensorboard callbacks, the logs directory is mapped inside the docker image as`/logs`.

## Maintenance
When we need to update some of the python requirements, please update them and then create a PR.
