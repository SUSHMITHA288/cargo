FROM maven:3.6.3-jdk-8 

# copy the source tree and the pom.xml to our new container 
COPY ./ ~/var/lib/jenkins/workspace/CI/target/cargo-tracker.jar 

# package our application code 
RUN mvn clean package 

# set the startup command to execute the jar 
CMD ["java", "-jar", "target/cargo-tracker.jar"]
