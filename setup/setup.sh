#!/bin/bash

echo "Adding script...."
if ! grep -Fxq 'echo "Welcome back, $USER! Today is $(date)."' ~/.bashrc
then
  echo 'echo "Welcome back, $USER! Today is $(date)."' >> ~/.bashrc
  source ~/.bashrc
else
  echo "Script already present in ~/.bashrc"
fi

