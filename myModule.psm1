function get-unixTime(){
    param(
        [parameter(ValueFromPipeline = $true)]$date = $null
    )
    if($null -eq $date){
        $seconds = get-date (get-date).ToUniversalTime() -Uformat %s
    }
    else{
        $seconds = get-date ($date).ToUniversalTime() -Uformat %s
    }
    return $seconds
}
function convert-fromUnixTime(){
    param(
        [parameter(ValueFromPipeline = $true)]$unixSeconds
    )
    $date = [datetimeoffset]::FromUnixTimeMilliseconds(1000 * $unixSeconds)
    return $date.LocalDateTime
}

Export-ModuleMember -function get-unixTime
Export-ModuleMember -function convert-fromUnixTime