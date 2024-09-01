[cmdletbinding()]
param (
    [string]$directory = "\\path\to\filesystem"
)

$SubtitleFiles = (Get-ChildItem -Path $directory -Recurse -Force | Where-Object {$_.extension -in ".srt"})
$numFiles=($SubtitleFiles | Measure-Object).Count;

Write-Host "$directory contains $numFiles subtitle files in total!"

if ($numFiles -gt 1) {
    $SubtitleFiles | ForEach-Object {
        $_.Delete()
    }
    
    Write-Host "Files deleted!"
} else {
    Write-Host "Nothing to delete!"
}
