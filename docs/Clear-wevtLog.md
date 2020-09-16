---
external help file: wevtutil-help.xml
Module Name: wevtutil
online version: https://github.com/jeffpatton1971/mod-posh/wiki/WevtUtil#Clear-WevtLog
schema: 2.0.0
---

# Clear-wevtLog

## SYNOPSIS
Clears events from the specified event log.

## SYNTAX

```
Clear-wevtLog -LogName <String> [-LogPath <FileInfo>] [<CommonParameters>]
```

## DESCRIPTION
Clears events from the specified event log.
The Backup option can be used to back up the cleared events.

## EXAMPLES

### EXAMPLE 1
```

```

## PARAMETERS

### -LogName
The name of a log

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

### -LogPath
Specifies the path to a file where the cleared events will be
stored.
Include the .evtx extension in the name of the backup file.

```yaml
Type: FileInfo
Parameter Sets: (All)
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

## OUTPUTS

## NOTES
FunctionName : Clear-WevtLog
Created by   : jspatton
Date Coded   : 03/02/2015 11:26:42

## RELATED LINKS

[MSDN](https://msdn.microsoft.com/en-us/library/windows/desktop/aa820708%28v=vs.85%29.aspx?f=255&MSPPError=-2147217396)

[Technet](https://technet.microsoft.com/en-us/library/cc732848.aspx)

