 $LogDate = Get-Date -UFormat %Y%m%d
 $LogName = 'SyncHardwareAssets_'
 $Log = "$LogName$LogDate*"
 #$Results = 
 Get-ChildItem -Path "\ServerName\Share\$Log" -Recurse | Select-String "Error|Warning"