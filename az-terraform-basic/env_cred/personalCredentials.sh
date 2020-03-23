#subscription name
SUBSCRIPTION_NAME="#subscription name#"
USER_MAIL="#azure user mail"

echo $SUBSCRIPTION_NAME
echo $USER_MAIL

az login

# selecting the right subscription where the key vault is
az account set --subscription $SUBSCRIPTION_NAME

# set tenant_id in ARM from our account
eval export ARM_TENANT_ID=$(az account list --query "[?name=='$SUBSCRIPTION_NAME'].tenantId | [0]")

# set subscription_id in ARM from our account
eval export ARM_SUBSCRIPTION_ID=$(az account list --query "[?name=='$SUBSCRIPTION_NAME'].id | [0]")

# set vars in terraform context
export TF_VAR_subscription_id=$ARM_SUBSCRIPTION_ID
export TF_VAR_tenant_id=$ARM_TENANT_ID

#azure get object_id
eval export TF_VAR_object_id=$(az ad user show --id $USER_MAIL --query "objectId")

echo $TF_VAR_subscription_id
echo $TF_VAR_tenant_id
echo $TF_VAR_object_id
