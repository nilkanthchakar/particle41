Task1: 

In order to run the application one can use the first directory and have it running. 
Just running a docker build would build the image and docker run would be enough to get the app running inside a container.

Task 2: 

One needs to have the below things in place to run the terraform setup done.
1. Access keys for AWS configured with the required permissions.
2. Made a separate file for backend as that would help one to directly change the content as per the comfort.
3. Please have a dynamo db and s3 bucket in place.

One's all the above three are done terraform init and apply are enough to get the application running.
