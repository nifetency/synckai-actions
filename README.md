
# Synckai
Synckai is a utility designed to synchronize your folder to an S3 bucket. It automates syncing build files to Amazon S3 after a successful GitHub action run.|

## Usage
Add the following configuration to your .github/workflows/main.yml

```bash
name: sync s3
on: [push]
jobs:
  deploy:
    name: sync proxy
    runs-on: ubuntu-latest
    steps:
      # This step checks out a copy of your repository.
      - uses: actions/checkout@v2
      # This step runs `synckai sync`.
      - uses: nifetency/synckai-actions@1.0 
        env:
          AWS_ACCESS_KEY_ID: ${{ secrets.AWS_ACCESS_KEY_ID }}
          AWS_SECRET_ACCESS_KEY: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
          AWS_REGION: ${{ secrets.AWS_REGION }}
        with:
          args: " -f ${{ secrets.FOLDER }} -b ${{ secrets.BUCKET }}"
```
### AWS Secrets Setup
To use Synckai, make sure you add the following secrets in your GitHub repository settings:

AWS_ACCESS_KEY_ID: Your AWS Access Key ID
AWS_SECRET_ACCESS_KEY: Your AWS Secret Access Key
AWS_REGION: Your AWS Region (e.g., us-east-1)
FOLDER: The folder path to sync
BUCKET: The name of your S3 bucket



## License

This project is licensed under the MIT License - see the [LICENSE](./LICENSE) file for details.
