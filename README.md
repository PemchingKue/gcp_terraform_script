simple terraform script to test quotas on gcp

#NOTES

Terraform Dev Container features intermittently fail in GitHub Codespaces, even when referenced correctly, due to how Codespaces builds feature layers on shared infrastructure.
Do NOT use Dev Container features for Terraform in Codespaces
Install Terraform via Dockerfile instead

GCLOUD:
install gcloud in container via dockerfile
use gcloud service account to authenticate

GCLOUD CLI

#GCLOUD LOGIN (GIT CODESPACE)
gcloud auth login --no-launch-browser

#SET ENV VARIABLES (GIT CODESPACE)
EXPORT GOOGLE_CLOUD_PROJECT=pkplayground

#CREATE SERVICE ACCOUNT (GCP CLOUDSHELL TERMINAL)
gcloud iam service-accounts create terraform-sa \
    --description="Service account for Terraform" \
    --display-name="Terraform Service Account"

#SET PERMISSIONS (GCP CLOUDSHELL TERMINAL)
gcloud projects add-iam-policy-binding $GOOGLE_CLOUD_PROJECT \
    --member="serviceAccount:terraform-sa@$GOOGLE_CLOUD_PROJECT.iam.gserviceaccount.com" \
    --role="roles/compute.admin"

gcloud projects add-iam-policy-binding $GOOGLE_CLOUD_PROJECT \
    --member="serviceAccount:terraform-sa@$GOOGLE_CLOUD_PROJECT.iam.gserviceaccount.com" \
    --role="roles/iam.serviceAccountUser"

#DOWNLOAD AUTH KEY (GIT CODESPACE)
gcloud iam service-accounts keys create ~/terraform-sa-key.json \
    --iam-account terraform-sa@$GOOGLE_CLOUD_PROJECT.iam.gserviceaccount.com

#SET ENV VARIABLES (GIT CODESPACE)
export GOOGLE_APPLICATION_CREDENTIALS="$HOME/terraform-sa-key.json"
