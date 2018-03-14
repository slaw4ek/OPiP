$cred = Get-Credential
$comp = @()

do{
$comp = Read-Host "Wprowadz nazwy komputerow do zrestartowania spoolera, aby zakończyć wpisz koniec"
}
while($comp[-1] -ne "koniec")
$comp[-1]=0

$comp=("d0k68c2", "d0n38c2", "7lhpj32", "d0k48c2")

for($i = 50; $i -le 250; $i++){
$comp=$comp+("10.218.2."+$i)
}


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

