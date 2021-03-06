#
# Module manifest for module 'PSGet_WriteToLogs'
#
# Generated by: Preston K. Parsard
#
# Generated on: 1/22/2019
#

@{

# Script module or binary module file associated with this manifest.
RootModule = 'WriteToLogs'

# Version number of this module.
ModuleVersion = '1.1.1'

# Supported PSEditions
# CompatiblePSEditions = @()

# ID used to uniquely identify this module
GUID = 'a3fe747a-6784-4719-8ba5-fe6217c1d142'

# Author of this module
Author = 'Preston K. Parsard'

# Company or vendor of this module
CompanyName = 'Microsoft'

# Copyright statement for this module
Copyright = '(c) 2019 Preston K. Parsard. All rights reserved.'

# Description of the functionality provided by this module
Description = @"
A collection of fuctions to simplify logging output in a variety of formats, which includes:
a) Logging simultaneously to the console and a specified log file;
b) Logging to the console and a log file with a time-stamp index at each line;
c) Logging output to only the specified log file.
The Write-ToConsoleAndLog function displays the specified content on both the PowerShell console and an included log file.
The Write-WithTime function displays the specified output on both the PowerShell console and an included log file, with a time index at each line of output.
The Write-ToLogOnly function writes the specified content only to the inlcuded file.
The function here is similar to using the native ...| Out-File -FilePath <path> syntax
"@

# Minimum version of the Windows PowerShell engine required by this module
PowerShellVersion = '5.1'

# Name of the Windows PowerShell host required by this module
# PowerShellHostName = ''

# Minimum version of the Windows PowerShell host required by this module
# PowerShellHostVersion = ''

# Minimum version of Microsoft .NET Framework required by this module. This prerequisite is valid for the PowerShell Desktop edition only.
# DotNetFrameworkVersion = ''

# Minimum version of the common language runtime (CLR) required by this module. This prerequisite is valid for the PowerShell Desktop edition only.
# CLRVersion = ''

# Processor architecture (None, X86, Amd64) required by this module
# ProcessorArchitecture = ''

# Modules that must be imported into the global environment prior to importing this module
# RequiredModules = @()

# Assemblies that must be loaded prior to importing this module
# RequiredAssemblies = @()

# Script files (.ps1) that are run in the caller's environment prior to importing this module.
# ScriptsToProcess = @()

# Type files (.ps1xml) to be loaded when importing this module
# TypesToProcess = @()

# Format files (.ps1xml) to be loaded when importing this module
# FormatsToProcess = @()

# Modules to import as nested modules of the module specified in RootModule/ModuleToProcess
# NestedModules = @()

# Functions to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no functions to export.
FunctionsToExport = 'Write-ToConsoleAndLog', 'Write-WithTime', 'Write-ToLogOnly'

# Cmdlets to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no cmdlets to export.
CmdletsToExport = @()

# Variables to export from this module
# VariablesToExport = @()

# Aliases to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no aliases to export.
AliasesToExport = @()

# DSC resources to export from this module
# DscResourcesToExport = @()

# List of all modules packaged with this module
# ModuleList = @()

# List of all files packaged with this module
# FileList = @()

# Private data to pass to the module specified in RootModule/ModuleToProcess. This may also contain a PSData hashtable with additional module metadata used by PowerShell.
PrivateData = @{

    PSData = @{

        # Tags applied to this module. These help with module discovery in online galleries.
        Tags = @('Write','Log', 'PSEdition_Desktop', 'Windows')

        # A URL to the license for this module.
        LicenseUri = 'https://mitlicense.org/'

        # A URL to the main website for this project.
        ProjectUri = 'https://github.com/autocloudarc/0040-WriteToLogs'

        # A URL to an icon representing this module.
        IconUri = 'https://github.com/autocloudarc/0000-Branding-Artifacts/blob/master/autocloudarc-g.png'

        # ReleaseNotes of this module
        ReleaseNotes = 'Updated author, company name, copyright year, powershell version info, header notes in psm1, added PSEdition_Desktop & Windows tags, updated description and added new project repo in GitHub.'

        # Flag to indicate whether the module requires explicit user acceptance. Place the license.txt file in the module root folder.
        # RequireLicenseAcceptance = $true

        # External dependent modules of this module
        # ExternalModuleDependencies = ''

    } # End of PSData hashtable

 } # End of PrivateData hashtable

# HelpInfo URI of this module
HelpInfoURI = 'https://www.powershellgallery.com/packages/WriteToLogs/'

# Default prefix for commands exported from this module. Override the default prefix using Import-Module -Prefix.
# DefaultCommandPrefix = ''

}