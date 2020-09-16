---
Module Name: wevtutil
Module Guid: 8c44b75d-5bbf-41e7-afda-c7811322d6a8
Download Help Link: https://raw.githubusercontent.com/mod-posh/wevtutil/master/cabs/
Help Version: 1.0.0.0
Locale: en-US
---

# wevtutil Module
## Description
{{ Fill in the Description }}

## wevtutil Cmdlets
### [Clear-wevtLog](Clear-wevtLog.md)
Clears events from the specified event log.
The Backup option can be used to back up the cleared events.

### [Export-wevtLog](Export-wevtLog.md)
Exports events from an event log, from a log file, or using
a structured query to the specified file. By default, you provide
a log name for \<Logname\>. However, if you use the LogFile option, then
\<Logname\> must be a path to a log file. If you use the StructuredQuery
option, \<Logname\> must be a path to a file that contains a structured
query. \<Exportfile\> is a path to the file where the exported events
will be stored.

### [Find-wevtEvent](Find-wevtEvent.md)
Reads events from an event log, from a log file, or using a
structured query. By default, you provide a log name for \<Logname\>.
However, if you use the LogFile option, then \<Logname\> must be a
path to a log file. If you use the StructuredQuery parameter,
\<Logname\> must be a path to a file that contains a structured query.

### [Get-wevtLog](Get-wevtLog.md)
Displays configuration information for the specified log, which
includes whether the log is enabled or not, the current maximum
size limit of the log, and the path to the file where the log is
stored.

### [Get-wevtLogInfo](Get-wevtLogInfo.md)
Displays status information about an event log or log file.
If the LogFile option is used, \<Logname\> is a path to a log file.
You can run Get-WevtLog -List to obtain a list of log names.

### [Get-wevtPublisher](Get-wevtPublisher.md)
Displays the configuration information for the specified event publisher.

### [Install-wevtManifest](Install-wevtManifest.md)
Installs event publishers and logs from a manifest.
For more information about event manifests and using this parameter, see
the Windows Event Log SDK at the Microsoft Developers Network

### [Save-wevtLog](Save-wevtLog.md)
Archives the specified log file in a self-contained format.
A subdirectory with the name of the locale is created and all locale-
specific information is saved in that subdirectory.
After the directory and log file are created by running Save-WevtLog, events
in the file can be read whether the publisher is installed or not.

### [Set-wevtLog](Set-wevtLog.md)
Modifies the configuration of the specified log.

### [Uninstall-wevtManifest](Uninstall-wevtManifest.md)
Uninstalls all publishers and logs from a manifest.
For more information about event manifests and using this parameter, see
the Windows Event Log SDK at the Microsoft Developers Network
