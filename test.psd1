@{
    Test = ("192.168.60.0/29" | Get-Subnet).HostAddresses[0]
}
