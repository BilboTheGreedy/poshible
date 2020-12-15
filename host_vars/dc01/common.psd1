@{
    IP = ($inventory.vars.subnets.dc | Get-Subnet).HostAddresses[0]
    SubnetMask = ($inventory.vars.subnets.dc | Get-Subnet).SubnetMask.IPAddressToString
    Gateway = (($inventory.vars.subnets.dc | Get-Subnet).HostAddresses | select -Last 1)
    Password =  $Vault.InstallPassword
}