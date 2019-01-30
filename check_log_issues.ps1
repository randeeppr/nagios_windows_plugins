# The script does the following : Checks for errors or warning in the log file in the last 5 minutes.
# Author : Randeep P R 
# Change log
# Version : Edited
# 1.0     : Randeep

#$file = "C:\Users\ranr0317\Documents\nxlog.log"
$file = $args[0]
$duration = $args[1]

$Date = Get-Date
$content = Get-Content $file |Select-String -Pattern "WARNING|ERROR"  

$myarray = New-Object 'System.Collections.Generic.List[String]'
foreach($line in $content){
    #echo $line
    if($line -match '(.+)(\sWARNING\s|\sERROR\s)(.+)') {
         $obj = new-object psobject -Property @{
             Date = [datetime]$matches[1]
             Error = $matches[3]
             }
             if($obj.Date -gt $Date.AddMinutes(-$duration)) {
                     $myarray.add($line)
                        }
         }
    }

if( $myarray.Count -gt 0){
  echo "Critical! Following errors found : $myarray."
  exit(2)
  } else {
  echo "OK! No errors or warnings found in log."
  exit(0)
  }
