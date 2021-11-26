# [Команда DevOPs] | Jenkins библиотека

### Библиотека Jenkins

[Репозиторий](https://github.com/gazprom-neft/Sharedlib-jenkins-dso)
[Репозиторий](https://alm-itsk.gazprom-neft.local:8080/TFS/GPN/DSO_SERVICE/_git/sharedlib-jenkins-dso)


## Начните работу с библиотекой

Чтобы начать работу с библиотекой

#!groovy
 
// import shared library
@Library("dsoLibrary") _

[Pepline]
//docker build
docker build
        @param registry URL of desired docker-registry service
        @param ocpNamespace project OCP namespace
        @param ocpAppName OCP name used for application
        @param gitCommitShort short hash id of used git commit
        @param dockerfileName Dockerfile name
        @param additionalArgs extra variable, should consist of command flag (for ex., -build-arg) and value

//Docker push
        @param registry URL of desired docker-registry service
        @param ocpNamespace project OCP namespace
        @param ocpAppName OCP name used for application
        @param gitCommitShort short hash id of used git commit		

// Typical docker build pipeline: login, build, push
        @param registry URL of desired docker-registry service
        @param ocpNamespace project OCP namespace
        @param ocpAppName OCP name used for application
        @param gitCommitShort short hash id of used git commit
        @param dockerfileName Dockerfile name
        @param additionalArgs extra variable, should consist of command flag (for ex., -build-arg) and value		
