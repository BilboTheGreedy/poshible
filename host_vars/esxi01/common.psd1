@{
    IP = ($inventory.vars.subnets.esxi_mgmt | Get-Subnet).HostAddresses[0]
    SubnetMask = ($inventory.vars.subnets.esxi_mgmt | Get-Subnet).SubnetMask.IPAddressToString
    Gateway = (($inventory.vars.subnets.esxi_mgmt | Get-Subnet).HostAddresses | select -Last 1)
    Password =  $Vault.InstallPassword
}