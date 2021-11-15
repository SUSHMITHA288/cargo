pipeline {
    agent {
        label "master"
    }
    tools {
        maven "MAVEN_HOME"
    }
    
    stages {
        stage("Maven Build") {
            steps {
                script {
                    sh "mvn package -DskipTests=true"
                }
            }
        }
        //stage("docker image build and publish"){
            //steps{
                //script{
                        //docker.withRegistry('https://registry.hub.docker.com/', 'DockerHub') {
                        //def customImage = docker.build("docker9686/cargo-tracker")
        /* Push the container to the custom Registry */
                        //customImage.push()
                        //}
                //}
            //}
        //}
        
        stage("Maven Deploy") {
            steps {
                script {
                    sh "mvn deploy"
                }
            }
        }
        
        stage('sonar-scanner') {
            steps {
                script {
                    withSonarQubeEnv(credentialsId: 'sonarqube-token', installationName: 'SonarQube'){
                    sh 'mvn org.sonarsource.scanner.maven:sonar-maven-plugin:3.7.0.1746:sonar'
                       }
                    //def sonarqubeScannerHome = tool name: 'SonarQubeScanner', type: 'hudson.plugins.sonar.SonarRunnerInstallation'
                    //withCredentials([string(credentialsId: 'sonarqube-token', variable: 'sonarLogin')]) {
                    //sh "${sonarqubeScannerHome}/bin/sonar-scanner -e -Dsonar.host.url=http://localhost:9000 -Dsonar.login=${sonarLogin} -Dsonar.projectName=net.java -Dsonar.projectVersion=${env.BUILD_NUMBER} -Dsonar.projectKey=net.java -Dsonar.sources=src/main/  -Dsonar.language=java -Dsonar.java.binaries=."
              }
                }
            }
    }
}
