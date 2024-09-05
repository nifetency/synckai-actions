
# Synckai

## Usage

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
      - uses: nifetency/synckai-actions@1.0 
        env:
          AWS_ACCESS_KEY_ID: ${{ secrets.AWS_ACCESS_KEY_ID }}
          AWS_SECRET_ACCESS_KEY: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
          AWS_REGION: ${{ secrets.AWS_REGION }}
        with:
          args: " -f <folder-path> -b <bucket-name>"
```

### AWS Secrets Setup:

Ensure you add the following secrets in your GitHub repository settings:


## License

This project is licensed under the MIT License - see the [LICENSE](./LICENSE) file for details.
