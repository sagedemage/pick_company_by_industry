param (
    [string]$min_input,
    [string]$max_input
)

if ($min_input -eq "" -or $max_input -eq "") {
    if ($min_input -eq "") {
        Write-Output "Minimum value must be specified!"
    }
    if ($max_input -eq "") {
        Write-Output "Maximum value must be specified!"
    }
    Write-Output "Specify the minimum and maximum values like this:"
    Write-Output ".\rand_num_gen.ps1 -min 1 -max 10"
    exit
}

try {
    $min = [int32]$min_input
    $max = [int32]$max_input

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
}
catch {
    Write-Output("Exception Type: " + $PSItem.Exception.GetType().Name)
    Write-Output("Exception Message: " + $PSItem.Exception.Message)
}