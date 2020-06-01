#Azure with consul and terraform example
This is to provide small example to create infrastructure on Azure with terraform by reading variables from Consul and saving its state in Consul.

We are using Consul as key/value store only.
In this example we will create an empty availabilty set in azure.

**Prerequisite:**

1) Account in Azure portal. Create test resource group.

2) Install Consul
(https://www.consul.io/docs/install)

3) Install Terraform
(https://learn.hashicorp.com/terraform/getting-started/install.html)


**Procedure**

1. For convenient purpose we will authorize terraform with azure using azure cli.

    `az login`
2. Start the consul in dev mode. Since this is for test purpose we will start in "-dev" mode. 

   `consul agent -dev` 

   Terraform state and variables are not stored permanently. Once consul is stopped data is lost. Open the terminal session
   untill this lesson is completed.

   Open the Consul URL http://localhost:8500/
   
3. From top menu click __Key/value__, create 'variables' folder. In 'variables' folder create key-values called 

   - 'as-name' : Availabilty set name.
   - 'rg'      : Resource group name


4. Download the main.tf and variables.tf files from this repo. Provide your subscription and tenant id. Execute terraform commands

   `terraform init` 
   
   `terraform plan` 
   
   `terraform apply` 
   
 Goto the Consul URL, you will see terraform state key/value will be created. 
 If you close the Consul session data will be lost.


This can be extended with Consul Server-Agent mode to make data persistent and enabling ACL for secure access.
