Function Write-EventLog()
{
    [CmdletBinding()]
    param(
      [string]$EventDescription,
      [string]$Level
    )
    $Eventlog_log = "Application"
    $Eventlog = New-Object system.diagnostics.eventlog($Eventlog_log, ".")
    $Eventlog.Source = "Windows Error Reporting "
    $Eventlog.writeEntry($EventDescription, $Level, 17061)
}

Write-EventLog -EventDescription "Zack is tesing" -Level "Error"

