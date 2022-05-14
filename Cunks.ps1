$custIDs = Get-MicrosoftPartnerCustomers
$chunks = [System.Collections.ArrayList]::new()
for ($i = 0; $i -lt $custIDs.Count; $i += 100) {
    if (($custIDs.Count - $i) -gt 99  ) {
        $chunks.add($custIDs[$i..($i + 99)])
    }
    else {
        $chunks.add($custIDs[$i..($custIDs.Count - 1)])
    }
}
$today = [datetime]::Today.ToString("yyyy-MM-dd")
$count = 1
foreach ($chunk in $chunks) {
    $path = "c:\Reports\$today Chunk $count of $($chunks.Count).csv"
    $chunk | Export-Csv $path -Append
    $count++
}