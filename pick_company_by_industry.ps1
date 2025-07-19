param (
    [string]$industry
)

$config = Get-Content -Path ".\config.json" | ConvertFrom-Json

$industry_names = $config.Industries | Get-Member -MemberType Properties | Select-Object Name

if ($industry -eq "") {
    Write-Output "Specify the industry value like this:"
    Write-Output ".\pick_company_by_industry.ps1 -industry Defense"
    exit
}

$min = 1
$max = 0

for ($i = 0; $i -lt $industry_names.length; $i++) {
    $name = $industry_names.Name[$i]
    if ($name -eq $industry) {
        $max = $config.Industries.$name.max_num
        break
    }
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
