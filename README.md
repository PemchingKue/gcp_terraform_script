simple terraform script to test quotas on gcp

notes:

Terraform Dev Container features intermittently fail in GitHub Codespaces, even when referenced correctly, due to how Codespaces builds feature layers on shared infrastructure.
Do NOT use Dev Container features for Terraform in Codespaces
Install Terraform via Dockerfile instead

gcloud:
install gcloud in container via dockerfile
use gcloud service account to authenticate
