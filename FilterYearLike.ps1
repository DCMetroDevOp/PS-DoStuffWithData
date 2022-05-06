#Import Modules
if (!(Get-Module smlets)){Import-Module smlets}

#SCSM Classes
$SurveyClass = Get-SCSMClass -Name "Cireson.Survey.Result"
$SurveyResults = @(Get-SCSMObject -Class $SurveyClass | Where-Object {$_.completeddate.year -like '2020'})
$SurveyResults
