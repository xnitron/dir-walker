param (
    [string]$dir = (Get-Location), # Default to the current directory
    [string]$outputCsv = (Join-Path (Get-Location) "output.csv")  # Default to "output.csv" in current directory
)

# Check if the directory exist
if (Test-Path $dir) {
    # Get all files recursively in the directory
    $files = Get-ChildItem -Path $dir -Recurse -File

    # Collect file information and sort by LastWriteTime in descending order
    $fileInfo = $files | Select-Object Name, LastWriteTime | Sort-Object LastWriteTime -Descending

    # Export the sorted file information to CSV with UTF-8 encoding
    $fileInfo | Export-Csv -Path $outputCsv -NoTypeInformation -Delimiter ',' -Encoding UTF8

    Write-Host "File information has been saved to $outputCsv"
}
else {
    Write-Host "The specified directory path does not exist."
}
