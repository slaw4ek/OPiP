Enter-PSSession -ComputerName 9DKYFV1 -Credential zajezdnia\swawrzyniak_admin
Enter-PSSession -ComputerName 056dell-st -Credential zajezdnia\swawrzyniak_admin
Enter-PSSession -ComputerName D0K58C2 -Credential zajezdnia\swawrzyniak_admin
Start-Process 'C:\Users\slawomir.wawrzyniak\Downloads\dvdflick_setup_1.3.0.7.exe' -wait
New-PSDrive -Name "K" -PSProvider FileSystem -Root "\\zajezdnia.org\Udostepnione"
$deviceName = Read-Host -Prompt 'TSSTcorp DVD+-RW SN-208FB'; Get-Device | Where-Object -Property Name -Like $deviceName | Disable-Device

