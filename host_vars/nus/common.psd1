@{
    IP = ($inventory.vars.subnets.nus | Get-Subnet).HostAddresses[0]
    SubnetMask = ($inventory.vars.subnets.nus | Get-Subnet).SubnetMask.IPAddressToString
    Gateway = (($inventory.vars.subnets.nus | Get-Subnet).HostAddresses | select -Last 1)
    Password =  $Vault.InstallPassword
}