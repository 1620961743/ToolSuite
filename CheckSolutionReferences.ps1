$targetProjects = "LocalOamTask.csproj","OamTask.csproj","OamTaskCommon.csproj","UnifiedSuiteMPImport.csproj","ScomWrapper.csproj"
$targetSlnFiles = @()
$rootFolder = "C:\TFS\P1-Main\Product\"
Get-ChildItem $rootFolder -Recurse | ForEach-Object {
    if($_ -is [System.IO.FileInfo])
    {
        if ($_.FullName.EndsWith(".sln")) {
            $tmpSlnFilePath = $_.FullName
            $referenceProjects = Get-Content $tmpSlnFilePath | Select-String 'Project\(' | ForEach-Object {
                $projectParts = $_ -Split '[,=]' | ForEach-Object { $_.Trim('[ "{}]') };
                $($projectParts[2] -split "\\")[-1].ToString().Trim();
            }

            $referenceProjects | ForEach-Object {
                $containProjects = @()
                $tmpRef1 = $_
                $targetProjects | ForEach-Object {
                    $tmpRef2 = $_
                    if ($tmpRef1.Contains($tmpRef2) -and $containProjects -notcontains $tmpRef2) {
                        $containProjects += $tmpRef2
                    }
                }

                if ($containProjects.Count -gt 0 -and $targetSlnFiles -notcontains $tmpSlnFilePath) {
                    $targetSlnFiles += $tmpSlnFilePath
                    Write-Host "$tmpSlnFilePath ---CONTAINS--- $containProjects"
                }
            }
        }
    }
}