Import-Module .\Poshible.psm1
$yn = read-host "Create new Self Signed for Vault encryption? (y/n)"
if ($yn -eq 'y') {
    New-VaultSelfSigned
}

write-host 'Now encrypt a vault file. Example: Encrypt-Vault -path .\vault.psd1 '
Write-host 'and select your new certificate in the gridview. This will be used again to decrypt'