$cred = Get-Credential
$comp= "d0p68c2"


Invoke-Command -ComputerName $comp -Credential $cred {
Stop-Service -Name Spooler
}


Invoke-Command -ComputerName $comp -Credential $cred {
New-Item -ItemType Directory -Path C:\AdminTools\ -Name spool_bckp
Move-Item -path C:\Windows\System32\spool\* -Destination C:\AdminTools\spool_bckp
}


Invoke-Command -ComputerName $comp -Credential $cred {
New-Item -ItemType Directory -Path C:\AdminTools\ -Name spool_bckp
Move-Item -path C:\AdminTools\spool_bckp\* -Destination C:\Windows\System32\spool
}


Invoke-Command -ComputerName $comp -Credential $cred {
Start-Service -Name Spooler
}

