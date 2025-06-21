## Create an S3 bucket
1. Create a provider
2. Create the bucket on main
```sh
terraform init
terraform plan
terraform apply
```
> ![Alt text](./images/bucko.png?raw=true "The bucket was successfully created")
1. To ensure the bucket is ready to host a website, it needs to be public
2. We need to turn off block public access 
3. We need to grant anyone access to write to the bucket - Disabling ACLS
> ![Alt text](./images/acls.png?raw=true "The bucket was successfully granted public access")

## Create and index.html and error.html that will be hosted in the bucket
```sh
index.html
error.html
```
## Upload the html files to the bucket
Add the "aws_s3_object" resource to be able to add the index files to bucket
```sh
main.tf
terraform plan
terraform apply -auto-approve
```
