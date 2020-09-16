---
external help file: wevtutil-help.xml
Module Name: wevtutil
online version: https://github.com/jeffpatton1971/mod-posh/wiki/WevtUtil#Install-WevtManifest
schema: 2.0.0
---

# Invoke-Wevtutil

## SYNOPSIS
{{ Fill in the Synopsis }}

## SYNTAX

### enum-logs
```
Invoke-wevtWevtutil [-EnumLog] [-ComputerName <String>] [-Credential <PSCredential>] [-Authentication <String>]
 [-Unicode <Boolean>] [<CommonParameters>]
```

### get-log
```
Invoke-wevtWevtutil [-GetLog] -LogName <String> -Format <String> [-ComputerName <String>]
 [-Credential <PSCredential>] [-Authentication <String>] [-Unicode <Boolean>] [<CommonParameters>]
```

### enum-publishers
```
Invoke-wevtWevtutil [-EnumPublishers] [-ComputerName <String>] [-Credential <PSCredential>]
 [-Authentication <String>] [-Unicode <Boolean>] [<CommonParameters>]
```

### get-publisher
```
Invoke-wevtWevtutil [-GetPublisher] -PublisherName <String> -GetEvents <Boolean> -GetMessage <Boolean>
 -Format <String> [-ComputerName <String>] [-Credential <PSCredential>] [-Authentication <String>]
 [-Unicode <Boolean>] [<CommonParameters>]
```

### get-loginfo
```
Invoke-wevtWevtutil [-GetLogInfo] -LogName <String> [-LogFile <Boolean>] [-ComputerName <String>]
 [-Credential <PSCredential>] [-Authentication <String>] [-Unicode <Boolean>] [<CommonParameters>]
```

### clear-log
```
Invoke-wevtWevtutil [-ClearLog] -LogName <String> -LogPath <String> [-ComputerName <String>]
 [-Credential <PSCredential>] [-Authentication <String>] [-Unicode <Boolean>] [<CommonParameters>]
```

### archive-log
```
Invoke-wevtWevtutil [-ArchiveLog] -LogPath <String> [-ComputerName <String>] [-Credential <PSCredential>]
 [-Authentication <String>] [-Unicode <Boolean>] [<CommonParameters>]
```

### export-log
```
Invoke-wevtWevtutil [-ExportLog] -LogPath <String> -Overwrite <Boolean> [-ComputerName <String>]
 [-Credential <PSCredential>] [-Authentication <String>] [-Unicode <Boolean>] [<CommonParameters>]
```

### install-manifest
```
Invoke-wevtWevtutil [-InstallManifest] -Manifest <String> [-ResourcePath <String>] [-MessagePath <String>]
 [-ParameterPath <String>] [-Unicode <Boolean>] [<CommonParameters>]
```

### uninstall-manifest
```
Invoke-wevtWevtutil [-UninstallManifest] [-Manifest <String>] [-Unicode <Boolean>] [<CommonParameters>]
```

### query-events
```
Invoke-wevtWevtutil [-QueryEvents] -LogName <String> -Format <String> -LogFile <Boolean> -QueryFile <Boolean>
 [-Query <String>] [-BookMark <String>] [-SaveBookMark <String>] [-Reverse <Boolean>] [-Count <Int32>]
 [-ComputerName <String>] [-Credential <PSCredential>] [-Authentication <String>] [-Unicode <Boolean>]
 [<CommonParameters>]
```

### set-log
```
Invoke-wevtWevtutil [-SetLog] -LogName <String> -LogPath <String> -Enabled <Boolean> -Quiet <Boolean>
 -FileMax <Int32> -Isolation <String> [-Retention <Boolean>] [-AutoBackup <Boolean>] [-MaxSize <Int32>]
 -Level <Int32> [-Keywords <String>] [-ChannelAccess <String>] [-Config <String>] [-ComputerName <String>]
 [-Credential <PSCredential>] [-Authentication <String>] [-Unicode <Boolean>] [<CommonParameters>]
```

## DESCRIPTION
{{ Fill in the Description }}

## EXAMPLES

### Example 1
```powershell
PS C:\> {{ Add example code here }}
```

{{ Add example description here }}

## PARAMETERS

### -ArchiveLog
{{ Fill ArchiveLog Description }}

```yaml
Type: System.Management.Automation.SwitchParameter
Parameter Sets: archive-log
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Authentication
{{ Fill Authentication Description }}

```yaml
Type: System.String
Parameter Sets: enum-logs, get-log, enum-publishers, get-publisher, get-loginfo, clear-log, archive-log, export-log, query-events, set-log
Aliases:
Accepted values: Default, Negotiate, Kerberos, NTLM

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -AutoBackup
{{ Fill AutoBackup Description }}

```yaml
Type: System.Boolean
Parameter Sets: set-log
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -BookMark
{{ Fill BookMark Description }}

```yaml
Type: System.String
Parameter Sets: query-events
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ChannelAccess
{{ Fill ChannelAccess Description }}

```yaml
Type: System.String
Parameter Sets: set-log
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ClearLog
{{ Fill ClearLog Description }}

```yaml
Type: System.Management.Automation.SwitchParameter
Parameter Sets: clear-log
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ComputerName
{{ Fill ComputerName Description }}

```yaml
Type: System.String
Parameter Sets: enum-logs, get-log, enum-publishers, get-publisher, get-loginfo, clear-log, archive-log, export-log, query-events, set-log
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Config
{{ Fill Config Description }}

```yaml
Type: System.String
Parameter Sets: set-log
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Count
{{ Fill Count Description }}

