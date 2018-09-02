$UserName = "Zack"
$Password = "123456"
$PasswordSecuringString = ConvertTo-SecureString $Password -AsPlainText -Force;
$Cred = New-Object System.Management.Automation.PSCredential($UserName, $PasswordSecuringString);
$computerName = "Zack"
$session = New-PSSession -ComputerName $computerName -Authentication Credssp -Credential $Cred 