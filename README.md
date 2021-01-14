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

![trello][trello]

**Version Control: Git VCS**  \
Git VCS was used for version control of this project. It permits a push/pull relationship between virtual machine and repository for portability; allows branching for rolling updates, and can be polled by Jenkins build triggers via a webhook. This ensures that changes to the code are updated on the live application as quickly as possible.

**CI Server: Jenkins**  \
Jenkins was used as a CI Server for this project. Jenkins creates project builds from a multi-stage pipeline script, and checks for updates to the source code in the Git repository. In the instance, we decided to install dependencies at the start of the pipeline, initialize Terraform to build infrastructure so that we could subsequently test, build and deploy.

**Cloud Server: Microsoft Azure**  \
Azure is a cloud platform for building, managing and deploying services. It is useful due to how diversifiable and flexible it is. With Azure, you can add capabilities to your existing network in a Platform as a Service (PaaS) capacity, or have Azure as the starting point for your network infrastructure as Infrastructure as a Service (IaaS). We have chosen the latter approach as a fully Azure based deployment is easier to cost due to Azure's accessible pricing systems. Azure also offers good advice in terms of cost management, ideal for tech startups.

**Image builds: Docker Compose**  \
Docker Compose was used to build images for use with Kubernetes in this project. Because Docker produces methodical and consistent image builds, which can be pushed to its in-house image repository (Dockerhub) Docker images built and pushed with docker-compose are the perfect foil for a Kubernetes pod.

**Infrastructure Management: Terraform**  \
Terraform was used to create and modify the infrastructure of the project. Provisioning and automating the infrastructure allows for more efficient delivery of software aligned with the DevOps methodology. In the case of this project, Terraform provisions the Kubernetes cluster, its associated node; and the Azure resource group.

**Orchestration Tool: Kubernetes**   \
Kubernetes is the most fully realised orchestration tool on the market, making it preferable to Docker Swarm as it is 'aware' of aspects of the project beyond the life cycle of the container and has a more fully fleshed out set of control commands. In our project, we use discrete YAML manifests for our MySQL pod, NGINX load balancer, Angular front-end and REST API back-end, as this enables a complete and uncluttered configuration and orchestration, making issue diagnoses easier.

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

The back end was built using Maven as a build tool. It is a RESTful API application which communicates with the Angular front end.

### Front End

### Deployment Log

