# Author:  Todd Meinershagen
# Date:    2016-07-17

function Get-EventsByFilter
(
    [String] $LogName, 
    [Int] $Level, 
    [String] $Source, 
    [String] $Filter, 
    [String] $ComputerName
) 
{
    Get-WinEvent -FilterHashtable @{logname=$LogName;providername=$Source;level=$Level} -ComputerName $ComputerName `
       | where {$_.Message -like $Filter -and $_.Id }
}

$logname = 'system'
$level = 4 #Information
$source = 'Microsoft Antimalware'
$filter = "*FULL*"
$computername = 'RCM41VQPERAPP18.medassets.com'

Get-EventsByFilter -LogName $logname -Level $level -Source $source -Filter $filter -ComputerName $computername