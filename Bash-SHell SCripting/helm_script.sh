#!/bin/bash

PLUGIN_NAME="s3"

# Check if the plugin is already installed
if helm plugin list | grep -q $PLUGIN_NAME; then
    echo "Plugin $PLUGIN_NAME is already installed."
    # Add your Helm command here
    
else
    echo "Installing plugin"
    helm plugin install https://github.com/hypnoglow/helm-s3.git --version 0.12.0
fi

