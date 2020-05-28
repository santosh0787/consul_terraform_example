# consul terraform example
This is to provide small example to create infrastructure on Azure with terraform by reading variables from Consul and saving its state in Consul.

**Prerequisite:**

1) Account in Azure portal. Create test resource group.3. 

2) Install Consul
(https://www.consul.io/docs/install)

3) Install Terraform
(https://learn.hashicorp.com/terraform/getting-started/install.html)


**Procedure**

1. Start the consul in dev mode. Since this is for test purpose we will start in "-dev" mode. 

   `consul agent -dev` 

   Terraform state and variables are not stored permanently. Once consul is stopped data is lost. Open the terminal session
   untill this lesson is completed.

   Open the Consul URL http://localhost:8500/
   
2. From top menu click __Key/value__, create 'variables' folder. In 'variables' folder create key-values called 

   - 'as-name' : Availabilty set name.
   - 'rg'      : Resource group name

Instead of creating variables.tf file we will use above created key/values as variables in terraform code. 

3. Download the main.tf files from this repo and execute terraform commands

   `terraform init`
   `terraform plan`
   `terraform apply`
   
 Goto the Consul URL, you will see terraform state key/value will be created. 
 If you close the Consul session data will be lost.


This can be extended with Consul Server-Agent mode to make data persistent and enabling ACL for secure access.
