---
external help file: wevtutil-help.xml
Module Name: wevtutil
online version: https://github.com/jeffpatton1971/mod-posh/wiki/WevtUtil#Find-WevtEvent
schema: 2.0.0
---

# Find-wevtEvent

## SYNOPSIS
Reads events from an event log, from a log file, or using a
structured query.

## SYNTAX

### LogName
```
Find-wevtEvent -LogName <String> [-Query <String>] [-Bookmark <FileInfo>] [-SaveBookMark <FileInfo>]
 [-Direction <Boolean>] [-Format <String>] [-Count <String>] [<CommonParameters>]
```

### LogFile
```
Find-wevtEvent [-LogFile <FileInfo>] [-Query <String>] [-Bookmark <FileInfo>] [-SaveBookMark <FileInfo>]
 [-Direction <Boolean>] [-Format <String>] [-Count <String>] [<CommonParameters>]
```

### QueryFile
```
Find-wevtEvent [-StructuredQuery <FileInfo>] [-Bookmark <FileInfo>] [-SaveBookMark <FileInfo>]
 [-Direction <Boolean>] [-Format <String>] [-Count <String>] [<CommonParameters>]
```

### query-events
```
Find-wevtEvent [-Format <String>] [<CommonParameters>]
```

## DESCRIPTION
Reads events from an event log, from a log file, or using a
structured query. By default, you provide a log name for \<Logname\>.
However, if you use the LogFile option, then \<Logname\> must be a
path to a log file. If you use the StructuredQuery parameter,
\<Logname\> must be a path to a file that contains a structured query.

## EXAMPLES

### EXAMPLE 1
```
powershell
Find-WevtEvent -LogName System -Direction $true -Count 1 -Format xml

\<Event xmlns='http://schemas.microsoft.com/win/2004/08/events/event'\>\<System\>\<Provider Name='Microsoft-Windows-Eventlog'
Guid='{fc65ddd8-d6ef-4962-83d5-6e5cfe9ce148}'/\>\<EventID\>105\</EventID\>\<Version\>0\</Version\>\<Level\>4\</Level\>\<Task\>105\</Tas
k\>\<Opcode\>0\</Opcode\>\<Keywords\>0x8000000000000000\</Keywords\>\<TimeCreated SystemTime='2015-03-02T19:31:37.776314200Z'/\>\<Ev
entRecordID\>125448\</EventRecordID\>\<Correlation/\>\<Execution ProcessID='720' ThreadID='952'/\>\<Channel\>System\</Channel\>\<Com
puter\>it08082.home.ku.edu\</Computer\>\<Security/\>\</System\>\<UserData\>\<AutoBackup xmlns='http://manifests.microsoft.com/win/
2004/08/windows/eventlog'\>\<Channel\>Microsoft-Windows-CAPI2/Operational\</Channel\>\<BackupPath\>C:\Windows\System32\Winevt\L
ogs\Archive-Microsoft-Windows-CAPI2%4Operational-2015-03-02-19-31-37-619.evtx\</BackupPath\>\</AutoBackup\>\</UserData\>\</Even
t\>
```

Get the last log from the System log in XML format

### EXAMPLE 2
```
powershell
Find-WevtEvent -LogName System -Direction $true -Count 1 -Format xml -Query "*[System[Level=3]]"

\<Event xmlns='http://schemas.microsoft.com/win/2004/08/events/event'\>\<System\>\<Provider Name='Microsoft-Windows-Time-Serv
ice' Guid='{06EDCFEB-0FD0-4E53-ACCA-A6F8BBF81BCB}'/\>\<EventID\>129\</EventID\>\<Version\>0\</Version\>\<Level\>3\</Level\>\<Task\>0\</T
ask\>\<Opcode\>0\</Opcode\>\<Keywords\>0x8000000000000000\</Keywords\>\<TimeCreated SystemTime='2015-03-02T14:02:15.448409500Z'/\>\<
EventRecordID\>125419\</EventRecordID\>\<Correlation/\>\<Execution ProcessID='1068' ThreadID='1668'/\>\<Channel\>System\</Channel\>
\<Computer\>it08082.home.ku.edu\</Computer\>\<Security UserID='S-1-5-19'/\>\</System\>\<EventData Name='TMP_EVENT_DOMAIN_PEER_DIS
COVERY_ERROR'\>\<Data Name='ErrorMessage'\>The entry is not found.
(0x800706E1)\</Data\>\<Data Name='RetryMinutes'\>15\</Data\>\</
EventData\>\</Event\>
```

Use an XPATH query to get the most recent Level 3 event

## PARAMETERS

### -Bookmark
Specifies the path to a file that contains a bookmark from a
previous query.

```yaml
Type: FileInfo
Parameter Sets: LogName, LogFile, QueryFile
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Count
Sets the maximum number of events to read.

```yaml
Type: String
Parameter Sets: LogName, LogFile, QueryFile
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Direction
Specifies the direction in which events are read.
\<Direction\> can be
true or false.
If true, the most recent events are returned first.

```yaml
Type: Boolean
Parameter Sets: LogName, LogFile, QueryFile
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -Format
Specifies that the output should be either XML or text format.
If \<Format\> is XML, the output is displayed in XML format.
If
\<Format\> is Text, the output is displayed without XML tags.
The
default is Text.

```yaml
Type: String
Parameter Sets: (All)
Aliases:
Accepted values: xml, text

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -LogFile
Specifies that the events should be read from a log or from a log
file.
\<Logfile\> can be true or false.
If true, the parameter to the
command is the path to a log file.

```yaml
Type: FileInfo
Parameter Sets: LogFile
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -LogName
The name of a log or path to a logfile/structured query file

```yaml
Type: String
Parameter Sets: LogName
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Query
Defines the XPath query to filter the events that are read or
exported.
If this option is not specified, all events will be
returned or exported.
This option is not available when /sq is true.

```yaml
Type: String
Parameter Sets: LogName, LogFile
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -SaveBookMark
Specifies the path to a file that is used to save a bookmark of this
query.
The file name extension should be .xml

```yaml
Type: FileInfo
Parameter Sets: LogName, LogFile, QueryFile
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -StructuredQuery
Specifies that events should be obtained with a structured query.
\<Structquery\> can be true or false.
If true, \<Path\> is the path to
a file that contains a structured query.

```yaml
Type: FileInfo
Parameter Sets: QueryFile
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
FunctionName : Find-WevtEvent
Created by   : jspatton
Date Coded   : 03/02/2015 10:35:12

## RELATED LINKS

[MSDN](https://msdn.microsoft.com/en-us/library/windows/desktop/aa820708%28v=vs.85%29.aspx?f=255&MSPPError=-2147217396)

[Technet](https://technet.microsoft.com/en-us/library/cc732848.aspx)

