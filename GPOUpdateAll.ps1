$cred = Get-Credential

$csv=Import-Csv -Delimiter ";" -Path C:\AdminTools\POSH\comps.csv

Invoke-Command -ComputerName $csv.AssetName -Credential $cred -Verbose{

gpupdate /force

}