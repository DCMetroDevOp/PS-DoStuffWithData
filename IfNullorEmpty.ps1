Import-Module 'C:\Program Files\WindowsPowerShell\Modules\SMLets\1.0.2016.0\smlets'
$file = 'C:\temp\WIID.txt'

foreach($line in Get-Content $file) {

$SRTicket = Get-SCSMObject -Class (Get-SCSMClass -Name System.Workitem.Servicerequest$) -filter "ID -eq $line"
$AssignedTech = Get-SCSMRelationshipObject -BySource $SRTicket -Filter "RelationshipID -eq '15e577a3-6bf9-6713-4eac-ba5a5b7c4722'"
IF([string]::IsNullOrEmpty($AssignedTech)) {throw @"
No tech Assigned
"@} ELSE
{$TechName = $AssignedTech.TargetObject.DisplayName}
}
$TechName
