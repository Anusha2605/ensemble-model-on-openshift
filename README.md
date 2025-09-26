# Nvidia Triton Ensemble Model Serving on RedHat OpenShift AI Platform

## Downloading Models

To set up ensemble model serving, you need to download the required models. Follow these steps:

1. Visit the [Triton Inference Server Tutorials GitHub repository](https://github.com/triton-inference-server/tutorials.git).
2. Clone the repository to your local machine:
   ```bash
   git clone https://github.com/triton-inference-server/tutorials.git
   ```
3. Navigate to the `Conceptual_Guide/Part_5-Model_Ensembles` folder inside the cloned repository:
   ```bash
   cd tutorials/Conceptual_Guide/Part_5-Model_Ensembles
   ```
4. Follow the instructions in the folder's README to download and prepare the models for ensemble serving.

These models are required for deploying and testing ensemble inference workflows on the RedHat OpenShift AI Platform.

## Building a Custom Triton Image

The Python backend used in the model requires additional Python libraries. Build a custom Triton image with the required dependencies:

```bash
podman build . -t <repo path>/custom-triton:v1.0.0
```

Replace `<repo path>` with your container registry path (e.g., `quay.io/your-username`).  
This will create a custom Triton image tagged as `custom-triton:v1.0.0` ready for deployment.

## Creating a Custom Serving Runtime Template on OpenShift

Once the image is built and pushed to your container registry, create a custom serving runtime template on OpenShift using the provided `triton-serving-runtime-template.yml` file:

```bash
oc apply -f triton-serving-runtime-template.yml
```

## Deploying the Model

After the serving runtime template is created, deploy the model using the `serving-runtime.yml` and `inference-service.yml` files in your user-defined namespace:

```bash
oc apply -f serving-runtime.yml -n <your-namespace>
oc apply -f inference-service.yml -n <your-namespace>
```

Replace `<your-namespace>` with the namespace where you want to deploy the model.

This will set up the custom serving runtime and deploy your ensemble model on OpenShift AI Platform.

## Ensemble Model Validation

Use the `http_client.ipynb` notebook to validate the deployed model 