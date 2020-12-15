@{
    IP = ($inventory.vars.subnets.lus | Get-Subnet).HostAddresses[0]
    SubnetMask = ($inventory.vars.subnets.lus | Get-Subnet).SubnetMask.IPAddressToString
    Gateway = (($inventory.vars.subnets.lus | Get-Subnet).HostAddresses | select -Last 1)
    Password =  $Vault.InstallPassword
}