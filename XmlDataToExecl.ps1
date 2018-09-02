$FileName = "SCOM_MP_Version_4.3.0-Release_20180809"
[xml]$XML = Get-Content -Path "C:\Users\zack.wang\Desktop\ToolSuite\GetMPVersionList\$FileName.xml"

## Create Excel COM Object
$excel = New-Object -ComObject Excel.Application
# Set the sheet to invisible
$excel.Visible = $true
# Create a workbook
$workbook = $excel.Workbooks.Add()
# Get sheet 1
$sheet = $workbook.Worksheets.Item(1)
# Set a counter
$x = 1;
# here we loop through the XML data and add this to the excel sheet
$excludeKeywords = "SQL Server","Windows Server","Windows Core Library","Windows Service Library"
foreach ($managementPackage in $XML.managementPackagesRoot.managementPackage)
{
    $excluded = $false
    foreach($excludeKeyword in $excludeKeywords)
    {
        if($managementPackage.name.Contains($excludeKeyword))
        {
           $excluded = $true
           break
        }
    }

    if(!$excluded)
    {
        $sheet.Cells.Item($x,1) = $managementPackage.name
        $sheet.Cells.Item($x,1).Font.Name = "Calibri"
        $sheet.Cells.Item($x,1).Font.Size = 11
        $sheet.Cells.Item($x,2) = $managementPackage.version
        $sheet.Cells.Item($x,2).Font.Name = "Calibri"
        $sheet.Cells.Item($x,2).Font.Size = 11
        $x++
    }
}

$Workbook.SaveAs("C:\Users\zack.wang\Desktop\ToolSuite\GetMPVersionList\$FileName.xls")
$excel.quit()