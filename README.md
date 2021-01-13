# QA Final Project
**Spring Pet Clinic** _By Team 3_

# Resources

Website: <space><space>\
Presentation: https://docs.google.com/presentation/d/18tSl0cTL2yxslPznOd3z3h_VHpsLJjPHtHvdqo6eRyo/edit?usp=sharing <space><space>\
Project Board: https://trello.com/b/V0fSC2cp/final-group-project <space><space>\
Risk Assessment: https://docs.google.com/spreadsheets/d/128TcehtL_puDUwLKvUdLhTt__cj8NS8wpZU_gw_jgBE/edit?usp=sharing  
  
## Contents

* Brief
    * [Project Brief](#project-brief)
    * [Our Approach](#our-approach)
* Designs
    * [Basic Designs](#basic-designs)
* [Risk Assessment](#risk-assessment)
* [Trello Board](#trello-board)
* [Back End](#back-end)
* [Front End](#front-end)
* [Deployment Log](#deployment-log)
* [Known Issues](#known-issues)
* [Future Improvements](#future-improvements)
* [Expenses](#expenses)
* [Version Control](#version-control)

## Brief
### Project Brief

This project is a group challenge to work to a deliverable with time constraints, providing a robust deployment with consistent method and CI pipeline.
A monthly estimate of cost should be made for the projects, risks should be assessed and issues and improvements discussed. We should implement a Webhook with GitSCM to enable rolling updates when code is pushed to the repository. We should justify our usage of chosen technologies; and provide multiple environment support for both testing and live.

## Designs
### Basic Designs
Here is our CI pipeline:
![pipeline][pipeline]
_Our CI Pipeline_

**Kanban Board: Trello**  \
Trello was used as a Kanban board for this project. It allows for 'cards' containing user stories and the product backlog, in addition to basic risks and issues assessment. Cards can be colour coded to aggregate their importance by story points or to demarcate the position of the task in the MOSCOW prioritisation.

trello image here

**Version Control: Git VCS**  \
Git VCS was used for version control of this project. It permits a push/pull relationship between virtual machine and repository for portability; allows branching for rolling updates, and can be polled by Jenkins build triggers via a webhook. This ensures that changes to the code are updated on the live application as quickly as possible.

**CI Server: Jenkins**  \
Jenkins was used as a CI Server for this project. Jenkins creates project builds from a multi-stage pipeline script, and checks for updates to the source code in the Git repository. In the instance, we decided to install dependencies at the start of the pipeline, initialize Terraform to build infrastructure so that we could subsequently test, build and deploy.

**Cloud Server: Microsoft Azure**  \
Azure is a cloud platform for building, managing and deploying services. It is useful due to how diversifiable and flexible it is. With Azure, you can add capabilities to your existing network in a Platform as a Service (PaaS) capacity, or have Azure as the starting point for your network infrastructure as Infrastructure as a Service (IaaS). We have chosen the latter approach as a fully Azure based deployment is easier to cost due to Azure's accessible pricing systems. Azure also offers good advice in terms of cost management, ideal for tech startups.

**Image builds: Docker Compose**  \
Docker Compose was used to build images for use with Kubernetes in this project. Because Docker produces methodical and consistent image builds, which can be pushed to its in-house image repository (Dockerhub) Docker images built and pushed with docker-compose are the perfect foil for a Kubernetes pod.

**Infrastructure Management: Terraform**   \

**Orchestration Tool: Kubernetes**   \

**Reverse Proxy: NGINX**  \
NGINX reverse proxies perform load balancing. This assists with the distribution of requests across backend servers (such as within the worker machines of a Swarm. If one server goes down, NGINX will reroute requests to a different server in accordance with the routing policy. Serving the application to the HTTP port 80 of an NGINX machine means that all other ports can be closed on other virtual machines in the Swarm, increasing security.


Here is a more in-depth view of our Kubernetes Cluster configuration, from an end user perspective:
![cluster][cluster]  \
_Configuration of a K8s cluster_  
The cluster diagram illustrates how all traffic is directed towards our NGINX load balancer and reverse proxy in order to delegate accordingly to our front-end and back-end pods which are able to store data within the MySQL database. 

### Risk Assessment

We have performed a full risk assessment before attempting deployment. Those risks which are not currently mitigated and require revisiting will be revisited after deployment.
A link to our risk assessment (pre-revisit) is available in the Resources section.
Please find a screenshot below:

![risk][risk]

### Back End

### Front End

### Deployment Log

### Known Issues

### Future Improvements

### Expenses

### Version Control


## Authors
Joshua Cashen  \
Isaac Lister  \
Hannah Lister-Sims  \
Alexander Smith  

## Version
v1.0

## Acknowledgements

Thanks to Ben Hesketh and QA Community for assistance meeting the project brief.

[pipeline]: https://imgur.com/cO2YN1k.png
[cluster]: https://i.imgur.com/wUBId9p.png
[risk]: https://imgur.com/ogn761e.png
