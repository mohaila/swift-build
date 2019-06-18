# Docker image for building Swift 5 projects

## Steps to build Swift projects
- Start by downloading swift 5.0.1 release for Ubuntu 18.04 in the current directory.
 - Build Swift build image by the command:
 ```bash
 docker build -t swift-build:5.0.1
 ```
 - After building the image, build your project by the command:
 ```bash
 cd YourSwiftProjectPath
 docker run -it -v $PWD:/build swift-build:5.0.1
 ```
 This command will start a container, clean your project, fetch dependencies, build, test and run your application.
 
 Tested on Ubuntu 18.04 and MacOS.
