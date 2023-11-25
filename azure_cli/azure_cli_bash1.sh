#!/bin/zsh
#git remote show origin
#git remote set-url origin <url>
#git remote set-url --push origin <url>
LOCATION=$(az group show --name 'NetworkWatcherRG' --query location --out tsv)
RGNAME='NetworkWatcherRG'
az group create --name $RGNAME --location $LOCATION
az group show --name $RGNAME
az group show --name $RGNAME --location $LOCATION
DISKNAME='az104-disk1'
az disk create \
--resource-group $RGNAME \
--name $DISKNAME \
--sku 'Standard_LRS' \
--size-gb 32
az disk show --resource-group $RGNAME --name $DISKNAME
az disk update --resource-group $RGNAME --name $DISKNAME --size-gb 64
az disk show --resource-group $RGNAME --name $DISKNAME --query diskSizeGb
az disk update --resource-group $RGNAME --name $DISKNAME --sku 'Premium_LRS'
az disk show --resource-group $RGNAME --name $DISKNAME --query sku
az disk delete --resource-group $RGNAME --disk-name $DISKNAME