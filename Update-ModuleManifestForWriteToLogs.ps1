# https://docs.microsoft.com/en-us/powershell/gallery/concepts/publishing-guidelines
# https://docs.microsoft.com/en-us/powershell/module/powershellget/update-modulemanifest?view=powershell-6

$manifestPath = "D:\DATA\OneDrive\02.00.00.GENERAL\repos\git\0040-WriteToLogs\WriteToLogs\1.0.21\WriteToLogs.psd1"

$desc = "@
A collection of fuctions to simplify logging output in a variety of formats, which includes:
a) Logging simultaneously to the console and a specified log file;
b) Logging to the console and a log file with a time-stamp index at each line;
c) Logging output to only the specified log file.
The Write-ToConsoleAndLog function displays the specified content on both the PowerShell console and an included log file.
The Write-WithTime function displays the specified output on both the PowerShell console and an included log file, with a time index at each line of output.
The Write-ToLogOnly function writes the specified content only to the inlcuded file.
The function here is similar to using the native ...| Out-File -FilePath <path> syntax
@"

$pvData = @{
    PSData = @{
        # Tags applied to this module. These help with module discovery in online galleries.
        Tags = @('Write','Logs')
        # A URL to the main website for this project.
        # ProjectUri = ''

        # A URL to an icon representing this module.
        # IconUri = ''
        # ReleaseNotes of this module
        ReleaseNotes = 'Updated Author, CompanyName and Copyright info.'
    } # End of PSData hashtable
   } # End of PrivateData hashtable
Update-ModuleManifest -Path $manifestPath `
-Author "Preston K. Parsard" `
-CompanyName "AutoCloudArc" `
-Copyright "(c) 2018 Preston K. Parsard. All rights reserved." `
-ModuleVersion '1.0.22' `
-Description $desc `
-PowerShellVersion '5.0' `
-LicenseUri  'https://mitlicense.org/' `
-PrivateData $pvData `
-HelpInfoUri 'https://www.powershellgallery.com/packages/WriteToLogs/'


