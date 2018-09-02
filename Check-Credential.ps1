$UserName = "Administrator"
$Password = "123456"
$PasswordSecuringString = ConvertTo-SecureString $Password -AsPlainText -Force;
$Cred = New-Object System.Management.Automation.PSCredential($UserName, $PasswordSecuringString);
	
function Check-Credential {
    param (
    [Parameter(Mandatory = $true)]
    [PSCredential] $Cred
    )

    try
    {
        Add-Type -assemblyname system.DirectoryServices.accountmanagement 
        $userName=$Cred.GetNetworkCredential().UserName
        $password=$Cred.GetNetworkCredential().Password

        $domain = $env:USERDOMAIN

        $ct = [System.DirectoryServices.AccountManagement.ContextType]::Domain
        $pc = New-Object System.DirectoryServices.AccountManagement.PrincipalContext $ct,$domain
        $isValid = $pc.ValidateCredentials($userName,$password)

        if(!$isValid)
        {
            Write-Error "The delegate credential is invalid."
            break
        } else {
            Write-Host "Valid Cred."
        }
    }
    catch [System.Exception]
    {
        Write-Warning  "Failed to check the delegate credential."
        Write-Error  -Message $_
    }
}

Check-Credential -Cred $Cred