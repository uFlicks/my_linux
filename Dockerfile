# Start from the Ubuntu image
FROM ubuntu:latest

# Update and upgrade the system
RUN apt-get update && apt-get upgrade -y

# Install required packages
RUN apt-get install -y python3 python3-venv python3-pip vim git openssh-client

# Create a Python virtual environment
RUN python3 -m venv /venv

# Activate the virtual environment and install pandas
RUN /venv/bin/pip install pandas numpy

# Set up Git configuration using environment variables
ARG GIT_USER_NAME
ARG GIT_USER_EMAIL
RUN git config --global user.name "$GIT_USER_NAME" && \
    git config --global user.email "$GIT_USER_EMAIL" && \
    ssh-keygen -t rsa -b 4096 -C "$GIT_USER_EMAIL" -f /root/.ssh/id_rsa -N ""

# Display SSH public key (useful for adding to GitHub later)
RUN echo "Your SSH public key is:" && cat /root/.ssh/id_rsa.pub

# Set the working directory
WORKDIR /workspace

# Default command to keep the container running
CMD ["tail", "-f", "/dev/null"]
