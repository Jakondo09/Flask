#!groovy
 
// import shared library
@Library("dsoLibrary") _
 
// populate variables from folder
withFolderProperties{
    REGISTRY_TRUST = "${env.REGISTRY_TRUST}"
    REGISTRY_TRUST_CRED_ID = "${env.REGISTRY_TRUST_CRED_ID}"
    REGISTRY_DEV = "${env.REGISTRY_DEV}"
    REGISTRY_DEV_CRED_ID = "${env.REGISTRY_DEV_CRED_ID}"
    OCP_NAMESPACE = "${env.OCP_NAMESPACE}"
}
 
if (BUILD_ENVIRONMENT == 'trust') {
    REGISTRY = REGISTRY_TRUST
    REGISTRY_CRED_ID = REGISTRY_TRUST_CRED_ID
}
 
if (BUILD_ENVIRONMENT == 'dev') {
    REGISTRY = REGISTRY_DEV
    REGISTRY_CRED_ID = REGISTRY_DEV_CRED_ID
}
 
pipeline {
    agent {
        label "${BUILD_ENVIRONMENT}"
    }
 
    options {
        buildDiscarder(logRotator(numToKeepStr: '10', artifactNumToKeepStr: '10'))
    }
 
    environment {
        GIT_COMMIT_SHORT = sh(
            script: "printf \$(git rev-parse --short ${GIT_COMMIT})",
            returnStdout: true
        )
    }
 
    stages {
        stage("Set build name") {
            steps {
                // use name of the patchset as the build name
                wrap([$class: 'BuildUser']){
                    script {
                        if ("${params.BRANCH}" == 'null'){
                            buildName "$BUILD_NUMBER-$GIT_COMMIT_SHORT"
                            }
                        else {
                            buildName "$BUILD_NUMBER-$BUILD_ENVIRONMENT-${params.BRANCH}-$GIT_COMMIT_SHORT"
                            }
                            }
                //buildName "$BUILD_NUMBER-$GIT_COMMIT_SHORT"
                    buildDescription "Executed @ ${NODE_NAME}. Build started by ${BUILD_USER}"
                }
            }
        }
 
        stage("Docker registry login") {
            steps {
                echo "=====docker login registry====="
                logMeIn("docker", ["registryCred": "$REGISTRY_CRED_ID", "registry": "$REGISTRY"])
            }
        }
        stage("Docker build image") {
            steps {
                echo "=====docker build====="
                sh """
                docker build -t $REGISTRY/$OCP_NAMESPACE/$OCP_APP_NAME:$GIT_COMMIT_SHORT -f $DOCKERFILE_NAME .
                """
            }
        }
        stage("Docker push image") {
            steps {
                echo "=====docker login and push====="
                sh """
                docker push $REGISTRY/$OCP_NAMESPACE/$OCP_APP_NAME:$GIT_COMMIT_SHORT
                """
            }
        }
    }
}
