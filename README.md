## Required -Installing, updating, and uninstalling the AWS CLI version 2 on macOS
https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2-mac.html
https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-quickstart.html


## Folder Structure
```
├── modules
│   ├── alb
│   │   ├── main.tf
│   │   ├── output.tf
│   │   └── variables.tf
│   ├── dns_zone
│   │   ├── main.tf
│   │   ├── output.tf
│   │   └── variable.tf
│   ├── ec2
│   │   ├── main.tf
│   │   ├── output.tf
│   │   ├── template
│   │   │   └── userdata.sh
│   │   └── variables.tf
│   └── vpc
│       ├── main.tf
│       ├── output.tf
│       ├── securitygroup.tf
│       └── variables.tf
├── output.tf
├── provider.tf
├── terraform.auto.tfvars
└── variables.tf
```

## Variables
----
All the variables are declared in `terraform.auto.tfvars` file

<br />

### api_lambda_function variables 
----
| Variable Name                             | Explanation   |
| :---                                      | :---          |
| AWS_REGION                   | aws region to deploy infra |
| VPC_CIDR                    | vpc cidr |
| PUBLIC_SUBNET                    | public subnets cidr |
| AWS_INSTANCE_TYPE                    | instance type to launch |
| KEYPAIR_NAME                    | keypair name |
| AMIS                    | ami id |



## Terraform Version
    Terraform => v0.14


## Deploying Infra
----
To deploy terraform infra run the following commands.

    terraform init                     #Initializing terraform
    terraform plan                     #Used to see what resources are being made
    terraform apply                    #above plan will be executed   



## Deleting Infra
----    

Infrastructure will be destroyed using following command. 
    
    terraform destroy
