Enter-PSSession -ComputerName 9DKYFV1 -Authentication Kerberos -EnableNetworkAccess -Credential zajezdnia\swawrzyniak_admin
New-PSDrive -Name "K" -PSProvider FileSystem -Root "\\zajezdnia.org\udostepnione\Instalki"
Start-Process 'K:\FileZilla.exe' -wait
New-PSDrive -Name L -PSProvider FileSystem -Root \\zajezdnia.org\udostepnione\Instalki -Credential zajezdnia\slawomir.wawrzyniak
Enter-PSSession -ComputerName 9DKYFV1 -Authentication Kerberos -EnableNetworkAccess -Credential zajezdnia\swawrzyniak_admin
Enter-PSSession -RunAsAdministrator

Start-Process powershell.exe -Credential $credentials -NoNewWindow -ArgumentList { 
  Start-Process powershell.exe -Verb RunAs -ArgumentList {
    Start-Process 'C:\Program Files (x86)\CMS Lite\CMS Lite.exe' -wait
  }
} 
