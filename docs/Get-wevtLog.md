---
external help file: wevtutil-help.xml
Module Name: wevtutil
online version: https://github.com/jeffpatton1971/mod-posh/wiki/WevtUtil#Get-WevtLog
schema: 2.0.0
---

# Get-wevtLog

## SYNOPSIS
Displays configuration information for the specified log

## SYNTAX

### get-log
```
Get-wevtLog -Logname <Object> [-Format <String>] [<CommonParameters>]
```

### enum-logs
```
Get-wevtLog [-List] [<CommonParameters>]
```

## DESCRIPTION
Displays configuration information for the specified log, which
includes whether the log is enabled or not, the current maximum
size limit of the log, and the path to the file where the log is
stored.

## EXAMPLES

### EXAMPLE 1
``` powershell
Get-WevtLog -Logname System -Format xml

\<?xml version="1.0" encoding="UTF-8"?\>
\<channel name="System" enabled="true" type="Admin" owningPublisher="" isolation="System" channelAccess="O:BAG:SYD:(A;;0xf0007;;;SY)(A;;0x7;;;BA)(A;;0x3;;;BO)(A;;0x5;;;SO)(A;;0x1;;;IU)(A;;0x3;;;SU)(A;;0x1;;;S-1-5-3)(A;;0x2;;;S-1-5-33)(A;;0x1;;;S-1-5-32-573)" xmlns="http://schemas.microsoft.com/win/2004/08/events"\>
\<logging\>
\<logFileName\>%SystemRoot%\System32\Winevt\Logs\System.evtx\</logFileName\>
\<retention\>false\</retention\>
\<autoBackup\>false\</autoBackup\>
\<maxSize\>20971520\</maxSize\>
\</logging\>
\<publishing\>
\<fileMax\>1\</fileMax\>
\</publishing\>
\</channel\>
```

Get configuration information about the System log in XML format

### EXAMPLE 2
``` powershell
Get-WevtLog -List

Analytic
Application
Cisco AnyConnect Secure Mobility Client
ConnectionInfo
```

Get a list of all logs available

## PARAMETERS

### -Format
Specifies that the output should be either XML or text format.
If \<Format\> is XML, the output is displayed in XML format.
If
\<Format\> is Text, the output is displayed without XML tags.
The
default is Text.

```yaml
Type: System.String
Parameter Sets: get-log
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -List
If present displays the names of all logs.

```yaml
Type: System.Management.Automation.SwitchParameter
Parameter Sets: enum-logs
Aliases:

Required: True
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -Logname
The name of a log

```yaml
Type: System.Object
Parameter Sets: get-log
Aliases:

Required: True
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
FunctionName : Get-WevtLog
Created by   : jspatton
Date Coded   : 03/02/2015 8:26:42

## RELATED LINKS


[MSDN](https://msdn.microsoft.com/en-us/library/windows/desktop/aa820708%28v=vs.85%29.aspx?f=255&MSPPError=-2147217396)

[Technet](https://technet.microsoft.com/en-us/library/cc732848.aspx)

