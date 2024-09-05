
# Synckai

## Usage

You can automate the building and push of your Docker image using GitHub Actions. Here’s an example workflow that builds the Docker image and pushes it to Docker Hub:

```bash
name: Deploy to Oikps
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
          AWS_ACCESS_KEY: ${{ secrets.AWS_ACCESS_KEY }}
          AWS_SECRET_TOKEN: ${{ secrets.AWS_SECRET_TOKEN }}
          REGION: ${{ secrets.REGION }}
        with:
          args: "deploy"
```

### AWS Secrets Setup:

Ensure you add the following secrets in your GitHub repository settings:


## License

This project is licensed under the MIT License - see the [LICENSE](./LICENSE) file for details.
