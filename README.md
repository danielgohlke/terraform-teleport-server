# Note 
### Please take care about the Route53 part, if you dont want to use that rename the file


https://www.terraform.io/docs/providers/aws/#environment-variables
```
export AWS_ACCESS_KEY_ID="<ACCESS_KEY>"
export AWS_SECRET_ACCESS_KEY="<SECRET_KEY>"
```
or using AWS Profile.

`~/.aws/credentials`
```bash
[myprofile]
aws_access_key_id     = ACCESS_KEY
aws_secret_access_key = SECRET_KEY
```


In Terraform 
```bash
provider "aws" {
  profile = "myprofile"
  region  = "${var.region}"
}
```

to deploy the instance type


`terraform init`
`terraform plan`
`terraform apply`


