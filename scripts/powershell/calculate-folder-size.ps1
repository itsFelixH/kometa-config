[cmdletbinding()]
param (
    [Parameter(Mandatory = $false)]
    [Alias('Path')]
    [String[]]$BasePath = "\\BUNDEPI\Serien"
)

#Get a list of all the directories in the base path we're looking for.
$allFolders = Get-ChildItem $BasePath -Directory -Force

#Create array to store folder objects found with size info.
[System.Collections.ArrayList]$folderList = @()

#Go through each folder in the base path.
ForEach ($folder in $allFolders) {
    $allSubFolders = Get-ChildItem $folder -Directory -Force
    ForEach ($subfolder in $allSubFolders) {

        #Clear out the variables used in the loop.
        $fullPath = $null        
        $folderObject = $null
        $folderSize = $null
        $folderSizeInGB = $null
        $folderBaseName = $null

        #Store the full path to the folder and its name in separate variables
        $fullPath = $subfolder.FullName
        $folderBaseName = $folder.BaseName + '/' + $subfolder.BaseName     

        Write-Verbose "Working with [$fullPath]..."            

        #Get folder info / sizes
        $folderSize = (Get-Childitem -Path $fullPath -Recurse -Force -ErrorAction SilentlyContinue | Measure-Object -Property Length -Sum -ErrorAction SilentlyContinue).Sum
        $folderSizeInGB = "{0:N2} GB" -f ($folderSize / 1GB)

        $sampleFile = Get-ChildItem -Path $subfolder -Recurse -Force -ErrorAction SilentlyContinue | Where-Object {$_.extension -in ".mkv", ".mp4"} | Select-Object -First 1
        $resolution = ffprobe -v error -select_streams v:0 -show_entries stream=height -of csv=s=x:p=0 $sampleFile

        #Here we create a custom object that we'll add to the array
        $folderObject = [PSCustomObject]@{
            Folder = $folderBaseName
            Res = $resolution + "p"
            Size = $folderSize
            'Size(GB)' = $folderSizeInGB
        }                        

        #Add the object to the array
        $folderList.Add($folderObject) | Out-Null
    }
}

$folderListAlphabet = $folderList | Sort-Object -Property Folder | Select-Object Folder, Res, 'Size(GB)'
#$folderListGB = $folderList | Sort-Object -Property Size -Descending | Select-Object Folder, Res, 'Size(GB)'

$folderListAlphabet | Export-Csv -Path "$PSScriptRoot\folderSizes.csv" -NoTypeInformation
#$folderListGB | Export-Csv -Path "$PSScriptRoot\sortedFolderSizes.csv" -NoTypeInformation

Return $folderListAlphabet