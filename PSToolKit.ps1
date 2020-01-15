Function ConvertFrom-KeyValue{
    Param(
        [String] $texte
    )

    $regex = [regex]::new('(?<full_kv>(?<key>[^=]+)=\"(?<value>[^\"]+)\")+?')

    ForEach ($line in $($Texte -split "`r`n")) {
        $result = $regex.Matches($line)
        $dic = @{}
        ForEach ($Match in $result) {
            $KeyName = ($Match.Groups | Where-Object {$_.Name -eq "key"}).value
            $KeyValue = ($Match.Groups | Where-Object {$_.Name -eq "value"}).value
            $dic.add($KeyName,$KeyValue)
        } 
        [PSCustomObject] $dic 
    }
} 
