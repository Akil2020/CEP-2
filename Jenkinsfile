pipeline {
    agent any
    stages{
        stage('GIT CHECKOUT'){
            steps{
                git url:'https://github.com/Akil2020/CEP-2', branch: "main"
            }
        }
        stage('BUILD DOCKER IMAGE'){
            steps{
                script{
                    sh 'docker build -t akil1991/achistarwebapp:v1 .'
                }
            }
        }
          stage('DOCKER PUSH IMAGE') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerpat', passwordVariable: 'PASS', usernameVariable: 'USER')]) {
                    sh "echo $PASS | docker login -u $USER --password-stdin"
                    sh 'docker push akil1991/achistarwebapp:v1'
                }
            }
        }
        stage('DEPLOY WEBAPP K8S'){
            when{ expression {env.GIT_BRANCH == 'origin/main'}}
            steps{
                script{
                     kubernetesDeploy (configs: 'deploymentservice.yml' ,kubeconfigId: 'k8sconfigpwd')
                   
                }
            }
        }
    }
}
