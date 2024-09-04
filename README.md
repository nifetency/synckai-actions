
# Synckai

**Continuous synchronization of a local folder to an Amazon S3 bucket.**

## Description

Synckai is a command-line tool that enables continuous synchronization of a local folder with an Amazon S3 bucket. It monitors changes in the local folder and automatically uploads new or modified files to the specified S3 bucket.

## Installation

### Clone the repository:

```bash
git clone https://github.com/nifetency/Synckai.git
```

### Navigate to the project directory:

```bash
cd Synckai
```

## Usage

### Running the Docker Container

To run Synckai using Docker, build the Docker image and run it with the required arguments.

### Build the Docker image:

```bash
docker build -t synckai .
```

### Run the Docker container:

```bash
docker run --rm synckai <localFolderPath> <s3BucketName>
```

Replace \`<localFolderPath>\` with the path to the local folder you want to sync, and \`<s3BucketName>\` with the name of the Amazon S3 bucket.

### Configuration

Synckai supports configuration through environment variables. You can set the following environment variables to configure the application:

- \`LOCAL_FOLDER_PATH\`: Path to the local folder to sync.
- \`S3_BUCKET_NAME\`: Name of the Amazon S3 bucket.
- \`CONTINUOUS_SYNC\`: Set to \`true\` to enable continuous sync.

Alternatively, you can create a \`.env\` file in the project root directory with the following content:

```bash
LOCAL_FOLDER_PATH=/path/to/local/folder
S3_BUCKET_NAME=your-s3-bucket-name
CONTINUOUS_SYNC=true
```

## GitHub Actions

You can automate the building and pushing of your Docker image using GitHub Actions. Here’s an example workflow that builds the Docker image and pushes it to Docker Hub:

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
