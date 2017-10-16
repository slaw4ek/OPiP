$session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri "https://outlook.office365.com/powershell-liveid/" -Credential $cred -Authentication Basic -AllowRedirection
Import-PSSession $session
get-mailbox
Set-MailboxRegionalConfiguration -Identity adrianna.roman -TimeZone "Central European Standard Time"
Remove-PSSession $session