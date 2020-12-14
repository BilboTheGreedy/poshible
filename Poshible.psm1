if (!$group_vars_path){
    New-Variable -Name "group_vars_path" -Value ".\group_vars" -Option Constant
}
if (!$host_vars_path){
    New-Variable -Name "host_vars_path" -Value ".\host_vars" -Option Constant
}

function Get-Inventory{
    Param ($Path)

    $Global:Inventory = Import-PowerShellDataFile $path
    
}
function Get-GroupVars {
    if ((Test-Path $group_vars_path)) {
        foreach ($group_item in Get-ChildItem $group_vars_path) {
            
            if ($Inventory.keys -contains $group_item.name){
                #if group vars contains directory, add group scope vars
                $inventory.($Group_item.name).Add("vars",@{})

                $Group_vars_items = Get-ChildItem $group_item.fullname

                foreach ($Group_Vars in $Group_vars_items) {
                    $Content = Get-Content $Group_vars.fullname -raw
                    $scriptblock = [scriptblock]::Create($Content)
                    $params = (& $scriptblock )
                    foreach ($key in $params.keys) {
                        $inventory.($Group_item.name).vars.add($key, $params[$key])
                    }

                    
                    
                }
            }
            
        }
        
    }
    
}

function Get-HostVars {

    if ((Test-Path $host_vars_path)) {
        $host_vars_items = Get-ChildItem $host_vars_path
        foreach ($Inventory_Group in $inventory) {
            foreach ($Group in $Inventory_Group.keys){
                foreach ($Inventory_host in  $Inventory[$Group].Hosts.Keys){
                    if ($host_vars_items.name -contains $Inventory_host) {
                        $Host_vars = $host_vars_items | Where {$_.Name -eq $Inventory_host} | Get-ChildItem
                        #If folder exist but contains no host vars, do not add vars to inventory_host
                        if ($Host_vars) {
                            $Inventory[$Group].Hosts[$Inventory_host].add("vars",@{})
                            foreach ($vars in $Host_vars) {
                                $Content = Get-Content $vars.fullname -raw
                                $scriptblock = [scriptblock]::Create($Content)
                                $params = (& $scriptblock )
                                foreach ($key in $params.keys) {
                                    $Inventory[$Group].Hosts[$Inventory_host].vars.add($key, $params[$key])
                                }
                                
                            }
                        }
                        
                    }

                }
                
            }

        }

        
    }
    
}

function New-VaultSelfSigned {
    $newcert=Read-Host 'Enter Certificate Name'

    New-SelfSignedCertificate -DnsName $newcert -CertStoreLocation "Cert:\CurrentUser\My" -KeyUsage KeyEncipherment,DataEncipherment,KeyAgreement -Type DocumentEncryptionCert

}

function Encrypt-Vault {
    param (
        [string]$path
    )
    $mycert=Get-Childitem Cert:\CurrentUser\My
    $choicec=$mycert | Where-Object hasprivatekey -eq 'true' | Select-Object -Property Issuer,Subject,HasPrivateKey | Out-GridView -Title 'Select Certificate' -PassThru
    Protect-CmsMessage -Content (Get-Content $path) -To $choicec.Subject -OutFile $path
}


function Decrypt-Vault {
    param (
        [string]$Path
    )
    $mycert=Get-Childitem Cert:\CurrentUser\My
    $choicec=$mycert | Where-Object hasprivatekey -eq 'true' | Select-Object -Property Issuer,Subject,HasPrivateKey | Out-GridView -Title 'Select Certificate' -PassThru
    $vault = Get-CmsMessage -Path $path
    $Vault_Inventory = $vault | Unprotect-cmsMessage -To $choicec.Subject
    $scriptblock = [scriptblock]::Create($Vault_Inventory)
    $Global:Vault = ( & $scriptblock)
}

function Decrypt-VaultToPlain {
    param (
        [string]$Path
    )
    $mycert=Get-Childitem Cert:\CurrentUser\My
    $choicec=$mycert | Where-Object hasprivatekey -eq 'true' | Select-Object -Property Issuer,Subject,HasPrivateKey | Out-GridView -Title 'Select Certificate' -PassThru
    $vault = Get-CmsMessage -Path $path
    $vault | Unprotect-cmsMessage -To $choicec.Subject | Out-File $path -Encoding utf8 -Force

}

