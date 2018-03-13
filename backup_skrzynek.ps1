$cred = Get-Credential -Message "Podaj login do usługi Office 365"

$session = New-PSSession -ConfigurationName Microsoft.Exchange  -ConnectionUri "https://outlook.office365.com/powershell-liveid/"  -Credential $cred  -Authentication Basic  -AllowRedirection
Import-PSSession $session

Connect-MsolService -Credential $cred

get-mailbox -SoftDeletedMailbox

$guid1=(Get-Mailbox -SoftDeletedMailbox marek.szajda@zajezdnia.org).ExchangeGuid

$guid2=(Get-Mailbox marek.szajda.bckp@zajezdnia.org).ExchangeGuid

New-MailboxRestoreRequest -SourceMailbox $guid1.Guid -TargetMailbox $guid2.guid -AllowLegacyDNMismatch -verbose

Get-MailboxRestoreRequest

New-Mailbox -Shared -Name 