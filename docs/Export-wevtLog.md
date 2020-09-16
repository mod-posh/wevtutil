---
external help file: wevtutil-help.xml
Module Name: wevtutil
online version: https://github.com/jeffpatton1971/mod-posh/wiki/WevtUtil#Export-WevtLog
schema: 2.0.0
---

# Export-wevtLog

## SYNOPSIS
Exports events from an event log, from a log file, or using
a structured query to the specified file.

## SYNTAX

```
Export-wevtLog -LogPath <FileInfo> [-Overwrite] [<CommonParameters>]
```

## DESCRIPTION
Exports events from an event log, from a log file, or using
a structured query to the specified file.
By default, you provide
a log name for \<Logname\>.
However, if you use the LogFile option, then
\<Logname\> must be a path to a log file.
If you use the StructuredQuery
option, \<Logname\> must be a path to a file that contains a structured
query.
\<Exportfile\> is a path to the file where the exported events
will be stored.

## EXAMPLES

### EXAMPLE 1
```
Export-WevtLog -LogName Microsoft-Windows-CAPI2/Operational -ExportFile C:\temp\capi2-operational.evtx
```

# jspatton@IT08082 | 14:51:10 | 03-02-2015 | C:\projects\mod-posh\powershell\production #
Get-WevtLogInfo -LogName C:\temp\capi2-operational.evtx -LogFile

creationTime: 2015-03-02T20:51:10.530Z
lastAccessTime: 2015-03-02T20:51:10.530Z
lastWriteTime: 2015-03-02T20:51:10.655Z
fileSize: 1118208
attributes: 32
numberOfLogRecords: 409
oldestRecordNumber: 1

Description
-----------
Export the CAPI log to a file, then get information from the file using Get-WevtLogInfo

## PARAMETERS

### -LogPath
A path to the file where the exported events will be stored.

```yaml
Type: System.IO.FileInfo
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Overwrite
Specifies that the export file should be overwritten.
\<Overwrite\>
can be true or false.
If true, and the export file specified in
\<Exportfile\> already exists, it will be overwritten without
confirmation.

```yaml
Type: System.Management.Automation.SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES
FunctionName : Export-WevtLog
Created by   : jspatton
Date Coded   : 03/02/2015 11:15:23

## RELATED LINKS


[MSDN](https://msdn.microsoft.com/en-us/library/windows/desktop/aa820708%28v=vs.85%29.aspx?f=255&MSPPError=-2147217396)

[Technet](https://technet.microsoft.com/en-us/library/cc732848.aspx)

