---
external help file: wevtutil-help.xml
Module Name: wevtutil
online version: https://github.com/jeffpatton1971/mod-posh/wiki/WevtUtil#Get-WevtPublisher
schema: 2.0.0
---

# Get-wevtPublisher

## SYNOPSIS
Displays the configuration information for the specified event publisher.

## SYNTAX

### enum-publishers
```
Get-wevtPublisher [-List] [<CommonParameters>]
```

### get-publisher
```
Get-wevtPublisher -PublisherName <String> [-Metadata <Boolean>] [-Message <Boolean>] [-Format <String>]
 [<CommonParameters>]
```

## DESCRIPTION
Displays the configuration information for the specified event publisher.

## EXAMPLES

### EXAMPLE 1
```
powershell
Get-WevtPublisher -List |Select-String "capi"

Microsoft-Windows-CAPI2
Microsoft-Windows-WMPNSS-PublicAPI
```

Filter the list of Publishers to find just the ones related to CAPI

### EXAMPLE 2
```
powershell
Get-WevtPublisher -PublisherName Microsoft-Windows-CAPI2 -Metadata $true -Message $true -Format xml

\<?xml version="1.0" encoding="UTF-8"?\>
\<provider name="Microsoft-Windows-CAPI2" guid="5bbca4a8-b209-48dc-a8c7-b23d3e5216fb" helpLink="http://go.microsoft.com/f
wlink/events.asp?CoName=Microsoft%20Corporation&amp;ProdName=Microsoft%c2%ae%20Windows%c2%ae%20Operating%20System&amp;Pr
odVer=6.3.9600.16431&amp;FileName=crypt32.dll&amp;FileVer=6.3.9600.16431" resourceFileName="C:\Windows\System32\crypt32.
dll" messageFileName="C:\Windows\System32\crypt32.dll" message="Microsoft-Windows-CAPI2" xmlns="http://schemas.microsoft
.com/win/2004/08/events"\>
\<channels\>
\<channel name="Application" id="9" flags="1" message="Application"\>
\</channel\>
\<channel name="Microsoft-Windows-CAPI2/Operational" id="16" flags="0" message="Microsoft-Windows-CAPI2/Operational"\>

\</channel\>
\<channel name="Microsoft-Windows-CAPI2/Catalog Database Debug" id="17" flags="0" message="Microsoft-Windows-CAPI2/Ca
talog Database Debug"\>
\</channel\>
\</channels\>
```

Get the configuration of the CAPI2 publisher with Metadata and Messages, in XML format.

## PARAMETERS

### -Format
Specifies that the output should be either XML or text format.
If \<Format\> is XML, the output is displayed in XML format.
If
\<Format\> is Text, the output is displayed without XML tags.
The
default is Text.

```yaml
Type: String
Parameter Sets: get-publisher
Aliases:
Accepted values: xml, text

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -List
Displays the event publishers on the local computer.

```yaml
Type: SwitchParameter
Parameter Sets: enum-publishers
Aliases:

Required: True
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -Message
Displays the actual message instead of the numeric message ID.
\<Message\>
can be true or false.

```yaml
Type: Boolean
Parameter Sets: get-publisher
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -Metadata
Gets metadata information for events that can be raised by this publisher.
\<Metadata\> can be true or false.

```yaml
Type: Boolean
Parameter Sets: get-publisher
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -PublisherName
The name of a Publisher

```yaml
Type: String
Parameter Sets: get-publisher
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
FunctionName : Get-WevtPublisher
Created by   : jspatton
Date Coded   : 03/02/2015 9:24:02

## RELATED LINKS

[MSDN](https://msdn.microsoft.com/en-us/library/windows/desktop/aa820708%28v=vs.85%29.aspx?f=255&MSPPError=-2147217396)

[Technet](https://technet.microsoft.com/en-us/library/cc732848.aspx)

