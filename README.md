| Latest Version | Azure Pipelines | PowerShell Gallery | Github Release | Issues | Forks | License |
|-----------------|-----------------|----------------|----------------|----------------|----------------|----------------|
| ![Latest Version](https://img.shields.io/github/v/tag/mod-posh/wevtutil) | [![Build Status](https://dev.azure.com/patton-tech/mod-posh/_apis/build/status/mod-posh.ComputerManagement?repoName=mod-posh%2FComputerManagement&branchName=master)](https://dev.azure.com/patton-tech/mod-posh/_build/latest?definitionId=10&repoName=mod-posh%2FComputerManagement&branchName=master) | ![Powershell Gallery](https://img.shields.io/powershellgallery/dt/wevtutil) | ![Github Release](https://img.shields.io/github/downloads/mod-posh/wevtutil/total) | [![GitHub issues](https://img.shields.io/github/issues/mod-posh/wevtutil)](https://github.com/mod-posh/wevtutil/issues) | [![GitHub forks](https://img.shields.io/github/forks/mod-posh/wevtutil)](https://github.com/mod-posh/wevtutil/network) | [![GitHub license](https://img.shields.io/github/license/mod-posh/wevtutil)](https://github.com/mod-posh/wevtutil/blob/master/LICENSE)
## [Find-wevtEvent](docs/Find-wevtEvent.md)
```

NAME
    Find-wevtEvent
    
SYNOPSIS
    Reads events from an event log, from a log file, or using a
    structured query.
    
    
SYNTAX
    Find-wevtEvent -LogName <String> [-Query <String>] [-Bookmark <FileInfo>] [-SaveBookMark <FileInfo>] [-Direction <Boolean>] [-Format <String>] [-Count <String>] [<CommonParameters>]
    
    Find-wevtEvent [-LogFile <FileInfo>] [-Query <String>] [-Bookmark <FileInfo>] [-SaveBookMark <FileInfo>] [-Direction <Boolean>] [-Format <String>] [-Count <String>] [<CommonParameters>]
    
    Find-wevtEvent [-StructuredQuery <FileInfo>] [-Bookmark <FileInfo>] [-SaveBookMark <FileInfo>] [-Direction <Boolean>] [-Format <String>] [-Count <String>] [<CommonParameters>]
    
    Find-wevtEvent [-Format <String>] [<CommonParameters>]
    
    
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
    To see the examples, type: "get-help Find-wevtEvent -examples".
    For more information, type: "get-help Find-wevtEvent -detailed".
    For technical information, type: "get-help Find-wevtEvent -full".
    For online help, type: "get-help Find-wevtEvent -online"
```
## [Clear-wevtLog](docs/Clear-wevtLog.md)
```
NAME
    Clear-wevtLog
    
SYNOPSIS
    Clears events from the specified event log.
    
    
SYNTAX
    Clear-wevtLog -LogName <String> [-LogPath <FileInfo>] [<CommonParameters>]
    
    
DESCRIPTION
    Clears events from the specified event log. The Backup option can
    be used to back up the cleared events.
    

RELATED LINKS
    https://github.com/jeffpatton1971/mod-posh/wiki/WevtUtil#Clear-WevtLog
    https://msdn.microsoft.com/en-us/library/windows/desktop/aa820708%28v=vs.85%29.aspx?f=255&MSPPError=-2147217396
    https://technet.microsoft.com/en-us/library/cc732848.aspx

REMARKS
    To see the examples, type: "get-help Clear-wevtLog -examples".
    For more information, type: "get-help Clear-wevtLog -detailed".
    For technical information, type: "get-help Clear-wevtLog -full".
    For online help, type: "get-help Clear-wevtLog -online"
```
## [Export-wevtLog](docs/Export-wevtLog.md)
```
NAME
    Export-wevtLog
    
SYNOPSIS
    Exports events from an event log, from a log file, or using
    a structured query to the specified file.
    
    
SYNTAX
    Export-wevtLog -LogPath <FileInfo> [-Overwrite] [<CommonParameters>]
    
    
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
    To see the examples, type: "get-help Export-wevtLog -examples".
    For more information, type: "get-help Export-wevtLog -detailed".
    For technical information, type: "get-help Export-wevtLog -full".
    For online help, type: "get-help Export-wevtLog -online"
```
## [Get-wevtLog](docs/Get-wevtLog.md)
```
NAME
    Get-wevtLog
    
SYNOPSIS
    Displays configuration information for the specified log
    
    
SYNTAX
    Get-wevtLog -Logname <Object> [-Format <String>] [<CommonParameters>]
    
    Get-wevtLog -List [<CommonParameters>]
    
    
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
    To see the examples, type: "get-help Get-wevtLog -examples".
    For more information, type: "get-help Get-wevtLog -detailed".
    For technical information, type: "get-help Get-wevtLog -full".
    For online help, type: "get-help Get-wevtLog -online"
```
## [Save-wevtLog](docs/Save-wevtLog.md)
```
NAME
    Save-wevtLog
    
SYNOPSIS
    Archives the specified log file in a self-contained format.
    
    
SYNTAX
    Save-wevtLog -LogPath <FileInfo> [<CommonParameters>]
    
    
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
    To see the examples, type: "get-help Save-wevtLog -examples".
    For more information, type: "get-help Save-wevtLog -detailed".
    For technical information, type: "get-help Save-wevtLog -full".
    For online help, type: "get-help Save-wevtLog -online"
```
## [Set-wevtLog](docs/Set-wevtLog.md)
```
NAME
    Set-wevtLog
    
SYNOPSIS
    Modifies the configuration of the specified log.
    
    
SYNTAX
    Set-wevtLog -Logname <Object> [-Enabled <String>] [-Quiet <Boolean>] [-Isolation <String>] [-Logpath <FileInfo>] [-Retention <Boolean>] [-AutoBackup <Boolean>] [-Size <Int32>] [-Level <String>] [-Keywords <String>] [-Channel <String>] [-Config <FileInfo>] [-WhatIf] 
    [-Confirm] [<CommonParameters>]
    
    
DESCRIPTION
    Modifies the configuration of the specified log.
    

RELATED LINKS
    https://github.com/jeffpatton1971/mod-posh/wiki/WevtUtil#Set-WevtLog
    https://msdn.microsoft.com/en-us/library/windows/desktop/aa820708%28v=vs.85%29.aspx?f=255&MSPPError=-2147217396
    https://technet.microsoft.com/en-us/library/cc732848.aspx

REMARKS
    To see the examples, type: "get-help Set-wevtLog -examples".
    For more information, type: "get-help Set-wevtLog -detailed".
    For technical information, type: "get-help Set-wevtLog -full".
    For online help, type: "get-help Set-wevtLog -online"
```
## [Get-wevtLogInfo](docs/Get-wevtLogInfo.md)
```
NAME
    Get-wevtLogInfo
    
SYNOPSIS
    Displays status information about an event log or log file.
    
    
SYNTAX
    Get-wevtLogInfo -LogName <String> [-LogFile] [<CommonParameters>]
    
    
DESCRIPTION
    Displays status information about an event log or log file. If the
    LogFile option is used, <Logname> is a path to a log file. You can
    run Get-WevtLog -List to obtain a list of log names.
    

RELATED LINKS
    https://github.com/jeffpatton1971/mod-posh/wiki/WevtUtil#Get-WevtLogInfo
    https://msdn.microsoft.com/en-us/library/windows/desktop/aa820708%28v=vs.85%29.aspx?f=255&MSPPError=-2147217396
    https://technet.microsoft.com/en-us/library/cc732848.aspx

REMARKS
    To see the examples, type: "get-help Get-wevtLogInfo -examples".
    For more information, type: "get-help Get-wevtLogInfo -detailed".
    For technical information, type: "get-help Get-wevtLogInfo -full".
    For online help, type: "get-help Get-wevtLogInfo -online"
```
## [Install-wevtManifest](docs/Install-wevtManifest.md)
```
NAME
    Install-wevtManifest
    
SYNOPSIS
    Installs event publishers and logs from a manifest.
    
    
SYNTAX
    Install-wevtManifest -Manifest <FileInfo> [-ResourcePath <FileInfo>] [-MessagePath <FileInfo>] [-ParameterPath <FileInfo>] [<CommonParameters>]
    
    
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
    To see the examples, type: "get-help Install-wevtManifest -examples".
    For more information, type: "get-help Install-wevtManifest -detailed".
    For technical information, type: "get-help Install-wevtManifest -full".
    For online help, type: "get-help Install-wevtManifest -online"
```
## [Uninstall-wevtManifest](docs/Uninstall-wevtManifest.md)
```
NAME
    Uninstall-wevtManifest
    
SYNOPSIS
    Uninstalls all publishers and logs from a manifest.
    
    
SYNTAX
    Uninstall-wevtManifest -Manifest <FileInfo> [<CommonParameters>]
    
    
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
    To see the examples, type: "get-help Uninstall-wevtManifest -examples".
    For more information, type: "get-help Uninstall-wevtManifest -detailed".
    For technical information, type: "get-help Uninstall-wevtManifest -full".
    For online help, type: "get-help Uninstall-wevtManifest -online"
```
## [Get-wevtPublisher](docs/Get-wevtPublisher.md)
```
NAME
    Get-wevtPublisher
    
SYNOPSIS
    Displays the configuration information for the specified event publisher.
    
    
SYNTAX
    Get-wevtPublisher -List [<CommonParameters>]
    
    Get-wevtPublisher -PublisherName <String> [-Metadata <Boolean>] [-Message <Boolean>] [-Format <String>] [<CommonParameters>]
    
    
DESCRIPTION
    Displays the configuration information for the specified event publisher.
    

RELATED LINKS
    https://github.com/jeffpatton1971/mod-posh/wiki/WevtUtil#Get-WevtPublisher
    https://msdn.microsoft.com/en-us/library/windows/desktop/aa820708%28v=vs.85%29.aspx?f=255&MSPPError=-2147217396
    https://technet.microsoft.com/en-us/library/cc732848.aspx

REMARKS
    To see the examples, type: "get-help Get-wevtPublisher -examples".
    For more information, type: "get-help Get-wevtPublisher -detailed".
    For technical information, type: "get-help Get-wevtPublisher -full".
    For online help, type: "get-help Get-wevtPublisher -online"
```
## [Invoke-wevtWevtutil](docs/Invoke-wevtWevtutil.md)
```

CommonParameters         : True
WorkflowCommonParameters : False
details                  : @{name=Invoke-wevtWevtutil; noun=; verb=}
Syntax                   : @{syntaxItem=System.Object[]}
parameters               : @{parameter=System.Object[]}
inputTypes               : @{inputType=}
returnValues             : @{returnValue=}
aliases                  : None
                           
remarks                  : Get-Help cannot find the Help files for this cmdlet on this computer. It is displaying only partial help.
                               -- To download and install Help files for the module that includes this cmdlet, use Update-Help.
alertSet                 : 
description              : 
examples                 : 
Synopsis                 : 
                           Invoke-wevtWevtutil [-EnumLog] [-ComputerName <string>] [-Credential <pscredential>] [-Authentication <string>] [-Unicode <bool>] [<CommonParameters>]
                           
                           Invoke-wevtWevtutil -LogName <string> -Format <string> [-GetLog] [-ComputerName <string>] [-Credential <pscredential>] [-Authentication <string>] [-Unicode <bool>] [<CommonParameters>]
                           
                           Invoke-wevtWevtutil [-EnumPublishers] [-ComputerName <string>] [-Credential <pscredential>] [-Authentication <string>] [-Unicode <bool>] [<CommonParameters>]
                           
                           Invoke-wevtWevtutil -PublisherName <string> -GetEvents <bool> -GetMessage <bool> -Format <string> [-GetPublisher] [-ComputerName <string>] [-Credential <pscredential>] [-Authentication <string>] [-Unicode <bool>] [<CommonParameters>]
                           
                           Invoke-wevtWevtutil -LogName <string> [-GetLogInfo] [-LogFile <bool>] [-ComputerName <string>] [-Credential <pscredential>] [-Authentication <string>] [-Unicode <bool>] [<CommonParameters>]
                           
                           Invoke-wevtWevtutil -LogName <string> -LogPath <string> [-ClearLog] [-ComputerName <string>] [-Credential <pscredential>] [-Authentication <string>] [-Unicode <bool>] [<CommonParameters>]
                           
                           Invoke-wevtWevtutil -LogPath <string> [-ArchiveLog] [-ComputerName <string>] [-Credential <pscredential>] [-Authentication <string>] [-Unicode <bool>] [<CommonParameters>]
                           
                           Invoke-wevtWevtutil -LogPath <string> -Overwrite <bool> [-ExportLog] [-ComputerName <string>] [-Credential <pscredential>] [-Authentication <string>] [-Unicode <bool>] [<CommonParameters>]
                           
                           Invoke-wevtWevtutil -Manifest <string> [-InstallManifest] [-ResourcePath <string>] [-MessagePath <string>] [-ParameterPath <string>] [-Unicode <bool>] [<CommonParameters>]
                           
                           Invoke-wevtWevtutil [-UninstallManifest] [-Manifest <string>] [-Unicode <bool>] [<CommonParameters>]
                           
                           Invoke-wevtWevtutil -LogName <string> -Format <string> -LogFile <bool> -QueryFile <bool> [-QueryEvents] [-Query <string>] [-BookMark <string>] [-SaveBookMark <string>] [-Reverse <bool>] [-Count <int>] [-ComputerName <string>] [-Credential 
                           <pscredential>] [-Authentication <string>] [-Unicode <bool>] [<CommonParameters>]
                           
                           Invoke-wevtWevtutil -LogName <string> -LogPath <string> -Enabled <bool> -Quiet <bool> -FileMax <int> -Isolation <string> -Level <int> [-SetLog] [-Retention <bool>] [-AutoBackup <bool>] [-MaxSize <int>] [-Keywords <string>] [-ChannelAccess 
                           <string>] [-Config <string>] [-ComputerName <string>] [-Credential <pscredential>] [-Authentication <string>] [-Unicode <bool>] [<CommonParameters>]
                           
ModuleName               : wevtutil
nonTerminatingErrors     : 
xmlns:command            : http://schemas.microsoft.com/maml/dev/command/2004/10
xmlns:dev                : http://schemas.microsoft.com/maml/dev/2004/10
xmlns:maml               : http://schemas.microsoft.com/maml/2004/10
Name                     : Invoke-wevtWevtutil
Category                 : Function
Component                : 
Role                     : 
Functionality            : 

```


