---
external help file: wevtutil-help.xml
Module Name: wevtutil
online version: https://github.com/jeffpatton1971/mod-posh/wiki/WevtUtil#Install-WevtManifest
schema: 2.0.0
---

# Install-wevtManifest

## SYNOPSIS
Installs event publishers and logs from a manifest.

## SYNTAX

```
Install-wevtManifest -Manifest <FileInfo> [-ResourcePath <FileInfo>] [-MessagePath <FileInfo>]
 [-ParameterPath <FileInfo>] [<CommonParameters>]
```

## DESCRIPTION
Installs event publishers and logs from a manifest.
For more
information about event manifests and using this parameter, see
the Windows Event Log SDK at the Microsoft Developers Network
(MSDN) Web site (http://msdn.microsoft.com).

## EXAMPLES

### EXAMPLE 1
```
Install-WevtManifest -Manifest C:\Temp\Sample-Manifest.man
```

Description
-----------
Installs the Sample-Manifest as a publisher

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

### -MessagePath
MessageFileName attribute of the Provider Element in the manifest to be replaced.
The VALUE should be the full path to the message file.

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

### -ParameterPath
ParameterFileName attribute of the Provider Element in the manifest to be replaced
The VALUE should be the full path to the parameter file.

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

### -ResourcePath
ResourceFileName attribute of the Provider Element in the manifest to be
replaced.
The VALUE should be the full path to the resource file.

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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES
FunctionName : Install-WevtManifest
Created by   : jspatton
Date Coded   : 03/02/2015 10:26:34

## RELATED LINKS


[MSDN](https://msdn.microsoft.com/en-us/library/windows/desktop/aa820708%28v=vs.85%29.aspx?f=255&MSPPError=-2147217396)

[Technet](https://technet.microsoft.com/en-us/library/cc732848.aspx)

