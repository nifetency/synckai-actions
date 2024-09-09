
# Synckai
Synckai is a utility designed to synchronize your folder to an S3 bucket. It automates syncing files to Amazon S3 after a successful GitHub action run.

## Usage
To use Synckai, follow these steps:

### 1. Create GitHub Action Workflow

Copy the following configuration into a file named `.github/workflows/main.yml` in your repository:

```bash
name: Deploy to Oikos
on: [push]
jobs:
  deploy:
    name: Deploy proxy
    runs-on: ubuntu-latest
    steps:
      # This step checks out a copy of your repository.
      - uses: actions/checkout@v2
      # This step runs `synckai sync`.
      - uses: nifetency/synckai-actions@v1.0.1
        env:
          AWS_ACCESS_KEY_ID: ${{ secrets.AWS_ACCESS_KEY_ID }}
          AWS_SECRET_ACCESS_KEY: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
          AWS_REGION: ${{ secrets.AWS_REGION }}
        with:
          args: "-f build -b ${{ secrets.BUCKET }} -c false"
```
This configuration sets up a GitHub Actions workflow that triggers on every push to your repository. It uses the Synckai GitHub Action to sync the build folder to your specified S3 bucket.

### 2. Setup AWS Secrets
To ensure Synckai can access your S3 bucket, you need to configure the following secrets in your GitHub repository settings:

AWS_ACCESS_KEY_ID: Your AWS Access Key ID
AWS_SECRET_ACCESS_KEY: Your AWS Secret Access Key
AWS_REGION: Your AWS Region (e.g., us-east-1)
BUCKET: The name of your S3 bucket

Make sure that these credentials have the necessary permissions to write to the S3 bucket.

### 3. Configure Folder to Sync
The folder that will be synced to S3 must be named build. Ensure that the folder you want to sync is named build in your repository. The GitHub Actions workflow will use this folder as the source for synchronization.

### 4. Workflow Trigger
The workflow will automatically trigger on every push to your repository, syncing the contents of the build folder to your S3 bucket.



## License

This project is licensed under the MIT License - see the [LICENSE](./LICENSE) file for details.
