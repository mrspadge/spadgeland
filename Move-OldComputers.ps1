$datecutoff = (Get-Date).AddDays(- 90)
Get-ADComputer -Properties LastLogonDate -Filter {LastLogonData -lt $datecutoff} | Set-ADComputer -Enabled $false |
Move-ADObject -TargetPath ‘OU=Disabled Computers,OU=Active Directory and Exchange Clean up,DC=hhc-
tr,DC=northy,DC=nhs,DC=uk’
