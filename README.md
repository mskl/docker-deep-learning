# Deep Learning Docker Image
Unified docker environment for DL development. Contains TF 2.3 and Tensorboard.

## Setup
The following tutorial uses `deepdream` project as an example. Replace this with the name of your own project.

Clone the current project onto your development server
```bash
git clone https://github.com/mskl/docker-deep-learning
```

Enter the folder and clone your project 
```bash
cd docker-deep-learning
git clone https://github.com/mskl/deepdream
```

Edit the `.env` file
```bash
# Port that is running Jupyter Notebook
JUPYTERPORT=43603

# Port that is running TB server
TENSORBOARDPORT=43604

# Name of the project directory
PROJECTFOLDER="deepdream"
```

## Usage
Once the setup is done, you can use the following commands to interactively interact with the running docker images:
- `make build` to build a docker image
- `make run` to build, run and follow logs of an image
- `make stop` to stop a running image
- `make bash` to open bash inside running image

Once the container is running, the services should be by default accessible at:
- tensorboard - [http://127.0.0.1/43604](http://127.0.0.1/43604)
- jupyter-notebook - [http://127.0.0.1/43603](http://127.0.0.1/43603)

When using tensorboard callbacks, the logs directory is mapped inside the docker image as`/logs`.
