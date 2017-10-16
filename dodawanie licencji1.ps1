$cred = Get-Credential
$session = New-PSSession -ConfigurationName Microsoft.Exchange  -ConnectionUri "https://outlook.office365.com/powershell-liveid/"  -Credential $cred  -Authentication Basic  -AllowRedirection
Import-PSSession $session
get-mailbox -ResultSize unlimited
#Set-MailboxRegionalConfiguration -Identity adrianna.roman -TimeZone "Central European Standard Time" #ustawienie strefy czasowej dla danej skrzynki na CEST
Get-MsolAccountSku #wypisanie wszystkich planów licencyjnych dostępnych w organizacji
Get-MsolUser -All -UnlicensedUsersOnly #wyciąga użytkowników z Azure AD #wyrzucamy wszystkie wyniki, bez ALL wyświetli się tylko 500 pierwszych wyników #tylko użytkowników z nieprzydzielonymi licencjami
Get-MsolUser -All | where ($_.UsageLocation -eq $null} #wyrzuca konta które nie mają przypisanej lokalizacji (zgodnej z ISO 3166-1)
Remove-PSSession $session