```console
Started by GitHub push by ILister1
Obtained Jenkinsfile from git https://github.com/Almathex/QA_Final_clinic
Running in Durability level: MAX_SURVIVABILITY
[Pipeline] Start of Pipeline
[Pipeline] node
Running on Jenkins in /home/jenkins/.jenkins/workspace/final-project
[Pipeline] {
[Pipeline] stage
[Pipeline] { (Declarative: Checkout SCM)
[Pipeline] checkout
Selected Git installation does not exist. Using Default
The recommended git tool is: NONE
No credentials specified
 > git rev-parse --is-inside-work-tree # timeout=10
Fetching changes from the remote Git repository
 > git config remote.origin.url https://github.com/Almathex/QA_Final_clinic # timeout=10
Fetching upstream changes from https://github.com/Almathex/QA_Final_clinic
 > git --version # timeout=10
 > git --version # 'git version 2.17.1'
 > git fetch --tags --progress -- https://github.com/Almathex/QA_Final_clinic +refs/heads/*:refs/remotes/origin/* # timeout=10
 > git rev-parse refs/remotes/origin/main^{commit} # timeout=10
Checking out Revision ca17c053f4b57d763fddd4b471ce5c393577d521 (refs/remotes/origin/main)
 > git config core.sparsecheckout # timeout=10
 > git checkout -f ca17c053f4b57d763fddd4b471ce5c393577d521 # timeout=10
Commit message: "Update README.md"
 > git rev-list --no-walk 5b0a714def3045b670ac407bd64b399bc3bf8189 # timeout=10
[Pipeline] }
[Pipeline] // stage
[Pipeline] withEnv
[Pipeline] {
[Pipeline] stage
[Pipeline] { (Dependencies)
[Pipeline] sh
+ sudo bash ./scripts/dependencies.sh
Running Prerequisites

WARNING: apt does not have a stable CLI interface. Use with caution in scripts.

Hit:1 http://azure.archive.ubuntu.com/ubuntu bionic InRelease
Get:2 http://azure.archive.ubuntu.com/ubuntu bionic-updates InRelease [88.7 kB]
Get:3 http://azure.archive.ubuntu.com/ubuntu bionic-backports InRelease [74.6 kB]
Hit:4 https://apt.releases.hashicorp.com bionic InRelease
Hit:5 https://download.docker.com/linux/ubuntu bionic InRelease
Hit:6 https://packages.microsoft.com/repos/azure-cli bionic InRelease
Get:7 http://security.ubuntu.com/ubuntu bionic-security InRelease [88.7 kB]
Hit:8 https://deb.nodesource.com/node_12.x bionic InRelease
Fetched 252 kB in 2s (166 kB/s)
Reading package lists...
Building dependency tree...
Reading state information...
1 package can be upgraded. Run 'apt list --upgradable' to see it.
./scripts/dependencies.sh: line 10: sudp: command not found
Reading package lists...
Building dependency tree...
Reading state information...
curl is already the newest version (7.58.0-2ubuntu3.12).
The following packages were automatically installed and are no longer required:
  gyp javascript-common libc-ares2 libhttp-parser2.7.1 libjs-async
  libjs-inherits libjs-jquery libjs-node-uuid libjs-underscore libssl1.0-dev
  libuv1-dev node-abbrev node-ansi node-ansi-color-table node-archy node-async
  node-balanced-match node-block-stream node-brace-expansion
  node-builtin-modules node-combined-stream node-concat-map node-cookie-jar
  node-delayed-stream node-forever-agent node-form-data node-fs.realpath
  node-fstream node-fstream-ignore node-github-url-from-git node-glob
  node-graceful-fs node-gyp node-hosted-git-info node-inflight node-inherits
  node-ini node-is-builtin-module node-isexe node-json-stringify-safe
  node-lockfile node-lru-cache node-mime node-minimatch node-mkdirp
  node-mute-stream node-node-uuid node-nopt node-normalize-package-data
  node-npmlog node-once node-osenv node-path-is-absolute node-pseudomap
  node-qs node-read node-read-package-json node-request node-retry node-rimraf
  node-semver node-sha node-slide node-spdx-correct node-spdx-expression-parse
  node-spdx-license-ids node-tar node-tunnel-agent node-underscore
  node-validate-npm-package-license node-which node-wrappy node-yallist
  nodejs-doc python-pkg-resources
Use 'sudo apt autoremove' to remove them.
0 upgraded, 0 newly installed, 0 to remove and 1 not upgraded.

WARNING: apt does not have a stable CLI interface. Use with caution in scripts.

Reading package lists...
Building dependency tree...
Reading state information...
unzip is already the newest version (6.0-21ubuntu1.1).
wget is already the newest version (1.19.4-1ubuntu2.2).
The following packages were automatically installed and are no longer required:
  gyp javascript-common libc-ares2 libhttp-parser2.7.1 libjs-async
  libjs-inherits libjs-jquery libjs-node-uuid libjs-underscore libssl1.0-dev
  libuv1-dev node-abbrev node-ansi node-ansi-color-table node-archy node-async
  node-balanced-match node-block-stream node-brace-expansion
  node-builtin-modules node-combined-stream node-concat-map node-cookie-jar
  node-delayed-stream node-forever-agent node-form-data node-fs.realpath
  node-fstream node-fstream-ignore node-github-url-from-git node-glob
  node-graceful-fs node-gyp node-hosted-git-info node-inflight node-inherits
  node-ini node-is-builtin-module node-isexe node-json-stringify-safe
  node-lockfile node-lru-cache node-mime node-minimatch node-mkdirp
  node-mute-stream node-node-uuid node-nopt node-normalize-package-data
  node-npmlog node-once node-osenv node-path-is-absolute node-pseudomap
  node-qs node-read node-read-package-json node-request node-retry node-rimraf
  node-semver node-sha node-slide node-spdx-correct node-spdx-expression-parse
  node-spdx-license-ids node-tar node-tunnel-agent node-underscore
  node-validate-npm-package-license node-which node-wrappy node-yallist
  nodejs-doc python-pkg-resources
Use 'sudo apt autoremove' to remove them.
0 upgraded, 0 newly installed, 0 to remove and 1 not upgraded.
Installing Azure-CLI
Hit:1 http://azure.archive.ubuntu.com/ubuntu bionic InRelease
Get:2 http://azure.archive.ubuntu.com/ubuntu bionic-updates InRelease [88.7 kB]
Get:3 http://azure.archive.ubuntu.com/ubuntu bionic-backports InRelease [74.6 kB]
Hit:4 https://apt.releases.hashicorp.com bionic InRelease
Hit:5 https://download.docker.com/linux/ubuntu bionic InRelease
Hit:6 https://deb.nodesource.com/node_12.x bionic InRelease
Hit:7 https://packages.microsoft.com/repos/azure-cli bionic InRelease
Get:8 http://security.ubuntu.com/ubuntu bionic-security InRelease [88.7 kB]
Fetched 252 kB in 1s (353 kB/s)
Reading package lists...
Reading package lists...
Building dependency tree...
Reading state information...
lsb-release is already the newest version (9.20170808ubuntu1).
curl is already the newest version (7.58.0-2ubuntu3.12).
gnupg is already the newest version (2.2.4-1ubuntu1.3).
apt-transport-https is already the newest version (1.6.12ubuntu0.2).
The following packages were automatically installed and are no longer required:
  gyp javascript-common libc-ares2 libhttp-parser2.7.1 libjs-async
  libjs-inherits libjs-jquery libjs-node-uuid libjs-underscore libssl1.0-dev
  libuv1-dev node-abbrev node-ansi node-ansi-color-table node-archy node-async
  node-balanced-match node-block-stream node-brace-expansion
  node-builtin-modules node-combined-stream node-concat-map node-cookie-jar
  node-delayed-stream node-forever-agent node-form-data node-fs.realpath
  node-fstream node-fstream-ignore node-github-url-from-git node-glob
  node-graceful-fs node-gyp node-hosted-git-info node-inflight node-inherits
  node-ini node-is-builtin-module node-isexe node-json-stringify-safe
  node-lockfile node-lru-cache node-mime node-minimatch node-mkdirp
  node-mute-stream node-node-uuid node-nopt node-normalize-package-data
  node-npmlog node-once node-osenv node-path-is-absolute node-pseudomap
  node-qs node-read node-read-package-json node-request node-retry node-rimraf
  node-semver node-sha node-slide node-spdx-correct node-spdx-expression-parse
  node-spdx-license-ids node-tar node-tunnel-agent node-underscore
  node-validate-npm-package-license node-which node-wrappy node-yallist
  nodejs-doc python-pkg-resources
Use 'apt autoremove' to remove them.
0 upgraded, 0 newly installed, 0 to remove and 1 not upgraded.
Hit:1 http://azure.archive.ubuntu.com/ubuntu bionic InRelease
Get:2 http://azure.archive.ubuntu.com/ubuntu bionic-updates InRelease [88.7 kB]
Get:3 http://azure.archive.ubuntu.com/ubuntu bionic-backports InRelease [74.6 kB]
Hit:4 https://download.docker.com/linux/ubuntu bionic InRelease
Hit:5 https://apt.releases.hashicorp.com bionic InRelease
Hit:6 https://deb.nodesource.com/node_12.x bionic InRelease
Hit:7 https://packages.microsoft.com/repos/azure-cli bionic InRelease
Get:8 http://security.ubuntu.com/ubuntu bionic-security InRelease [88.7 kB]
Fetched 252 kB in 1s (356 kB/s)
Reading package lists...
Reading package lists...
Building dependency tree...
Reading state information...
azure-cli is already the newest version (2.17.1-1~bionic).
The following packages were automatically installed and are no longer required:
  gyp javascript-common libc-ares2 libhttp-parser2.7.1 libjs-async
  libjs-inherits libjs-jquery libjs-node-uuid libjs-underscore libssl1.0-dev
  libuv1-dev node-abbrev node-ansi node-ansi-color-table node-archy node-async
  node-balanced-match node-block-stream node-brace-expansion
  node-builtin-modules node-combined-stream node-concat-map node-cookie-jar
  node-delayed-stream node-forever-agent node-form-data node-fs.realpath
  node-fstream node-fstream-ignore node-github-url-from-git node-glob
  node-graceful-fs node-gyp node-hosted-git-info node-inflight node-inherits
  node-ini node-is-builtin-module node-isexe node-json-stringify-safe
  node-lockfile node-lru-cache node-mime node-minimatch node-mkdirp
  node-mute-stream node-node-uuid node-nopt node-normalize-package-data
  node-npmlog node-once node-osenv node-path-is-absolute node-pseudomap
  node-qs node-read node-read-package-json node-request node-retry node-rimraf
  node-semver node-sha node-slide node-spdx-correct node-spdx-expression-parse
  node-spdx-license-ids node-tar node-tunnel-agent node-underscore
  node-validate-npm-package-license node-which node-wrappy node-yallist
  nodejs-doc python-pkg-resources
Use 'apt autoremove' to remove them.
0 upgraded, 0 newly installed, 0 to remove and 1 not upgraded.
Install Docker
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed

  0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0
100 13857  100 13857    0     0   270k      0 --:--:-- --:--:-- --:--:--  270k
# Executing docker install script, commit: 3d8fe77c2c46c5b7571f94b42793905e5b3e42e4
Warning: the "docker" command appears to already exist on this system.

If you already have Docker installed, this script can cause trouble, which is
why we're displaying this warning and provide the opportunity to cancel the
installation.

If you installed the current Docker package using this script and are using it
again to update Docker, you can safely ignore this message.

You may press Ctrl+C now to abort this script.
+ sleep 20
+ sh -c 'apt-get update -qq >/dev/null'
+ sh -c 'DEBIAN_FRONTEND=noninteractive apt-get install -y -qq apt-transport-https ca-certificates curl >/dev/null'
+ sh -c 'curl -fsSL "https://download.docker.com/linux/ubuntu/gpg" | apt-key add -qq - >/dev/null'
Warning: apt-key output should not be parsed (stdout is not a terminal)
+ sh -c 'echo "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable" > /etc/apt/sources.list.d/docker.list'
+ sh -c 'apt-get update -qq >/dev/null'
+ '[' -n '' ']'
+ sh -c 'apt-get install -y -qq --no-install-recommends docker-ce >/dev/null'
+ sh -c 'docker version'
Client: Docker Engine - Community
 Version:           20.10.2
 API version:       1.41
 Go version:        go1.13.15
 Git commit:        2291f61
 Built:             Mon Dec 28 16:17:32 2020
 OS/Arch:           linux/amd64
 Context:           default
 Experimental:      true

Server: Docker Engine - Community
 Engine:
  Version:          20.10.2
  API version:      1.41 (minimum version 1.12)
  Go version:       go1.13.15
  Git commit:       8891c58
  Built:            Mon Dec 28 16:15:09 2020
  OS/Arch:          linux/amd64
  Experimental:     false
 containerd:
  Version:          1.4.3
  GitCommit:        269548fa27e0089a8b8278fc4fc781d7f65a939b
 runc:
  Version:          1.0.0-rc92
  GitCommit:        ff819c7e9184c13b7c2607fe6c30ae19403a7aff
 docker-init:
  Version:          0.19.0
  GitCommit:        de40ad0
If you would like to use Docker as a non-root user, you should now consider
adding your user to the "docker" group with something like:

  sudo usermod -aG docker your-user

Remember that you will have to log out and back in for this to take effect!

WARNING: Adding a user to the "docker" group will grant the ability to run
         containers which can be used to obtain root privileges on the
         docker host.
         Refer to https://docs.docker.com/engine/security/security/#docker-daemon-attack-surface
         for more information.
Install Docker Compose
./scripts/dependencies.sh: line 22: jq: command not found
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed

  0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0
100     9  100     9    0     0     40      0 --:--:-- --:--:-- --:--:--    40
Installing kubectl
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed

  0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0
100 38.3M  100 38.3M    0     0   119M      0 --:--:-- --:--:-- --:--:--  119M
Refreshing Angular
removed 254 packages in 1.926s
npm ERR! As of npm@5, the npm cache self-heals from corruption issues and data extracted from the cache is guaranteed to be valid. If you want to make sure everything is consistent, use 'npm cache verify' instead. On the other hand, if you're debugging an issue with the installer, you can use `npm install --cache /tmp/empty-cache` to use a temporary cache instead of nuking the actual one.
npm ERR! 
npm ERR! If you're sure you want to delete the entire cache, rerun this command with --force.

npm ERR! A complete log of this run can be found in:
npm ERR!     /home/jenkins/.npm/_logs/2021-01-13T16_30_47_156Z-debug.log
npm WARN deprecated debug@4.2.0: Debug versions >=3.2.0 <3.2.7 || >=4 <4.3.1 have a low-severity ReDos regression when used in a Node.js environment. It is recommended you upgrade to 3.2.7 or 4.3.1. (https://github.com/visionmedia/debug/issues/797)
npm WARN deprecated request@2.88.2: request has been deprecated, see https://github.com/request/request/issues/3142
npm WARN deprecated har-validator@5.1.5: this library is no longer supported
/usr/bin/ng -> /usr/lib/node_modules/@angular/cli/bin/ng

> @angular/cli@11.0.6 postinstall /usr/lib/node_modules/@angular/cli
> node ./bin/postinstall/script.js

+ @angular/cli@11.0.6
added 254 packages from 201 contributors in 8.088s
Installing Testing Frameworks
npm WARN saveError ENOENT: no such file or directory, open '/home/jenkins/.jenkins/workspace/final-project/package.json'
npm WARN enoent ENOENT: no such file or directory, open '/home/jenkins/.jenkins/workspace/final-project/package.json'
npm WARN final-project No description
npm WARN final-project No repository field.
npm WARN final-project No README data
npm WARN final-project No license field.
npm WARN optional SKIPPING OPTIONAL DEPENDENCY: fsevents@2.3.1 (node_modules/fsevents):
npm WARN notsup SKIPPING OPTIONAL DEPENDENCY: Unsupported platform for fsevents@2.3.1: wanted {"os":"darwin","arch":"any"} (current: {"os":"linux","arch":"x64"})

+ karma@5.2.3
updated 1 package and audited 248 packages in 1.189s

7 packages are looking for funding
  run `npm fund` for details

found 0 vulnerabilities

npm WARN deprecated request@2.88.2: request has been deprecated, see https://github.com/request/request/issues/3142
npm WARN deprecated har-validator@5.1.5: this library is no longer supported
/usr/bin/protractor -> /usr/lib/node_modules/protractor/bin/protractor
/usr/bin/webdriver-manager -> /usr/lib/node_modules/protractor/bin/webdriver-manager
+ protractor@7.0.0
updated 1 package in 3.416s
installing java

WARNING: apt does not have a stable CLI interface. Use with caution in scripts.

Reading package lists...
Building dependency tree...
Reading state information...
default-jdk is already the newest version (2:1.11-68ubuntu1~18.04.1).
The following packages were automatically installed and are no longer required:
  gyp javascript-common libc-ares2 libhttp-parser2.7.1 libjs-async
  libjs-inherits libjs-jquery libjs-node-uuid libjs-underscore libssl1.0-dev
  libuv1-dev node-abbrev node-ansi node-ansi-color-table node-archy node-async
  node-balanced-match node-block-stream node-brace-expansion
  node-builtin-modules node-combined-stream node-concat-map node-cookie-jar
  node-delayed-stream node-forever-agent node-form-data node-fs.realpath
  node-fstream node-fstream-ignore node-github-url-from-git node-glob
  node-graceful-fs node-gyp node-hosted-git-info node-inflight node-inherits
  node-ini node-is-builtin-module node-isexe node-json-stringify-safe
  node-lockfile node-lru-cache node-mime node-minimatch node-mkdirp
  node-mute-stream node-node-uuid node-nopt node-normalize-package-data
  node-npmlog node-once node-osenv node-path-is-absolute node-pseudomap
  node-qs node-read node-read-package-json node-request node-retry node-rimraf
  node-semver node-sha node-slide node-spdx-correct node-spdx-expression-parse
  node-spdx-license-ids node-tar node-tunnel-agent node-underscore
  node-validate-npm-package-license node-which node-wrappy node-yallist
  nodejs-doc python-pkg-resources
Use 'sudo apt autoremove' to remove them.
0 upgraded, 0 newly installed, 0 to remove and 1 not upgraded.
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (Terraform)
[Pipeline] sh
+ bash ./scripts/terraform.sh
Merged "cluster" as current context in /home/jenkins/.kube/config

[0m[1mInitializing the backend...[0m

[0m[1mInitializing provider plugins...[0m
- Reusing previous version of hashicorp/azurerm from the dependency lock file
- Installing hashicorp/azurerm v2.42.0...
- Installed hashicorp/azurerm v2.42.0 (signed by HashiCorp)

[0m[1m[32mTerraform has been successfully initialized![0m[32m[0m
[0m[32m
You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.[0m
[0m[1mazurerm_resource_group.example: Refreshing state... [id=/subscriptions/20a1ca94-0a41-49b5-8df0-4ebef9f75c23/resourceGroups/finalproject][0m
[0m[1mazurerm_kubernetes_cluster.example: Refreshing state... [id=/subscriptions/20a1ca94-0a41-49b5-8df0-4ebef9f75c23/resourcegroups/finalproject/providers/Microsoft.ContainerService/managedClusters/cluster][0m

[0m[1m[32mNo changes. Infrastructure is up-to-date.[0m[32m

This means that Terraform did not detect any differences between your
configuration and real physical resources that exist. As a result, no
actions need to be performed.[0m
[0m[1mazurerm_resource_group.example: Refreshing state... [id=/subscriptions/20a1ca94-0a41-49b5-8df0-4ebef9f75c23/resourceGroups/finalproject][0m
[0m[1mazurerm_kubernetes_cluster.example: Refreshing state... [id=/subscriptions/20a1ca94-0a41-49b5-8df0-4ebef9f75c23/resourcegroups/finalproject/providers/Microsoft.ContainerService/managedClusters/cluster][0m
[0m[1m[32m
Apply complete! Resources: 0 added, 0 changed, 0 destroyed.[0m
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (Deploy)
[Pipeline] sh
+ bash ./scripts/deploy.sh
deployment.apps "mysql" deleted
service "mysql" deleted
deployment.apps "backend" deleted
service "backend" deleted
deployment.apps "frontend" deleted
service "frontend" deleted
deployment.apps "nginx" deleted
service "nginx" deleted
deployment.apps/mysql created
service/mysql created
deployment.apps/backend created
service/backend created
deployment.apps/frontend created
service/frontend created
deployment.apps/nginx created
service/nginx created
[Pipeline] }
[Pipeline] // stage
[Pipeline] }
[Pipeline] // withEnv
[Pipeline] }
[Pipeline] // node
[Pipeline] End of Pipeline
Finished: SUCCESS

```

### Known Issues

Kubernetes cluster required a _rollout restart_ of the deployment to run all pods successfully and deploy.


### Future Improvements

### Expenses

To calculate expenses, we used the Azure pricing calculator.
The costed components of our project are:

**1x Ubuntu Linux VM of size Standard D2s_v3**: £63.15 per month*  \
**1x Azure Kubernetes Cluster node of size Standard D2s_v3**: £63.11 per month*

*where a month is defined as a 730 hour period

**Total Cost** £126.26 per month

To improve costs, we could reserve the VM for a year (saving up to 37% in the process) once we were sure of demand and storage needs (as opposed to PAYG)
Right-sizing the Kubernetes pods to ensure they have limits preventing them from consuming too many resources and scaling back on VM size as necessary could also save money.

Here is a screenshot of the costing breakdown on Azure:

![costing][costing]


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
[costing]: https://imgur.com/wBZNkpm.png
[trello]: https://imgur.com/MuKtvvw.png
