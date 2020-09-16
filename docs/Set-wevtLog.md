---
external help file: wevtutil-help.xml
Module Name: wevtutil
online version: https://github.com/jeffpatton1971/mod-posh/wiki/WevtUtil#Set-WevtLog
schema: 2.0.0
---

# Set-wevtLog

## SYNOPSIS
Modifies the configuration of the specified log.

## SYNTAX

```
Set-wevtLog -Logname <Object> [-Enabled <String>] [-Quiet <Boolean>] [-Isolation <String>]
 [-Logpath <FileInfo>] [-Retention <Boolean>] [-AutoBackup <Boolean>] [-Size <Int32>] [-Level <String>]
 [-Keywords <String>] [-Channel <String>] [-Config <FileInfo>] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Modifies the configuration of the specified log.

## EXAMPLES

### EXAMPLE 1
``` powershell
Set-WevtLog -Logname Microsoft-Windows-CAPI2/Operational -Enabled $true -Retention $true -AutoBackup $true

# jspatton@IT08082 | 13:16:15 | 03-02-2015 | C:\projects\mod-posh\powershell\production #
Get-WevtLog -Logname Microsoft-Windows-CAPI2/Operational

name: Microsoft-Windows-CAPI2/Operational
enabled: true
type: Operational
owningPublisher: Microsoft-Windows-CAPI2
isolation: Application
channelAccess: O:BAG:SYD:(A;;0x7;;;BA)(A;;0x2;;;AU)
logging:
logFileName: %SystemRoot%\System32\Winevt\Logs\Microsoft-Windows-CAPI2%4Operational.evtx
retention: true
autoBackup: true
maxSize: 1052672
publishing:
fileMax: 1
```

Enable the CAPI2 log, and set it's retention and autobackup settings.
Then use Get-WevtLog
to confirm.

## PARAMETERS

### -AutoBackup
Specifies the log auto-backup policy.
\<Auto\> can be true or false.
If this value is true, the log will be backed up automatically when
it reaches the maximum size.
If this value is true, the retention
(specified with the Retention option) must also be set to true.

```yaml
Type: System.Boolean
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -Channel
Sets the access permission for an event log.
\<Channel\> is a
security descriptor that uses the Security Descriptor Definition
Language (SDDL).
For more information about SDDL format, see the
Microsoft Developers Network (MSDN) Web site (http://msdn.microsoft.com).

```yaml
Type: System.String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Config
Specifies the path to a configuration file.
This option will cause
log properties to be read from the configuration file defined in
\<Config\>.
If you use this option, you must not specify a \<Logname\>
parameter.
The log name will be read from the configuration file.

```yaml
Type: System.IO.FileInfo
Parameter Sets: (All)
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
Type: System.String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Isolation
Sets the log isolation mode.
\<Isolation\> can be system, application
or custom.
The isolation mode of a log determines whether a log
shares a session with other logs in the same isolation class.
If
you specify system isolation, the target log will share at least
write permissions with the System log.
If you specify application
isolation, the target log will share at least write permissions
with the Application log.
If you specify custom isolation, you
must also provide a security descriptor by using the Channel option.

```yaml
Type: System.String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Keywords
Specifies the keywords filter of the log.
\<Keywords\> can be any
valid 64 bit keyword mask.
This option is only applicable to logs
with a dedicated session.

```yaml
Type: System.String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Level
Defines the level filter of the log.
\<Level\> can be any valid level
value.
This option is only applicable to logs with a dedicated
session.
You can remove a level filter by setting \<Level\> to 0.

```yaml
Type: System.String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Logname
The name of a log

```yaml
Type: System.Object
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Logpath
Defines the log file name.
\<Logpath\> is a full path to the file
where the Event Log service stores events for this log.

```yaml
Type: System.IO.FileInfo
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Quiet
Quiet display option.
No prompts or messages are displayed to the user.
If not
specified, the default is true.

```yaml
Type: System.Boolean
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -Retention
Sets the log retention mode.
\<Retention\> can be true or false.
The
log retention mode determines the behavior of the Event Log service
when a log reaches its maximum size.
If an event log reaches its
maximum size and the log retention mode is true, existing events
are retained and incoming events are discarded.
If the log
retention mode is false, incoming events overwrite the oldest
events in the log.

```yaml
Type: System.Boolean
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -Size
Sets the maximum size of the log in bytes.
The minimum log size is
1048576 bytes (1024KB) and log files are always multiples of 64KB,
so the value you enter will be rounded off accordingly.

```yaml
Type: System.Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -Confirm
Prompts you for confirmation before running the cmdlet.

```yaml
Type: System.Management.Automation.SwitchParameter
Parameter Sets: (All)
Aliases: cf

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -WhatIf
Shows what would happen if the cmdlet runs.
The cmdlet is not run.

```yaml
Type: System.Management.Automation.SwitchParameter
Parameter Sets: (All)
Aliases: wi

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES
FunctionName : Set-WevtLog
Created by   : jspatton
Date Coded   : 03/02/2015 8:50:14

## RELATED LINKS


[MSDN](https://msdn.microsoft.com/en-us/library/windows/desktop/aa820708%28v=vs.85%29.aspx?f=255&MSPPError=-2147217396)

[Technet](https://technet.microsoft.com/en-us/library/cc732848.aspx)

