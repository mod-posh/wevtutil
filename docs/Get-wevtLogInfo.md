---
external help file: wevtutil-help.xml
Module Name: wevtutil
online version: https://github.com/jeffpatton1971/mod-posh/wiki/WevtUtil#Get-WevtLogInfo
schema: 2.0.0
---

# Get-wevtLogInfo

## SYNOPSIS
Displays status information about an event log or log file.

## SYNTAX

```
Get-wevtLogInfo -LogName <String> [-LogFile] [<CommonParameters>]
```

## DESCRIPTION
Displays status information about an event log or log file.
If the LogFile option is used, \<Logname\> is a path to a log file.
You can run Get-WevtLog -List to obtain a list of log names.

## EXAMPLES

### EXAMPLE 1
```
powershell
Get-WevtLogInfo -LogName Microsoft-Windows-CAPI2/Operational

creationTime: 2015-03-02T18:08:49.513Z
lastAccessTime: 2015-03-02T18:08:49.513Z
lastWriteTime: 2015-03-02T19:57:11.003Z
fileSize: 1052672
attributes: 32
numberOfLogRecords: 177
oldestRecordNumber: 1
```

Get the log information for the CAPI log

## PARAMETERS

### -LogFile
Specifies that the events should be read from a log or from a log
file.
\<Logfile\> can be true or false.
If true, the parameter to the
command is the path to a log file.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -LogName
The name of a log or path to a logfile/structured query file

```yaml
Type: String
Parameter Sets: (All)
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
FunctionName : Get-WevtLogInfo
Created by   : jspatton
Date Coded   : 03/02/2015 10:47:25

## RELATED LINKS

[MSDN](https://msdn.microsoft.com/en-us/library/windows/desktop/aa820708%28v=vs.85%29.aspx?f=255&MSPPError=-2147217396)

[Technet](https://technet.microsoft.com/en-us/library/cc732848.aspx)

