# Synckai S3 Sync Action

Synckai is a utility designed to synchronize your folder to an S3 bucket. It automates syncing files to Amazon S3 after a successful GitHub Actions run.

## Usage

To use Synckai, follow these steps:

### 1. Create GitHub Action Workflow

Copy the following configuration into a file named `.github/workflows/main.yml` in your repository:

```yaml
name: sync to s3
on: [push]
jobs:
  deploy:
    name: synckai
    runs-on: ubuntu-latest
    steps:
      # This step checks out a copy of your repository.
      - uses: actions/checkout@v4
      # This step runs `synckai sync`.
      - uses: nifetency/synckai-actions@v1.0.2
        env:
          AWS_ACCESS_KEY_ID: ${{ secrets.AWS_ACCESS_KEY_ID }}
          AWS_SECRET_ACCESS_KEY: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
          AWS_REGION: ${{ secrets.AWS_REGION }}
        with:
          args: "-f build -b ${{ secrets.BUCKET }} -c false"
```

This configuration sets up a GitHub Actions workflow that triggers on every push to your repository. It uses the Synckai GitHub Action to sync the specified folder to your specified S3 bucket.

### 2. Setup AWS Secrets

To ensure Synckai can access your S3 bucket, you need to configure the following secrets in your GitHub repository settings:

- **AWS_ACCESS_KEY_ID**: Your AWS Access Key ID
- **AWS_SECRET_ACCESS_KEY**: Your AWS Secret Access Key
- **AWS_REGION**: Your AWS Region (e.g., us-east-1)
- **BUCKET**: The name of your S3 bucket

Make sure that these credentials have the necessary permissions to write to the S3 bucket.

### 3. Configure Arguments

The action uses the following flags in the `args` parameter:

- `-f`: The folder you want to sync (defaults to `build` in the example).
- `-b`: The name of your S3 bucket.
- `-c`: Whether to create the bucket if it does not exist (`true` or `false`).

### 4. Workflow Trigger

The workflow will automatically trigger on every push to your repository, syncing the contents of the specified folder to your S3 bucket.

## License

This project is licensed under the MIT License - see the [LICENSE](./LICENSE) file for details.

---

[Learn more about Nife Open Source](https://nife.io/open-source/)
