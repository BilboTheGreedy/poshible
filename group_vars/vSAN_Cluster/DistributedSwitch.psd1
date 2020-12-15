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
        'vDS-VM1' =@{
            uplinks =@(
                'vmnic2',
                'vmnic4'
            )
        }
        'vDS-VM2' =@{
            uplinks =@(
                'vmnic9',
                'vmnic11'
            )
        }
    }
    
}