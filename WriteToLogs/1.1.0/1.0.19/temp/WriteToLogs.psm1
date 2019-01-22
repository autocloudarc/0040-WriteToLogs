# WriteToLogs module FUNCTIONS	
#requires -version 4.0
<#
****************************************************************************************************************************************************************************
PROGRAM: 
WriteToLogs.psm1

DESCRIPTION: 
A collection of fuctions to simplify logging output in a variety of formats, which includes: 
a) Logging simultaneously to the console and a specified log file; 
b) Logging to the console and a log file with a time-stamp index at each line; 
c) Logging to the console and file with a numeric index at each line;
d) Logging output to only the specified log file.

REL NOTES: 
The Write-ToConsoleAndLog function displays the specified content on both the PowerShell console and an included log file 
The Write-WithTime function displays the specified output on both the PowerShell console and an included log file, with a time index at each line of output.
The Write-WithIndex function displays the specified content on both the PowerShell console and an included log file, with a sequential numeric index at each line of output.
A typical scenario in which this can be used would be to iterate through a set of checks for a QA script which validates the correct settings for a configuration.
The Write-ToLogOnly function writes the specified content only to the inlcuded file.
The function here is similar to using the native ...| Out-File -FilePath <path> syntax

KEYWORDS: 
Write, Logs

LICENSE:
The MIT License (MIT)
Copyright (c) 2016 Preston K. Parsard

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

DISCLAIMER: 
THIS SAMPLE CODE AND ANY RELATED INFORMATION ARE PROVIDED "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESSED OR IMPLIED, 
INCLUDING BUT NOT LIMITED TO THE IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A PARTICULAR PURPOSE.  We grant You a nonexclusive, 
royalty-free right to use and modify the Sample Code and to reproduce and distribute the Sample Code, provided that You agree: (i) to not use Our name, 
logo, or trademarks to market Your software product in which the Sample Code is embedded; 
(ii) to include a valid copyright notice on Your software product in which the Sample Code is embedded; and (iii) to indemnify, hold harmless, 
and defend Us and Our suppliers from and against any claims or lawsuits, including attorneys’ fees, 
that arise or result from the use or distribution of the Sample Code.
****************************************************************************************************************************************************************************
#>

<# WORK ITEMS
TASK-INDEX: 000
#>

#***************************************************************************************************************************************************************************
# REVISION/CHANGE RECORD	
#---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# DATE         VERSION    NAME			     CHANGE
#---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# 17 JUN 2015  01.0.00 Preston K. Parsard Initial release
# 10 JUL 2016  01.0.14 Preston K. Parsard Minor comment correction for Write-WithIndex function 
# 10 JUL 2016  01.0.14 Preston K. Parsard Removed reference index parameter for Write-WithIndex function to eliminate dependency on index variable from calling script

# FUNCTIONS	

# Send output to both the console and log file
Function Write-ToConsoleAndLog
{
<#
.Synopsis
 Writes specified output to both the console and log file
.Description
 The Write-ToConsoleAndLog function displays the specified content on both the PowerShell console and an included log file
.Example
 Write-ToConsoleAndLog -Output "Hello World" -Log C:\scripts\logs\logfile.log
 Writes "Hello World" to the PowerShell conole as well as the log file at C:\scripts\logs\logfile.log
.Example
 Write-ToConsoleAndLog -Output $Message -Log $LogFile
 Writes the string value of the variable $Message to the conosle and log file specified by the value of the variable $LogFile
.Parameter Output
 The content to be written to the console and log
.Parameter Log
 The full path to the log file to which content will be written
.Inputs
 [string]
.Outputs
 [string]
.Notes
 NAME: Write-ToConsolAndLog
 AUTHOR: Preston K. Parsard
 LASTEDIT: 11 MAY 2015
 KEYWORDS: Write
.Link
 https://www.powershellgallery.com/
#>

[CmdletBinding()] 
Param(
 [Parameter(Mandatory=$True)]$Output,
 [Parameter(Mandatory=$True)]$Log
)
$Output | Tee-Object -FilePath $Log -Append
} #end Write-ToConsoleAndLog

