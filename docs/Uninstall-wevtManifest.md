---
external help file: wevtutil-help.xml
Module Name: wevtutil
online version: https://github.com/jeffpatton1971/mod-posh/wiki/WevtUtil#Uninstall-WevtManifest
schema: 2.0.0
---

# Uninstall-wevtManifest

## SYNOPSIS
Uninstalls all publishers and logs from a manifest.

## SYNTAX

```
Uninstall-wevtManifest -Manifest <FileInfo> [<CommonParameters>]
```

## DESCRIPTION
Uninstalls all publishers and logs from a manifest.
For more
information about event manifests and using this parameter, see
the Windows Event Log SDK at the Microsoft Developers Network
(MSDN) Web site (http://msdn.microsoft.com).

## EXAMPLES

### EXAMPLE 1
```
Uninstall-WevtManifest -Manifest C:\Temp\Sample-Manifest.man
```

Description
-----------
Uninstalls the Sample-Manifest as a publisher

## PARAMETERS

### -Manifest
This is a valid XML file containing the Manifest, see MSDN for
more details.
https://msdn.microsoft.com/en-us/library/windows/desktop/dd996930(v=vs.85).aspx

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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES
FunctionName : Uninstall-WevtManifest
Created by   : jspatton
Date Coded   : 03/02/2015 10:30:24

## RELATED LINKS

[https://github.com/jeffpatton1971/mod-posh/wiki/WevtUtil#Uninstall-WevtManifest](https://github.com/jeffpatton1971/mod-posh/wiki/WevtUtil#Uninstall-WevtManifest)

[https://msdn.microsoft.com/en-us/library/windows/desktop/aa820708%28v=vs.85%29.aspx?f=255&MSPPError=-2147217396](https://msdn.microsoft.com/en-us/library/windows/desktop/aa820708%28v=vs.85%29.aspx?f=255&MSPPError=-2147217396)

[https://technet.microsoft.com/en-us/library/cc732848.aspx](https://technet.microsoft.com/en-us/library/cc732848.aspx)

