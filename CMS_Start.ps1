﻿Get-Credential | Export-Clixml C:\AdminTools\CMS\HVDDta.set
New-Item C:\AdminTools\CMS -Type Directory

$credentials = Import-Clixml C:\AdminTools\CMS\HVDDt.set

Start-Process powershell.exe -Credential $credentials -NoNewWindow -ArgumentList { 
  Start-Process powershell.exe -Verb RunAs -ArgumentList {
    Start-Process 'C:\Program Files (x86)\CMS Lite\CMS Lite.exe' -wait
    add-font -path C:\AdminTools\Czcionki\ -Verbose
  }
} 
