FROM maven:3.6.3-jdk-8 


# package our application code 
RUN mvn clean package 

# copy the source tree and the pom.xml to our new container 
COPY target/cargo-tracker.jar ./ 

# set the startup command to execute the jar 
CMD ["java", "-jar", "target/cargo-tracker.jar"]
