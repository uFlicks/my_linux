# Setting Up the Development Environment with Docker

This guide will walk you through the complete process of setting up a development environment using Docker. It includes building the Docker image, configuring Git, and managing the Docker container.

## Prerequisites

Before starting, ensure you have the following tools installed:
- [Docker](https://www.docker.com/products/docker-desktop)
- [Docker Compose](https://docs.docker.com/compose/)

## Setup Instructions

### 1. Clone the Repository

Clone this repository to your local machine:

```bash
git clone https://github.com/your-repository.git
cd your-repository
```
### 2. Create the `.env` File

Create a `.env` file in the root directory of the repository to set the Git username and email for configuration:

```bash
touch .env
```
#### Add the following environment variables to the .env file:

```bash
GIT_USER_NAME=Your Name
GIT_USER_EMAIL=your_email@example.com
CONTAINER_NAME=example-container
```
### 4. Build the Docker Image
Now, use Docker Compose to build the image and set up the container. Run the following command in the root of your repository:

```bash
Copy code
docker-compose up --build
```
#### If the container is not running after the build, you can start it using:

```bash
docker-compose start
```
#### To stop the container later, use:

```bash
docker-compose stop
```
### 6. Access the Running Container
Once the container is running, you can access its shell by running:

```bash
docker ps
docker exec -it <container name> bash
```
This will open a bash shell inside the running container.

### 7. Verify Git Configuration
Inside the container, verify that the Git user name and email are configured correctly:

```bash
git config --global user.name
git config --global user.email
```
### 8. You can also test the SSH connection to GitHub:

```bash
ssh -T git@github.com
```
This will check if the SSH key is set up correctly for GitHub.


