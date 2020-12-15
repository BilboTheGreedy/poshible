@{ 
    vSwitches=@{
        'vSwitch0' =@{
            uplinks =@(
                'vmnic0',
                'vmnic3'
            )
        }
    
        'vSwitch1' =@{
            uplinks =@(
                'vmnic1',
                'vmnic4'
            )
            portgroups =@{
                DC =@{vlanid=1010}
                RDS =@{vlanid=1020}
                ARDS =@{vlanid=1030}
                WUS =@{vlanid=1040}
            }
        }
    }
    
}