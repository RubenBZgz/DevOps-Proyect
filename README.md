# DevOps-Proyect

Simple overview of use/purpose.
DevOps proyect using Selenium, Docker, Terraform and Jenkins

## Description

An in-depth paragraph about your project and overview of use.
This DevOps Proyect is based in the Linkedin Learning Course of DevOps Foundations: Your First Proyect, with the objective of create a functional website development environment in azure. Technologies used:
* Website example.
* RSpec. Testing framework. Unit testing.
* Selenium. Web driver used to automate web browser interactions. Integration testing.
* Jenkins. CI/CD tool.
* Docker. It is a platform to deploy containers.


## Future Changes

* Azure infrasctructure modification:
    * Apply best practices.
    * DNS.
    * Improve scalability and availability.
    * Analysis of potential improvements.
* Workflow modification:
    * Update automatically Azure Web App after the WF is completed.
    * Multiple Jenkins slaves.

#### Ideas:
My idea is to have several repositories connected to the same CI/CD, separating website, testing and CI/CD tool, in order to have the benefits of Multi-Repo.
Idk if it´s actually possible using Jenkins, the only tool that I know for sure that has this feature is ArgoCD.
Also, I would like to implement an artifact repository. The only one I know is nexus, further investigation is needed.

## Getting Started

### Resources

* [Readme template](https://gist.github.com/DomPizzie/7a5ff55ffa9081f2de27c315f5018afc)
<!-- * [Readme rules](https://www.freecodecamp.org/news/how-to-write-a-good-readme-file/) -->
* [Initial Microsoft Architecture](https://learn.microsoft.com/es-es/azure/architecture/web-apps/idea/scalable-ecommerce-web-app)
* [Linkedin Learning Course](https://www.linkedin.com/learning/devops-foundations-your-first-project)

### Dependencies and recommendations
#### Must Have:
* Describe any prerequisites, libraries, OS version, etc., needed before installing program.
* Developed using Windows 10
* [Docker](https://www.docker.com/products/docker-desktop/)
* [Azure CLI](https://learn.microsoft.com/es-es/cli/azure/install-azure-cli-windows?tabs=azure-cli)
* Azure subscription
* Azure ApplicationId configured for terraform. In case you don't have it created, you can use this code on cmd :point_down:
```
az login --use-device-code
az ad sp create-for-rbac --name terraform
az role assignment create --assignee "{Your App ID}" --role "Contributor" --scope "/subscriptions/{Your Subscription ID}"
```

#### Optional:
##### Programs:
* Git. 
* RealVNC Viewer. Purpouse: testing.The connections is not encrypted, the security is not guaranted. Once installed, use localhost:5901 pass: secret after docker-compose up
##### Visual Studio Extensions:
* Azure Account (Azure Tools if you want the whole pack)
* Docker
* JenkinsFile Support from ivory-lab


### Installing

#### Must Have:
* How/where to download your program. Any modifications needed to be made to files/folders
1. After downloading the proyect, you need to create a file whose name is azure.env like this.
![Image Alt text](/images/azure.env.PNG)
2. Create a folder in C:\jenkins_home. You can change the location in the volume of jenkins service in docker-compose.yml. 
3. Log in to Jenkins -> Enter localhost:8080 in the browser url. The password is in C:\jenkins_home\secrets\initialAdminPassword file.
4. Create new job.
5. At Branch Sources, add source, select Git and copy & paste GitHub proyect url to Proyect Repository field.
6. Apply and save.


#### Optional:
If you want to use local scripts follow this steps.
1. Add this code to docker-compose.yml
```
environment:
    - JAVA_OPTS=-Dhudson.plugins.git.GitSCM.ALLOW_LOCAL_CHECKOUT=true
```
2. Add this code to Jenkinsfile
```
stage("Build our website"){
    steps{
        echo "====++++executing Build our website++++===="
        // sh "chmod +x jenkinsScripts/build.sh"
        // sh "jenkinsScripts/build.sh"
    }
}
```

### Executing program

* How to run the program
* Step-by-step bullets
```
docker-compose up
docker-compose run --rm terraform init
```

### NOT WORKING
* Installing plugins by default from plugins.txt
* Website code isn't deployed at Azure Web app
* Integration tests

## Help

Any advise for common problems or issues.
```
docker-compose run --rm unit-tests
docker-compose run --rm terraform
docker-compose run --rm azure
```
Open Website:
localhost:80

Open Jenkins:
localhost:8080

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


## Responsabilidad y Advertencia

Este proyecto se proporciona "tal cual", sin garantías de ningún tipo, ya sean expresas o implícitas. El autor no asume ninguna responsabilidad y no será responsable de ningún daño directo, indirecto, incidental, especial, ejemplar o consecuente (incluyendo, pero no limitado a, la adquisición de bienes o servicios; la pérdida de uso, de datos o de beneficios; o interrupción de negocios) causados por el uso o la imposibilidad de usar el proyecto, incluso si se ha advertido de la posibilidad de tales daños.

El usuario asume la responsabilidad total del uso y la implementación de este proyecto. Se recomienda encarecidamente revisar y entender completamente el código y las configuraciones antes de utilizarlo en entornos de producción.

<!-- En caso de dudas o inquietudes, se anima a los usuarios a ponerse en contacto con el autor del proyecto antes de proceder con la implementación. -->