// Jenkinsfile (Declarative Pipeline)
pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                git branch: 'feature/feature1', credentialsId: 'github_asantamolison4921', url: 'https://github.com/asantamolison4921/prog8860-midterm-alfred.git'
                sh "ls -lat"
            }
        }
        stage('Build Application') {
            steps {
                withMaven {
                    sh "mvn clean && mvn compile"
                }
            }
        }
        stage('Unit Test') {
            steps {
                withMaven {
                    sh "mvn test"
                }
            }
        }
        stage('Package App') {
            steps {
                withMaven {
                    sh "mvn package -DskipTests -Dmaven.test.skip=true"
                }
            }
        }
        stage('Build Docker Image') {
            steps {
                sh "docker build -t asantamolison4921/prog8860-midterm-alfred:latest ."
            }
        }
        stage('Docker Publish') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub_asantamolison4921', passwordVariable: 'dockerHubPassword', usernameVariable: 'dockerHubUser')]) {
                    sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPassword}"
                    sh 'docker push asantamolison4921/prog8860-midterm-alfred:latest'
                }
            }
        }
        stage('Run Container') {
            steps {
                sh "docker run -d -p 80:8080 asantamolison4921/prog8860-midterm-alfred:latest"
            }
        }
    }
}
