$cred = Get-Credential

$csv=Import-Csv -Delimiter ";" -Path C:\AdminTools\POSH\comps.csv

Invoke-Command -ComputerName $csv.AssetName -Credential $cred {

Stop-Service -Name Spooler

sleep(5)

New-Item -ItemType Directory -Path C:\AdminTools\ -Name spool_bckp

Move-Item -path C:\Windows\System32\spool\* -Destination C:\AdminTools\spool_bckp

sleep(10)

Move-Item -path C:\AdminTools\spool_bckp\* -Destination C:\Windows\System32\spool

sleep(5)

Start-Service -Name Spooler
}