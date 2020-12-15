@{
    Admin_ESXi = @{
        Hosts =@{
            "esxi01" = @{}
        }
    }
    vSAN_Cluster = @{
        Hosts =@{
            "kesxi01" = @{}
            "kesxi02" = @{}
        }
    }
    Windows_Machines = @{
        Hosts =@{
            "dc01" = @{}
            "wus" = @{}
            "rds" = @{}
            "ards" = @{}
        }
    }
    Linux_Machines = @{
        Hosts =@{
            "lus" = @{}
            "nus" = @{}
            "logg" = @{}
        }
    }
}