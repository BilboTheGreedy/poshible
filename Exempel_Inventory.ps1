Get-inventory .\inventory.psd1

#Vault needs to be decrypted first since we have 
#vars trying to use it
Decrypt-Vault -Path .\vault.psd1

Get-GroupVars
Get-HostVars



Write-host 'Decrypted Password Vault, stored in $Global:Vault' -ForegroundColor green
$Vault

Write-host "`nInventory base" -ForegroundColor green
$Inventory

Write-host "`nInventory vSAN_Cluster" -ForegroundColor green
$Inventory.vSAN_Cluster

Write-host "`nInventory vSAN_Cluster variables" -ForegroundColor green
$Inventory.vSAN_Cluster.Vars

Write-host "`nInventory vSAN_Cluster Hosts" -ForegroundColor green
$Inventory.vSAN_Cluster.Hosts

Write-host "`nInventory.vSAN_Cluster Esxi01 Host Vars" -ForegroundColor green
$Inventory.vSAN_Cluster.Hosts.esxi01.vars


write-host "----"
$Inventory.GroupAZ.vars

write-host 'Try to browse the inventory variable'
write-host 'write $inventory in the powershell console'