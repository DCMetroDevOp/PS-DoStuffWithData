$o = '---'
##$o = 'aalleyne@aoc.gov 41EAD8E1-A5C8-4F96-8E91-0C7CE18D7B0C'
$Ob = IF ($o -like "*@domain.com*") {($F = $o -replace "\@domain.com.+") 
$User = Get-Aduser $F}
ElSE {
($F = $o -replace '\s+', ', ')
$Query = "SELECT 
      [Full_User_Name0]
      FROM [CM_HQ2].[dbo].[v_R_User]
  WHERE [Full_User_Name0] Like '$F'"
$QueryResult = Invoke-Sqlcmd -Query $Query -ServerInstance 'DBServer' -Database 'DBName'}