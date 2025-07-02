## We are creating a 2 tier web application
### Tools I used
### Terraform
### S3
### DynamoDB
### VPC
### Cloud Front
### ALB
### ASG
### NAT
### RDS
### Route53
> ![Alt text](images/architecture.gif?raw=true "The architecture diagram")
## Create a root folder and module folder
```sh
mkdir root && module
```
# On the root
Create a main file and provider file
## Create a backend state file
- We take the code from terraform documentation
> https://developer.hashicorp.com/terraform/language/backend/s3
### Create a Dynamo DB table for state file locking
- Give the table a name
- Make sure to add a `Partition key` with the name `LockID` and type as `String`
## Create all the modules needed
- On the main, create all the modules required
# On the module folder
- On the modules, create all the modules needed
### Take note
### Generate a public-private key pair for our instances
We need a public key and a private key for our server so please follow the procedure I've included below.

```sh
cd modules/key/
ssh-keygen
```
### ACM certificate
Go to AWS console --> AWS Certificate Manager (ACM) and make sure you have a valid certificate in Issued status, if not, feel free to create one and use the domain name on which you are planning to host your application.
### Route 53 Hosted Zone
Go to AWS Console --> Route53 --> Hosted Zones and ensure you have a public hosted zone available. Copy the CNAME name and value on ACM to Route 53 to ensure the status is Issued
- This might take a while

## Deploy our application on the cloud 
get into the project directory 
```sh
cd root
```
Install dependency to deploy the application 

```sh
terraform init 
```

- See the plan of the execution 
```sh
terraform plan
```

- Finally, Deploy the application...
```sh
terraform apply 
```






