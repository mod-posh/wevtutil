| Latest Version | Azure Pipelines | PowerShell Gallery | Github Release | Issues | Forks | License |
|-----------------|-----------------|----------------|----------------|----------------|----------------|----------------|
| ![Latest Version](https://img.shields.io/github/v/tag/mod-posh/wevtutil) | [![Build Status](https://dev.azure.com/patton-tech/mod-posh/_apis/build/status/mod-posh.ComputerManagement?repoName=mod-posh%2FComputerManagement&branchName=master)](https://dev.azure.com/patton-tech/mod-posh/_build/latest?definitionId=10&repoName=mod-posh%2FComputerManagement&branchName=master) | ![Powershell Gallery](https://img.shields.io/powershellgallery/dt/wevtutil) | ![Github Release](https://img.shields.io/github/downloads/mod-posh/wevtutil/total) | [![GitHub issues](https://img.shields.io/github/issues/mod-posh/wevtutil)](https://github.com/mod-posh/wevtutil/issues) | [![GitHub forks](https://img.shields.io/github/forks/mod-posh/wevtutil)](https://github.com/mod-posh/wevtutil/network) | [![GitHub license](https://img.shields.io/github/license/mod-posh/wevtutil)](https://github.com/mod-posh/wevtutil/blob/master/LICENSE)
## [Find-WevtEvent](docs/Find-WevtEvent.md)
```

NAME
    Find-WevtEvent
    
SYNOPSIS
    Reads events from an event log, from a log file, or using a
    structured query.
    
    
SYNTAX
    Find-WevtEvent -LogName <String> [-LogFile] [-StructuredQuery] [-Query <String>] [-Bookmark <FileInfo>] [-SaveBM <FileInfo>] [-Direction <Boolean>] [-Format <String>] [-Locale <String>] [-Count <String>] [-Element <String>] [<CommonParameters>]
    
    
DESCRIPTION
    Reads events from an event log, from a log file, or using a
    structured query. By default, you provide a log name for <Logname>.
    However, if you use the LogFile option, then <Logname> must be a
    path to a log file. If you use the StructuredQuery parameter,
    <Logname> must be a path to a file that contains a structured query.
    

RELATED LINKS
    https://github.com/jeffpatton1971/mod-posh/wiki/WevtUtil#Find-WevtEvent
    https://msdn.microsoft.com/en-us/library/windows/desktop/aa820708%28v=vs.85%29.aspx?f=255&MSPPError=-2147217396
    https://technet.microsoft.com/en-us/library/cc732848.aspx

REMARKS
    To see the examples, type: "get-help Find-WevtEvent -examples".
    For more information, type: "get-help Find-WevtEvent -detailed".
    For technical information, type: "get-help Find-WevtEvent -full".
    For online help, type: "get-help Find-WevtEvent -online"
```
## [Clear-WevtLog](docs/Clear-WevtLog.md)
```
NAME
    Clear-WevtLog
    
SYNOPSIS
    Clears events from the specified event log.
    
    
SYNTAX
    Clear-WevtLog -LogName <String> [-Backup <String>] [<CommonParameters>]
    
    
DESCRIPTION
    Clears events from the specified event log. The Backup option can
    be used to back up the cleared events.
    

RELATED LINKS
    https://github.com/jeffpatton1971/mod-posh/wiki/WevtUtil#Clear-WevtLog
    https://msdn.microsoft.com/en-us/library/windows/desktop/aa820708%28v=vs.85%29.aspx?f=255&MSPPError=-2147217396
    https://technet.microsoft.com/en-us/library/cc732848.aspx

REMARKS
    To see the examples, type: "get-help Clear-WevtLog -examples".
    For more information, type: "get-help Clear-WevtLog -detailed".
    For technical information, type: "get-help Clear-WevtLog -full".
    For online help, type: "get-help Clear-WevtLog -online"
```
## [Export-WevtLog](docs/Export-WevtLog.md)
```
NAME
    Export-WevtLog
    
SYNOPSIS
    Exports events from an event log, from a log file, or using
    a structured query to the specified file.
    
    
SYNTAX
    Export-WevtLog -LogName <String> -ExportFile <String> [-LogFile] [-StructuredQuery] [-Query <String>] [-Overwrite] [<CommonParameters>]
    
    
DESCRIPTION
    Exports events from an event log, from a log file, or using
    a structured query to the specified file. By default, you provide
    a log name for <Logname>. However, if you use the LogFile option, then
    <Logname> must be a path to a log file. If you use the StructuredQuery
    option, <Logname> must be a path to a file that contains a structured
    query. <Exportfile> is a path to the file where the exported events
    will be stored.
    

RELATED LINKS
    https://github.com/jeffpatton1971/mod-posh/wiki/WevtUtil#Export-WevtLog
    https://msdn.microsoft.com/en-us/library/windows/desktop/aa820708%28v=vs.85%29.aspx?f=255&MSPPError=-2147217396
    https://technet.microsoft.com/en-us/library/cc732848.aspx

REMARKS
    To see the examples, type: "get-help Export-WevtLog -examples".
    For more information, type: "get-help Export-WevtLog -detailed".
    For technical information, type: "get-help Export-WevtLog -full".
    For online help, type: "get-help Export-WevtLog -online"
```
## [Get-WevtLog](docs/Get-WevtLog.md)
```
NAME
    Get-WevtLog
    
SYNOPSIS
    Displays configuration information for the specified log
    
    
SYNTAX
    Get-WevtLog -Logname <Object> [-Format <String>] [<CommonParameters>]
    
    Get-WevtLog -List [<CommonParameters>]
    
    
DESCRIPTION
    Displays configuration information for the specified log, which
    includes whether the log is enabled or not, the current maximum
    size limit of the log, and the path to the file where the log is
    stored.
    

RELATED LINKS
    https://github.com/jeffpatton1971/mod-posh/wiki/WevtUtil#Get-WevtLog
    https://msdn.microsoft.com/en-us/library/windows/desktop/aa820708%28v=vs.85%29.aspx?f=255&MSPPError=-2147217396
    https://technet.microsoft.com/en-us/library/cc732848.aspx

REMARKS
    To see the examples, type: "get-help Get-WevtLog -examples".
    For more information, type: "get-help Get-WevtLog -detailed".
    For technical information, type: "get-help Get-WevtLog -full".
    For online help, type: "get-help Get-WevtLog -online"
```
## [Save-WevtLog](docs/Save-WevtLog.md)
```
NAME
    Save-WevtLog
    
SYNOPSIS
    Archives the specified log file in a self-contained format.
    
    
SYNTAX
    Save-WevtLog -LogPath <String> [-Locale <String>] [<CommonParameters>]
    
    
DESCRIPTION
    Archives the specified log file in a self-contained format. A
    subdirectory with the name of the locale is created and all locale-
    specific information is saved in that subdirectory. After the
    directory and log file are created by running Save-WevtLog, events
    in the file can be read whether the publisher is installed or not.
    

RELATED LINKS
    https://github.com/jeffpatton1971/mod-posh/wiki/WevtUtil#Save-WevtLog
    https://msdn.microsoft.com/en-us/library/windows/desktop/aa820708%28v=vs.85%29.aspx?f=255&MSPPError=-2147217396
    https://technet.microsoft.com/en-us/library/cc732848.aspx

REMARKS
    To see the examples, type: "get-help Save-WevtLog -examples".
    For more information, type: "get-help Save-WevtLog -detailed".
    For technical information, type: "get-help Save-WevtLog -full".
    For online help, type: "get-help Save-WevtLog -online"
```
## [Set-WevtLog](docs/Set-WevtLog.md)
```
NAME
    Set-WevtLog
    
SYNOPSIS
    Modifies the configuration of the specified log.
    
    
SYNTAX
    Set-WevtLog -Logname <Object> [-Enabled <String>] [-Isolation <String>] [-Logpath <String>] [-Retention <Boolean>] [-AutoBackup <Boolean>] [-Size <Int32>] [-Level <String>] [-Keywords <String>] [-Channel <String>] [-Config <String>] [<CommonParameters>]
    
    
DESCRIPTION
    Modifies the configuration of the specified log.
    

RELATED LINKS
    https://github.com/jeffpatton1971/mod-posh/wiki/WevtUtil#Set-WevtLog
    https://msdn.microsoft.com/en-us/library/windows/desktop/aa820708%28v=vs.85%29.aspx?f=255&MSPPError=-2147217396
    https://technet.microsoft.com/en-us/library/cc732848.aspx

REMARKS
    To see the examples, type: "get-help Set-WevtLog -examples".
    For more information, type: "get-help Set-WevtLog -detailed".
    For technical information, type: "get-help Set-WevtLog -full".
    For online help, type: "get-help Set-WevtLog -online"
```
## [Get-WevtLogInfo](docs/Get-WevtLogInfo.md)
```
NAME
    Get-WevtLogInfo
    
SYNOPSIS
    Displays status information about an event log or log file.
    
    
SYNTAX
    Get-WevtLogInfo -LogName <String> [-LogFile] [<CommonParameters>]
    
    
DESCRIPTION
    Displays status information about an event log or log file. If the
    LogFile option is used, <Logname> is a path to a log file. You can
    run Get-WevtLog -List to obtain a list of log names.
    

RELATED LINKS
    https://github.com/jeffpatton1971/mod-posh/wiki/WevtUtil#Get-WevtLogInfo
    https://msdn.microsoft.com/en-us/library/windows/desktop/aa820708%28v=vs.85%29.aspx?f=255&MSPPError=-2147217396
    https://technet.microsoft.com/en-us/library/cc732848.aspx

REMARKS
    To see the examples, type: "get-help Get-WevtLogInfo -examples".
    For more information, type: "get-help Get-WevtLogInfo -detailed".
    For technical information, type: "get-help Get-WevtLogInfo -full".
    For online help, type: "get-help Get-WevtLogInfo -online"
```
## [Install-WevtManifest](docs/Install-WevtManifest.md)
```
NAME
    Install-WevtManifest
    
SYNOPSIS
    Installs event publishers and logs from a manifest.
    
    
SYNTAX
    Install-WevtManifest -Manifest <Object> [<CommonParameters>]
    
    
DESCRIPTION
    Installs event publishers and logs from a manifest. For more
    information about event manifests and using this parameter, see
    the Windows Event Log SDK at the Microsoft Developers Network
    (MSDN) Web site (http://msdn.microsoft.com).
    

RELATED LINKS
    https://github.com/jeffpatton1971/mod-posh/wiki/WevtUtil#Install-WevtManifest
    https://msdn.microsoft.com/en-us/library/windows/desktop/aa820708%28v=vs.85%29.aspx?f=255&MSPPError=-2147217396
    https://technet.microsoft.com/en-us/library/cc732848.aspx

REMARKS
    To see the examples, type: "get-help Install-WevtManifest -examples".
    For more information, type: "get-help Install-WevtManifest -detailed".
    For technical information, type: "get-help Install-WevtManifest -full".
    For online help, type: "get-help Install-WevtManifest -online"
```
## [Uninstall-WevtManifest](docs/Uninstall-WevtManifest.md)
```
NAME
    Uninstall-WevtManifest
    
SYNOPSIS
    Uninstalls all publishers and logs from a manifest.
    
    
SYNTAX
    Uninstall-WevtManifest -Manifest <Object> [<CommonParameters>]
    
    
DESCRIPTION
    Uninstalls all publishers and logs from a manifest. For more
    information about event manifests and using this parameter, see
    the Windows Event Log SDK at the Microsoft Developers Network
    (MSDN) Web site (http://msdn.microsoft.com).
    

RELATED LINKS
    https://github.com/jeffpatton1971/mod-posh/wiki/WevtUtil#Uninstall-WevtManifest
    https://msdn.microsoft.com/en-us/library/windows/desktop/aa820708%28v=vs.85%29.aspx?f=255&MSPPError=-2147217396
    https://technet.microsoft.com/en-us/library/cc732848.aspx

REMARKS
    To see the examples, type: "get-help Uninstall-WevtManifest -examples".
    For more information, type: "get-help Uninstall-WevtManifest -detailed".
    For technical information, type: "get-help Uninstall-WevtManifest -full".
    For online help, type: "get-help Uninstall-WevtManifest -online"
```
## [Get-WevtPublisher](docs/Get-WevtPublisher.md)
```
NAME
    Get-WevtPublisher
    
SYNOPSIS
    Displays the configuration information for the specified event publisher.
    
    
SYNTAX
    Get-WevtPublisher -List [<CommonParameters>]
    
    Get-WevtPublisher -PublisherName <String> [-Metadata <Boolean>] [-Message <Boolean>] [-Format <String>] [<CommonParameters>]
    
    
DESCRIPTION
    Displays the configuration information for the specified event publisher.
    

RELATED LINKS
    https://github.com/jeffpatton1971/mod-posh/wiki/WevtUtil#Get-WevtPublisher
    https://msdn.microsoft.com/en-us/library/windows/desktop/aa820708%28v=vs.85%29.aspx?f=255&MSPPError=-2147217396
    https://technet.microsoft.com/en-us/library/cc732848.aspx

REMARKS
    To see the examples, type: "get-help Get-WevtPublisher -examples".
    For more information, type: "get-help Get-WevtPublisher -detailed".
    For technical information, type: "get-help Get-WevtPublisher -full".
    For online help, type: "get-help Get-WevtPublisher -online"
```


