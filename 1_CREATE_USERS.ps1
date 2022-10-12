# ----- Edit these Variables for your own Use Case ----- #
$PASSWORD_FOR_USERS   = "Password1"
$USER_FIRST_LAST_LIST = Get-Content .\names.txt
# ------------------------------------------------------ #
 # create a password object for powershell #
$password = ConvertTo-SecureString $PASSWORD_FOR_USERS -AsPlainText -Force
# create an organization unit called _USERS #
New-ADOrganizationalUnit -Name _USERS -ProtectedFromAccidentalDeletion $false


# Create users in AD, example of a user in USER_FIRST_LAST_LIST = "MOUSSAOUI ABDESLAM#
foreach ($n in $USER_FIRST_LAST_LIST) {
    $first = $n.Split(" ")[0].ToLower()     # -> moussaoui #
    $last = $n.Split(" ")[1].ToLower()           # -> abdeslam #
    $username = "$($first.Substring(0,1))$($last)".ToLower()  #mabdeslam#
    
    # print -> creating user: mabdeslam"
    Write-Host "Creating user: $($username)" -BackgroundColor Black -ForegroundColor Cyan
    
    New-AdUser -AccountPassword $password `
               -GivenName $first `
               -Surname $last `
               -DisplayName $username `
               -Name $username `
               -EmployeeID $username `
               -PasswordNeverExpires $true `
               -Path "ou=_USERS,$(([ADSI]`"").distinguishedName)" `
               -Enabled $true
}
