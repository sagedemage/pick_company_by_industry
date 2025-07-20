param (
    [string]$industry
)

$config = Get-Content -Path ".\config.json" | ConvertFrom-Json

if ($industry -eq "") {
    Write-Output "Specify the industry value like this:"
    Write-Output ".\pick_company_by_industry.ps1 -industry Defense"
    exit
}

$min = 1
$max = 0

$industry_exist = $null -ne $config.Industries.$industry

if ($industry_exist -eq $false) {
    Write-Output "Industry, `"$industry`", does not exist!"
    exit
}

$max = $config.Industries.$industry.max_num

if ($max -eq 0) {
    Write-Output "Maximum value can't be zero!"
    exit
}

if ($min -eq $max) {
    Write-Output "Minimum and maximum values can't be equal!"
    exit
}

if ($min -lt 0 -or $max -lt 0) {
    if ($min -lt 0) {
        Write-Output "Minimum value can't be negative!"
    }
    if ($max -lt 0) {
        Write-Output "Maximum value can't be negative!"
    }
    exit
}

$rand_num = Get-Random -Minimum $min -Maximum $max
Write-Output("Generated number: " + $rand_num)
