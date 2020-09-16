---
external help file: wevtutil-help.xml
Module Name: wevtutil
online version: https://github.com/jeffpatton1971/mod-posh/wiki/WevtUtil#Save-WevtLog
schema: 2.0.0
---

# Save-wevtLog

## SYNOPSIS
Archives the specified log file in a self-contained format.

## SYNTAX

```
Save-wevtLog -LogPath <FileInfo> [<CommonParameters>]
```

## DESCRIPTION
Archives the specified log file in a self-contained format.
A subdirectory with the name of the locale is created and all locale-
specific information is saved in that subdirectory.
After the directory and log file are created by running Save-WevtLog, events
in the file can be read whether the publisher is installed or not.

## EXAMPLES

### EXAMPLE 1
```

```

## PARAMETERS

### -LogPath
Defines the log file name.
\<Logpath\> is a full path to the file
where the Event Log service stores events for this log.

```yaml
Type: FileInfo
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
FunctionName : Save-WevtLog
Created by   : jspatton
Date Coded   : 03/02/2015 11:20:23

## RELATED LINKS

[MSDN](https://msdn.microsoft.com/en-us/library/windows/desktop/aa820708%28v=vs.85%29.aspx?f=255&MSPPError=-2147217396)

[Technet](https://technet.microsoft.com/en-us/library/cc732848.aspx)

