@{
    'vDS-Intern' =@{
        uplinks =@(
            'vmnic8',
            'vmnic10'
        )
        portgroups =@{
            vSAN =@{vlanid=100}
            vMotion =@{vlanid=200}
        }
    }
}