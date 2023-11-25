#--------------------------------------------------------------------------#
New-AzResourceGroup -Name 'Staging_VMs' -Location 'Central US' -Force
$rg = Get-AzResourceGroup -Name "staging_VMs" -Location "Central US"
$definition = Get-AzPolicyDefinition -Id '/providers/Microsoft.Authorization/policyDefinitions/0a914e76-4921-4c19-b460-a2d36003525a'
New-AZPolicyAssignment -Scope $rg.resourceId -PolicyDefinition $definition -Name 'RGLocationMatch' -DisplayName 'Resource group matches resources location'
#--------------------------------------------------------------------------#