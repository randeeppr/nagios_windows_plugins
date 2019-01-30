# The script does the following : check the file in the given directory exists and if the file is empty or not.
# Author : Randeep P R 
# Change log
# Version : Edited
# 1.0     : Randeep

$directory = $args[0]
$location = $args[1]

$yesterday = get-date (get-date).addDays(-1) -UFormat "%d%m%y"
$year   = $yesterday.Substring(4,2)
$month  = $yesterday.Substring(2,2)
$day    = $yesterday.Substring(0,2)

$filename = "$($directory)\$($location)\$($location)_pbx_cdr_$($year)_$($month)_$($day)_script.txt"

if(![System.IO.Directory]::Exists($directory)){
    echo "Directory with path $directory doesn't exist"
    exit(2)
} else {
    if(![System.IO.File]::Exists($filename)){
    echo "File with name $filename doesn't exist"
    exit(2)
} else {
    if ( (get-childitem $filename).length -eq 0 ) {
    echo "File $filename is empty"
    exit(2)
    } else {
    echo "File $filename exists and is not empty"
    exit(0)
    #[Environment]::Exit(0)
    }
}
}
