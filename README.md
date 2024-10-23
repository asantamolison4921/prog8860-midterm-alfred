# PROG8860-24F-Sec1
## Midterm - Practical


### Structure of the repository

```shell
prog8860-midterm-alfred
├── Dockerfile
├── pom.xml
├── README.md
├── src
│   ├── main
│   │   ├── java
│   │   │   └── com
│   │   │       └── alfred
│   │   │           └── midterm
│   │   │               ├── HelloWorldApplication.java
│   │   │               └── HelloWorldController.java
│   │   └── resources
│   │       └── templates
│   │           └── hello.html
│   └── test
│       └── java
│           └── com
│               └── alfred
│                   └── midterm
│                       ├── HelloWorldApplicationTests.java
│                       └── HelloWorldControllerTests.java
└── target
```

### Structure of compiled files inside target directory (not part of GitHub repository)

```shell
prog8860-midterm-alfred
└── target
    ├── classes
    │   ├── com
    │   │   └── alfred
    │   │       └── midterm
    │   │           ├── HelloWorldApplication.class
    │   │           └── HelloWorldController.class
    │   └── templates
    │       └── hello.html
    ├── generated-sources
    │   └── annotations
    ├── generated-test-sources
    │   └── test-annotations
    ├── maven-archiver
    │   └── pom.properties
    ├── maven-status
    │   └── maven-compiler-plugin
    │       ├── compile
    │       │   └── default-compile
    │       │       ├── createdFiles.lst
    │       │       └── inputFiles.lst
    │       └── testCompile
    │           └── default-testCompile
    │               ├── createdFiles.lst
    │               └── inputFiles.lst
    ├── prog8860-midterm-alfred-SNAPSHOT.jar
    ├── prog8860-midterm-alfred-SNAPSHOT.jar.original
    ├── surefire-reports
    │   ├── com.alfred.midterm.HelloWorldApplicationTests.txt
    │   ├── com.alfred.midterm.HelloWorldControllerTests.txt
    │   ├── TEST-com.alfred.midterm.HelloWorldApplicationTests.xml
    │   └── TEST-com.alfred.midterm.HelloWorldControllerTests.xml
    └── test-classes
        └── com
            └── alfred
                └── midterm
                    ├── HelloWorldApplicationTests.class
                    └── HelloWorldControllerTests.class
```
### Instructions on how to build and run the application.

From the root directory of the repo (prog8860-midterm-alfred), run the commands below under Linux environment;

Note - Need the latest JDK and Maven installed as pre-requisites

```
# Step 1 - build / compile the application
mvn clean && mvn compile

# Step 2 - run unit test cases
mvn test

# Step 3 - package the application (building the jar file)
mvn package -DskipTests -Dmaven.test.skip=true

# Step 4 - building the docker image
# I gave the image name "prog8860-midterm-alfred" and tag "latest"
docker build -t asantamolison4921/prog8860-midterm-alfred:latest .

# Step 5 - publishing the image to docker registry
# I have used my personal docker registry for this
docker push asantamolison4921/prog8860-midterm-alfred:latest

# Step 6 - Running the container in detatched (background) mode
# The application will be running in 80 port and can be accessed by going to http://ip_address:80 in the browser
docker run -d --name prog8860-midterm-container -p 80:8080 asantamolison4921/prog8860-midterm-alfred:latest
```

### Steps to test CI pipeline (GitHub Actions).

the workflow file `ci.yml` is created to perform GitHub actions. To see the file in action, either;
 - changes need to be pushed (on push) to main branch
 - pull request created (on pull request) to main branch
 - Docker Hub credentials need to be stored under DOCKERHUB_USERNAME and DOCKERHUB_PASSWORD as Repository secrets

### Instructions on how to pull the Docker image from the registry

image is available at asantamolison4921/prog8860-midterm-alfred:latest

### Instructions on how to run the Jenkins pipeline.

Jenkins pipeline script (declarative) is available in the Jenkinsfile
Note - Jenkins secret manager is used to store GitHub and Docker Hub credentials