```yaml
Type: System.Int32
Parameter Sets: query-events
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Credential
{{ Fill Credential Description }}

```yaml
Type: System.Management.Automation.PSCredential
Parameter Sets: enum-logs, get-log, enum-publishers, get-publisher, get-loginfo, clear-log, archive-log, export-log, query-events, set-log
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Enabled
{{ Fill Enabled Description }}

```yaml
Type: System.Boolean
Parameter Sets: set-log
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -EnumLog
{{ Fill EnumLog Description }}

```yaml
Type: System.Management.Automation.SwitchParameter
Parameter Sets: enum-logs
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -EnumPublishers
{{ Fill EnumPublishers Description }}

```yaml
Type: System.Management.Automation.SwitchParameter
Parameter Sets: enum-publishers
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ExportLog
{{ Fill ExportLog Description }}

```yaml
Type: System.Management.Automation.SwitchParameter
Parameter Sets: export-log
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -FileMax
{{ Fill FileMax Description }}

```yaml
Type: System.Int32
Parameter Sets: set-log
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Format
{{ Fill Format Description }}

```yaml
Type: System.String
Parameter Sets: get-log, get-publisher, query-events
Aliases:
Accepted values: XML, Text

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -GetEvents
{{ Fill GetEvents Description }}

```yaml
Type: System.Boolean
Parameter Sets: get-publisher
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -GetLog
{{ Fill GetLog Description }}

```yaml
Type: System.Management.Automation.SwitchParameter
Parameter Sets: get-log
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -GetLogInfo
{{ Fill GetLogInfo Description }}

```yaml
Type: System.Management.Automation.SwitchParameter
Parameter Sets: get-loginfo
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -GetMessage
{{ Fill GetMessage Description }}

```yaml
Type: System.Boolean
Parameter Sets: get-publisher
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -GetPublisher
{{ Fill GetPublisher Description }}

```yaml
Type: System.Management.Automation.SwitchParameter
Parameter Sets: get-publisher
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -InstallManifest
{{ Fill InstallManifest Description }}

```yaml
Type: System.Management.Automation.SwitchParameter
Parameter Sets: install-manifest
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Isolation
{{ Fill Isolation Description }}

```yaml
Type: System.String
Parameter Sets: set-log
Aliases:
Accepted values: system, application, custom

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Keywords
{{ Fill Keywords Description }}

```yaml
Type: System.String
Parameter Sets: set-log
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Level
{{ Fill Level Description }}

```yaml
Type: System.Int32
Parameter Sets: set-log
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -LogFile
{{ Fill LogFile Description }}

```yaml
Type: System.Boolean
Parameter Sets: get-loginfo
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

```yaml
Type: System.Boolean
Parameter Sets: query-events
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -LogName
{{ Fill LogName Description }}

```yaml
Type: System.String
Parameter Sets: get-log, get-loginfo, clear-log, query-events, set-log
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -LogPath
{{ Fill LogPath Description }}

```yaml
Type: System.String
Parameter Sets: clear-log, archive-log, export-log, set-log
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Manifest
{{ Fill Manifest Description }}

```yaml
Type: System.String
Parameter Sets: install-manifest
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

```yaml
Type: System.String
Parameter Sets: uninstall-manifest
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -MaxSize
{{ Fill MaxSize Description }}

```yaml
Type: System.Int32
Parameter Sets: set-log
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -MessagePath
{{ Fill MessagePath Description }}

```yaml
Type: System.String
Parameter Sets: install-manifest
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Overwrite
{{ Fill Overwrite Description }}

```yaml
Type: System.Boolean
Parameter Sets: export-log
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ParameterPath
{{ Fill ParameterPath Description }}

```yaml
Type: System.String
Parameter Sets: install-manifest
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -PublisherName
{{ Fill PublisherName Description }}

```yaml
Type: System.String
Parameter Sets: get-publisher
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Query
{{ Fill Query Description }}

```yaml
Type: System.String
Parameter Sets: query-events
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -QueryEvents
{{ Fill QueryEvents Description }}

```yaml
Type: System.Management.Automation.SwitchParameter
Parameter Sets: query-events
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -QueryFile
{{ Fill QueryFile Description }}

```yaml
Type: System.Boolean
Parameter Sets: query-events
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Quiet
{{ Fill Quiet Description }}

```yaml
Type: System.Boolean
Parameter Sets: set-log
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ResourcePath
{{ Fill ResourcePath Description }}

```yaml
Type: System.String
Parameter Sets: install-manifest
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Retention
{{ Fill Retention Description }}

```yaml
Type: System.Boolean
Parameter Sets: set-log
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Reverse
{{ Fill Reverse Description }}

```yaml
Type: System.Boolean
Parameter Sets: query-events
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -SaveBookMark
{{ Fill SaveBookMark Description }}

```yaml
Type: System.String
Parameter Sets: query-events
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -SetLog
{{ Fill SetLog Description }}

```yaml
Type: System.Management.Automation.SwitchParameter
Parameter Sets: set-log
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Unicode
{{ Fill Unicode Description }}

```yaml
Type: System.Boolean
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -UninstallManifest
{{ Fill UninstallManifest Description }}

```yaml
Type: System.Management.Automation.SwitchParameter
Parameter Sets: uninstall-manifest
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None

## OUTPUTS

### System.Object
## NOTES

## RELATED LINKS
