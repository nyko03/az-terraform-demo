# Az Terraform Demo
Basic project with Terraform and Azure provider.

In this example we will create several resources in azure using a basic project structure for terraform.

You can find more information in [terraform/azurerm](https://www.terraform.io/docs/providers/azurerm/index.html).

## Provisioned Resources

- **Resource Group**:   "aztfdemo-poc-rg"
- **Storage Account**:  "aztfdemopocsa01"
- **Key-Vault**:        "aztfdemo-secret-kv"

## Steps

1. Prepare the working directory for use

    ```bash
    $ terraform init
    ```
   [More info](https://www.terraform.io/docs/commands/init.html).
   
2. Configure project variables
   
   Set your own variables values in *./env_vars/local.tfvars*
   
   [More info](https://www.terraform.io/docs/configuration/variables.html).

3. Load environment credentials

    In this point we will insert our current subscription and our user mail in *./env_cred/personalCredentials.sh*
    
    ```bash
    SUBSCRIPTION_NAME=##Subscription Name##
    USER_MAIL=##User account mail##
    
    echo $SUBSCRIPTION_NAME
    echo $USER_MAIL
    ...
    ```
   
   Run source command to load credentials in environment variables
   
   ```bash
   $ source ./env_cred/personalCredentials.sh
   ```
   
4. Create an execution plan
   
    ```bash
    $ terraform plan -var-file=./env_vars/local.tfvars -out az-terraform-demo.tfplan
    ```
   This command create an execution plan and save it in a file named 'az-terraform-demo.tfplan', in addition print in console the result.
   
   [More info](https://www.terraform.io/docs/commands/plan.html).

5. Creating resources in azure

    Executing terraform apply over a saved plan will scans the current .tfplan file and applies the changes appropriately.
    
    ```bash
    $ terraform apply az-terraform-demo.tfplan
    ```

6. Check output values
    
    After provisioning the resources we can check output variables like this:
    
    ```bash
    $ terraform output
    ```
   
