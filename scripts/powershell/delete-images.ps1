[cmdletbinding()]
param (
    [string]$directory = "\\path\to\filesystem"
)

$ImageFiles = (Get-ChildItem -Path $directory -Recurse -Force | Where-Object {$_.extension -in ".jpg"})
$numFiles=($ImageFiles | Measure-Object).Count;

Write-Host "$directory contains $numFiles image files in total!"

if ($numFiles -gt 1) {
    $ImageFiles | ForEach-Object {
        $_.Delete()
    }
    
    Write-Host "Files deleted!"
} else {
    Write-Host "Nothing to delete!"
}
