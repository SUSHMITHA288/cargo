pipeline {
    agent {
        label "master"
    }
    tools {
        maven "MAVEN_HOME"
    }
    //environment {
      //  NEXUS_VERSION = "nexus3"
        //NEXUS_PROTOCOL = "http"
     //   NEXUS_URL = "localhost:8081"
       // NEXUS_REPOSITORY = "maven-central-hosted"
       // NEXUS_CREDENTIAL_ID = "NEXUS-CRED"
    //}
    stages {
      //  stage("Clone code from VCS") {
    //        steps {
      //          script {
        //            git 'https://github.com/SUSHMITHA288/cargo.git';
          //      }
            //}
        //}
        stage("docker image build and publish"){
            steps{
                script{
                        docker.withRegistry('https://registry.hub.docker.com/', 'DockerHub') {
                        def customImage = docker.build("docker9686/cargo")
        /* Push the container to the custom Registry */
                        customImage.push()
                        }
                }
            }
        }
        stage("Maven Build") {
            steps {
                script {
                    sh "mvn package -DskipTests=true"
                }
            }
        }
        stage("Maven Deploy") {
            steps {
                script {
                    sh "mvn deploy"
                }
            }
        }
        //stage("Publish to Nexus Repository Manager") {
            //steps {
                //script {
                    //pom = readMavenPom file: "pom.xml";
                    //filesByGlob = findFiles(glob: "target/*.${pom.packaging}");
                    //echo "${filesByGlob[0].name} ${filesByGlob[0].path} ${filesByGlob[0].directory} ${filesByGlob[0].length} ${filesByGlob[0].lastModified}"
                    //artifactPath = filesByGlob[0].path;
                    //artifactExists = fileExists artifactPath;
                    //if(artifactExists) {
                     //   echo "*** File: ${artifactPath}, group: ${pom.groupId}, packaging: ${pom.packaging}, version ${pom.version}";
                       // nexusArtifactUploader(
                     //       nexusVersion: NEXUS_VERSION,
                       //     protocol: NEXUS_PROTOCOL,
                       //     nexusUrl: NEXUS_URL,
                        //    groupId: pom.groupId,
                         //   version: pom.version,
                          //  repository: NEXUS_REPOSITORY,
                           // credentialsId: NEXUS_CREDENTIAL_ID,
                           // artifacts: [
                             //   [artifactId: pom.artifactId,
                               // classifier: '',
                               // file: artifactPath,
                                //type: pom.packaging],
                                //[artifactId: pom.artifactId,
                                //classifier: '',
                                //file: "pom.xml",
                               // type: "pom"]
                           // ]
             //           );
               //     } else {
                 //       error "*** File: ${artifactPath}, could not be found";
                   // }
               // }
           // }
       // }
        stage('sonar-scanner') {
            steps {
                script {
                    def sonarqubeScannerHome = tool name: 'SonarQubeScanner', type: 'hudson.plugins.sonar.SonarRunnerInstallation'
                    withCredentials([string(credentialsId: 'sonarqube-token', variable: 'sonarLogin')]) {
                    sh "${sonarqubeScannerHome}/bin/sonar-scanner -e -Dsonar.host.url=http://localhost:9000 -Dsonar.login=${sonarLogin} -Dsonar.projectName=net.java -Dsonar.projectVersion=${env.BUILD_NUMBER} -Dsonar.projectKey=net.java -Dsonar.sources=src/main/  -Dsonar.language=java -Dsonar.java.binaries=."
              }
                }
            }
    }
    }
}
