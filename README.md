# DevOps-Proyect

Simple overview of use/purpose.
DevOps proyect using Selenium, Docker, Terraform and Jenkins

## Description

An in-depth paragraph about your project and overview of use.
This DevOps Proyect is based in the Linkedin Learning Course of DevOps Foundations: Your First Proyect, with the objective of create a functional website development environment in azure.


## Future Changes

* Azure infrasctructure modification:
    * Apply best practices.
    * DNS.
    * Improve scalability and availability.
    * Analysis of potential improvements.
* Workflow modification:
    * Update automatically Azure Web App after the WF is completed.

#### Ideas:
My idea is to have several repositories connected to the same CI/CD, separating website, testing and CI/CD tool, in order to have the benefits of Multi-Repo.
Idk if it´s actually possible using Jenkins, the only tool that I know for sure that has this feature is ArgoCD.
Also, I would like to implement an artifact repository. The only one I know is nexus, further investigation is needed.

## Getting Started

### Resources

* [Readme template](https://gist.github.com/DomPizzie/7a5ff55ffa9081f2de27c315f5018afc)
* [Readme rules](https://www.freecodecamp.org/news/how-to-write-a-good-readme-file/)
* [Initial Microsoft Architecture](https://learn.microsoft.com/es-es/azure/architecture/web-apps/idea/scalable-ecommerce-web-app)
* [Linkedin Learning Course](https://www.linkedin.com/learning/devops-foundations-your-first-project)

### Dependencies

* Describe any prerequisites, libraries, OS version, etc., needed before installing program.
* Developed using Windows 10
* [Docker](https://www.docker.com/products/docker-desktop/)
* [Azure CLI](https://learn.microsoft.com/es-es/cli/azure/install-azure-cli-windows?tabs=azure-cli)
* Azure subscription
* Azure ApplicationId configured for terraform. In case you don't have it created, you can use this code on cmd :point_down:

```
az login --use-device-code

#(Optional) If you have more than 1 subscription:
    az account set --subscription "{Subscription Name}"

az ad sp create-for-rbac --name terraform
az role assignment create --assignee "{Your App ID}" --role "Contributor" --scope "/subscriptions/{Your Subscription ID}"
```

### Installing

* How/where to download your program. Any modifications needed to be made to files/folders
* After downloading the proyect, you need to create a file whose name is azure.env like this.
![Image Alt text](/images/azure.env.PNG)

### Executing program

* How to run the program
* Step-by-step bullets
```
docker-compose up
docker-compose run --rm terraform
```

## Help

Any advise for common problems or issues.
```
docker-compose run --rm unit-tests
docker-compose run --rm terraform
docker-compose run --rm azure
```

## Authors

Contributors names and contact info

ex. Rubén Baquedano


## Version History

* 0.2
    * Various bug fixes and optimizations
    * See [commit change]() or See [release history]()
* 0.1
    * Initial Release

## License

This project is licensed under the [NAME HERE] License - see the LICENSE.md file for details

## Acknowledgments

Inspiration, code snippets, etc.
* [awesome-readme](https://github.com/matiassingers/awesome-readme)
* [PurpleBooth](https://gist.github.com/PurpleBooth/109311bb0361f32d87a2)
* [dbader](https://github.com/dbader/readme-template)
* [zenorocha](https://gist.github.com/zenorocha/4526327)
* [fvcproductions](https://gist.github.com/fvcproductions/1bfc2d4aecb01a834b46)