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

Write-host "`nInventory Group1" -ForegroundColor green
$Inventory.Group1

Write-host "`nInventory Group1 variables" -ForegroundColor green
$Inventory.Group1.Vars

Write-host "`nInventory Group1 Hosts" -ForegroundColor green
$Inventory.Group1.Hosts

Write-host "`nInventory Group1 Esxi01 Host Vars" -ForegroundColor green
$Inventory.Group1.Hosts.esxi01.vars


write-host "----"
$Inventory.GroupAZ.vars