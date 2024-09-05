
# Synckai

## GitHub Actions

You can automate the building and push of your Docker image using GitHub Actions. Here’s an example workflow that builds the Docker image and pushes it to Docker Hub:

### \`.github/workflows/docker-image.yml\`

```bash
name: Docker Image CI

on:
  push:
    branches:
      - main

jobs:
  build:
    runs-on: ubuntu-latest

    steps:
    - name: Checkout code
      uses: actions/checkout@v3

    - name: Set up Docker Buildx
      uses: docker/setup-buildx-action@v2

    - name: Log in to Docker Hub
      uses: docker/login-action@v2
      with:
        username: ${{ secrets.DOCKER_USERNAME }}
        password: ${{ secrets.DOCKER_PASSWORD }}

    - name: Build and push Docker image
      uses: docker/build-push-action@v5
      with:
        context: .
        tags: ${{ secrets.DOCKER_USERNAME }}/synckai:latest
        push: true
```

### GitHub Secrets Setup:

Ensure you add the following secrets in your GitHub repository settings:

- **DOCKER_USERNAME**: Your Docker Hub username.
- **DOCKER_PASSWORD**: Your Docker Hub password.

## License

This project is licensed under the MIT License - see the [LICENSE](./LICENSE) file for details.
