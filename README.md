# micro-api demo application

[![Run Status](https://api.shippable.com/projects/574497362a8192902e214243/badge?branch=google-gcr-gke)](https://app.shippable.com/projects/574497362a8192902e214243)

[![Coverage Badge](https://api.shippable.com/projects/574497362a8192902e214243/coverageBadge?branch=google-gcr-gke)](https://app.shippable.com/projects/574497362a8192902e214243)

This is the back-end of a simple 2-tier app to demonstrate amazon container registry (ECR) integration with shippable
.  To see the full functionality of the app, use the same steps to deploy the front-end of the app which is also
on  called [micro-www](https://github.com/prabhuinbarajan/micro-www/tree/google-gcr-gke).

##### Prerequisites for running this sample:
1. setup amazon container registry on a region
2. create a repository 
    aws ecr create-repository --repository-name shippable-aws/micro-api --region us-west-2

3. Log into Shippable and [enable a project for your fork of this project](http://docs.shippable.com/ci_subscriptions/#enabling-a-project)
4. [Create an Account Integration for ECR](http://docs.shippable.com/int_docker_registries/#google-container-registry-gcr)
 called 'shippable-aws' and [assign it to your project](http://docs.shippable.com/ci_projects/#enabling-integrations)

 Note: In this sample, you will be working with branch "google-gcr-gke"

##### When run, the CI process performs the following:
* Uses Docker to build the CI environment from a Dockerfile, pulling the base image from a public repository "aye0aye/micro-image"
* Executes some basic CI tests
* Stores the test results and code coverage report
* Upon successful CI build, pushes the newly built Docker image to Amazon Container Registry

##### Environment variables required for pulling and pushing from ECR in shippable.yml:
In the shippable.yml, you should't need to change any of the environment variables:
- SERVICE=micro-api
- PROJECT_ID=shippable-aws
- REGISTRY_ACCOUNT=<acctid>.dkr.ecr.us-west-2.amazonaws.com/$PROJECT_ID
