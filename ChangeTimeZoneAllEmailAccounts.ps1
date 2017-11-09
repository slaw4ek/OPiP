#skrypt ustawiający strefę czasową "Central European Standard Time" dla wszystkich skrzynek pocztowych w O365, nazwy stref czasowych pobrane ze strony:
#https://www.cogmotive.com/blog/office-365-tips/set-language-and-time-zone-for-all-owa-users-in-office-365

$counter=0 #licznik przebiegu petli

$cred = Get-Credential #pobranie danych logowania

$session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri "https://outlook.office365.com/powershell-liveid/" -Credential $cred -Authentication Basic -AllowRedirection #

Import-PSSession $session #łączenie z O365 (dla cmdlet Set-MailboxRegionalConfiguration)
Connect-MsolService -Credential $cred #łączenie z Azure (dla cmdlet ...Msol)

$usersfromo365 = Get-MsolUser -All #wyciąga użytkowników z Azure AD #wyrzucamy wszystkie wyniki, bez ALL wyświetli się tylko 500 pierwszych wyników #tylko użytkowników z nieprzydzielonymi licencjami

foreach($user in $usersfromo365){ #sprawdzenie czy UPN podawane są po kolei, nie hurtem
    $counter++
    $user.userprincipalname
}

Write-Output "Licznik $($counter)"

foreach($user in $usersfromo365){#ustawienie strefy czasowej dla każdego użytkownika po kolei
    Write-Output "Ustawiam strefe czasowa CEST dla skrzynki $($user.userprincipalname)"
    Set-MailboxRegionalConfiguration -Identity $user.userprincipalname -TimeZone "Central European Standard Time"
    sleep (1)
}

Remove-PSSession $session #zakończenie sesji O365, sesja dla Azure wygasa sama