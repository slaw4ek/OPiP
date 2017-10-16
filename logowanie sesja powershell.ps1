Enter-PSSession -ComputerName CNU319B68L -Credential zajezdnia\swawrzyniak_admin
Start-Process 'C:\Users\slawomir.wawrzyniak\Downloads\dvdflick_setup_1.3.0.7.exe' -wait
New-PSDrive -Name "K" -PSProvider FileSystem -Root "\\zajezdnia.org\Udostepnione"