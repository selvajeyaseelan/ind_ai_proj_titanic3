# ind_ai_proj_titanic3


### Project Overview

This project is an end-to-end MLOps pipeline designed to automate the entire machine learning lifecycle, from data ingestion to model deployment and monitoring. The primary goal is to build a system that is scalable, automated, reproducible, and robust, with a focus on pipeline quality over the final model's performance.

The core task is to train, deploy, and maintain a classification model using the Kaggle Titanic dataset to predict the survival of passengers.

---

### Key Features

* **Distributed Processing**: The data preprocessing and feature engineering pipeline uses Apache Spark to handle large datasets efficiently.
* **Data Versioning**: The project uses **Data Version Control (DVC)** to version datasets, ensuring the entire workflow is reproducible. The repository contains DVC pointers instead of the raw data files.
* **Experiment Tracking**: **MLflow Tracking** is integrated into the training scripts to log parameters, performance metrics, and relevant artifacts for every experiment.
* **Model Registry**: The best-performing model is automatically registered and managed using the **MLflow Model Registry**, allowing for seamless transitions between stages like Staging and Production.
* **API Deployment**: The final model is packaged and exposed as a REST API using a framework like Flask or FastAPI, allowing other applications to get predictions in real-time.
* **Automated Retraining**: The pipeline is designed to support future-proofing by automatically retraining, evaluating, and deploying a new model in response to new data or a detected distributional shift.

---

### Technologies Used

* **Apache Spark**: For distributed data processing and training.
* **DVC**: For data and model versioning.
* **MLflow**: For experiment tracking and model registry.
* **Python**: The primary programming language.

---

# Initiate git and clone it
git init
git clone https://github.com/selvajeyaseelan/titanic3.git

# install dependencies
# Activate your virtual environment first
source venv/bin/activate
pip install -r requirements.txt

# install DVC and pull data
dvc init
dvc pull

# Run the main pipeline
# This shell command has the pipeline included python pipeline_mlops_1.py

chmod +x pipeline.sh
./pipeline.sh  


# Run API server
python app.py

# Test API
python test_api.py


### Project Structure
.
├── .dvc/
├── .git/
├── data/
│   ├── train.csv.dvc
│   └── test.csv.dvc
├── pipeline_mlops_1.py
├── app.py
├── run_pipeline.sh
├── requirements.txt
├── .gitignore
└── README.md