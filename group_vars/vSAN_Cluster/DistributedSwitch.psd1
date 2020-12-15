@{ 
    DistributedSwitches=@{
        'vDS-Intern' =@{
            uplinks =@(
                'vmnic8',
                'vmnic10'
            )
            portgroups =@{
                vSAN =@{vlanid=200}
                vMotion =@{vlanid=300}
            }
        }
        'vDS-Ost' =@{
            uplinks =@(
                'vmnic2',
                'vmnic4'
            )
        }
        'vDS-Nord' =@{
            uplinks =@(
                'vmnic9',
                'vmnic11'
            )
        }
    }
    
}