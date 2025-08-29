#!/bin/bash

# ==============================================================================
# This script automates the full MLOps pipeline execution.
# It handles starting the MLflow server and running the main Python script.
# ==============================================================================

# Exit immediately if a command exits with a non-zero status.
set -e

# --- Configuration ---
# Set the project's root directory.
PROJECT_DIR="/home/selva/workspace/titanic3"

# --- Step 1: Start MLflow Server if it's not running ---
echo "Checking for a running MLflow server on port 5000..."

# Use lsof to check if port 5000 is in use.
# The 'lsof -i :5000' command lists processes using the port.
# The '&>/dev/null' redirects both stdout and stderr to null, so no output is shown.
if ! lsof -i :5000 &>/dev/null; then
    echo "MLflow server not found. Starting it now..."
    
    # Start the MLflow server in the background using the specified backend.
    # The '&' sends the process to the background.
    # The 'nohup' command prevents the process from being terminated when the terminal is closed.
    nohup "$PROJECT_DIR/venv/bin/mlflow" server --host 0.0.0.0 --port 5000 --backend-store-uri sqlite:///mlflow.db &
    
    # Give the server a moment to start up.
    echo "Waiting for the server to initialize (5 seconds)..."
    sleep 5
    echo "MLflow server is up and running."
else
    echo "MLflow server is already running. Skipping startup."
fi

# --- Step 2: Activate the Python Virtual Environment ---
echo "Activating Python virtual environment..."
source "$PROJECT_DIR/venv/bin/activate"

# --- Step 3: Execute the MLOps Pipeline Script ---
echo "Executing the MLOps pipeline..."

# Run your main Python script.
python "$PROJECT_DIR/pipeline_mlops_1.py"

echo "Pipeline execution finished."

# Deactivate the virtual environment (optional, but good practice).
deactivate