# Send output to both the console and log file and include a time-stamp
Function Write-WithTime
{
<#
.Synopsis
 Writes specified output to both the console and log file with a time index
.Description
 The Write-WithTime function displays the specified output on both the PowerShell console and an included log file, with a time index at each line of output.
.Example
 Write-WithTime -Output "Hello World" -Log C:\scripts\logs\logfile.log
 Writes "T00:11:53.3775285: Hello World" to the PowerShell conole as well as the log file at C:\scripts\logs\logfile.log, where T00:11:53.3775285 represets the current time.
.Example
 Write-WithTime -Output $Message -Log $LogFile
 Writes "T00:11:53.3775285: <value of $Message> to the PowerShell conole as well as the log file at <path specified by $LogFile>, where T00:11:53.3775285 represets the current time.
.Parameter Output
 The content to be written to the console and log
.Parameter Log
 The full path to the log file to which content will be written
.Inputs
 [string]
.Outputs
 [date-time],[string]
.Notes
 NAME: Write-WithTime
 AUTHOR: Preston K. Parsard
 LASTEDIT: 11 MAY 2015
 KEYWORDS: Write
.Link
 https://www.powershellgallery.com/
#>
[CmdletBinding()] 
Param(
 [Parameter(Mandatory=$True)]$Output,
 [Parameter(Mandatory=$True)]$Log
)
# Construct log time-stamp for indexing log entries
# Get only the time stamp component of the date and time, starting with the "T" at position 10
$TimeIndex = (get-date -format o).ToString().Substring(10)
$TimeIndex = $TimeIndex.Substring(0,17)
"{0}: {1}" -f $TimeIndex,$Output | Tee-Object -FilePath $Log -Append
} #end Write-WithTime

# Send output to both the console and log file and include a numeric index
Function Write-WithIndex
{
<#
.Synopsis
 Writes specified output to both the console and log file with a sequential numeric index
.Description
 The Write-WithIndex function displays the specified content on both the PowerShell console and an included log file, with a sequential numeric index at each line of output.
 A typical scenario in which this can be used would be to iterate through a set of checks for a QA script which validates the correct settings for a configuration.
.Example
 Write-WithIndex -Output "Hello World" -Log C:\scripts\logs\logfile.log -Index $index
 Writes "1: Hello World" to the PowerShell conole as well as the log file at C:\scripts\logs\logfile.log, where 1 represets the current numeric index
.Example
 Write-WithIndex -Output $Message -Log $LogFile -Index $index
 Writes "1 <content of $Message> to the PowerShell conole as well as the log file at <path specified by $LogFile>, where 1 represets the current numeric index
.Parameter Output
 The content to be written to the console and log
.Parameter Log
 The full path to the log file to which content will be written
.Parameter Index
 The $index variable, initialized as $nul at the beginning of the script from which this variable was passed
.Inputs
 [string]
.Outputs
 [int],[string]
.Notes
 NAME: Write-WithIndex
 AUTHOR: Preston K. Parsard
 LASTEDIT: 10 JUL 2016
 KEYWORDS: Write
.Link
 https://www.powershellgallery.com/
#>
[CmdletBinding()] 
Param(
 [Parameter(Mandatory=$True)]$Output,
 [Parameter(Mandatory=$True)]$Log
)

# Increment index counter to uniquely identify each line of output
$Index++
"{0}`t`t{1}" -f $Index,$LogEntry | Tee-Object -FilePath $Log -Append
} #end Write-WithIndex

# Send output to log file only
Function Write-ToLogOnly
{
<#
.Synopsis
 Writes specified output only to the log file
.Description
 The Write-ToLogOnly function writes the specified content only to the inlcuded file.
 The function here is similar to using the native ...| Out-File -FilePath <path> syntax
.Example
 Write-ToLogOnly -Output "Hello World" -Log C:\scripts\logs\logfile.log
 Writes to the log file at C:\scripts\logs\logfile.log
.Example
 Write-ToLogOnly -Output $Message -Log $LogFile
 Writes "<value of $Message> only to the log file at <path specified by $LogFile>
.Parameter Output
 The content to be written only to the log
.Parameter Log
 The full path to the log file to which content will be written
.Inputs
 [string]
.Outputs
 [string]
.Notes
 NAME: Write-ToLogOnly
 AUTHOR: Preston K. Parsard
 LASTEDIT: 11 MAY 2015
 KEYWORDS: Write
.Link
 https://www.powershellgallery.com/
#>
[CmdletBinding()] 
Param(
 [Parameter(Mandatory=$True)]$Output,
 [Parameter(Mandatory=$True)]$Log
)
$Output | Out-File -FilePath $Log -Append
} #end Write-ToLogOnly

# MAIN	
Export-ModuleMember -Function Write-ToConsoleAndLog, Write-WithTime, Write-WithIndex, Write-ToLogOnly
# FOOTER		