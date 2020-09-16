Function Get-Log {
  [CmdletBinding(HelpURI = 'https://github.com/mod-posh/wevtutil/blob/master/docs/Get-Log.md#get-log')]
  Param
  (
    [Parameter(Mandatory = $true, ParameterSetName = 'get-log')]
    $Logname,
    [ValidateSet("xml", "text")]
    [Parameter(ParameterSetName = 'get-log')]
    [string]$Format,
    [Parameter(Mandatory = $true, ParameterSetName = 'enum-logs')]
    [switch]$List
  )
  switch ($PSCmdlet.ParameterSetName) {
    'get-log' {
      if (Invoke-Wevtutil -EnumLog | Where-Object { $_ -eq $Logname }) {
        Invoke-Wevtutil -GetLog -LogName "`"$Logname`"" -Format $Format;
      }
    }
    'enum-logs' {
      Invoke-Wevtutil -EnumLog;
    }
  }
}
Function Get-LogInfo {
  [CmdletBinding(HelpURI = 'https://github.com/mod-posh/wevtutil/blob/master/docs/Get-LogInfo.md#get-loginfo')]
  Param
  (
    [Parameter(Mandatory = $true, ParameterSetName = 'get-loginfo')]
    [string]$LogName,
    [Parameter(Mandatory = $false, ParameterSetName = 'get-loginfo')]
    [switch]$LogFile
  )
  if ($LogFile) {
    if ((Test-Path $LogName)) {
      Invoke-Wevtutil -GetLogInfo -LogName $LogName -LogFile $LogFile;
    }
    else {
      throw "$($LogName) must be a path and filename to a logfile"
    }
  }
  else {
    if (Invoke-Wevtutil -EnumLog | Where-Object { $_ -eq $Logname }) {
      Invoke-Wevtutil -GetLogInfo -LogName $LogName;
    }
  }
}
Function Get-Publisher {
  [CmdletBinding(HelpURI = 'https://github.com/mod-posh/wevtutil/blob/master/docs/Get-Publisher.md#get-publisher')]
  Param
  (
    [Parameter(Mandatory = $true, ParameterSetName = 'enum-publishers')]
    [switch]$List,
    [Parameter(Mandatory = $true, ParameterSetName = 'get-publisher')]
    [string]$PublisherName,
    [Parameter(Mandatory = $false, ParameterSetName = 'get-publisher')]
    [bool]$Metadata,
    [Parameter(Mandatory = $false, ParameterSetName = 'get-publisher')]
    [bool]$Message,
    [Parameter(Mandatory = $false, ParameterSetName = 'get-publisher')]
    [ValidateSet("xml", "text")]
    [string]$Format
  )
  switch ($PSCmdlet.ParameterSetName) {
    'enum-publishers' {
      Invoke-Wevtutil -EnumPublishers;
    }
    'get-publisher' {
      if (Invoke-Wevtutil -EnumPublishers | Where-Object { $_ -eq $PublisherName }) {
        Invoke-Wevtutil -GetPublisher -PublisherName "`"$PublisherName"`" -GetEvents $Metadata -GetMessage $Message -Format $Format;
      }
    }
  }
}
Function Export-Log {
  [CmdletBinding(HelpURI = 'https://github.com/mod-posh/wevtutil/blob/master/docs/Export-Log.md#export-log')]
  Param
  (
    [Parameter(Mandatory = $true, ParameterSetName = 'export-log')]
    [System.IO.FileInfo]$LogPath,
    [Parameter(Mandatory = $false, ParameterSetName = 'export-log')]
    [switch]$Overwrite
  )
  if ($LogPath.Exists) {
    Invoke-Wevtutil -ExportLog -LogPath $LogPath.FullName -Overwrite $Overwrite;
  }
  else {
    throw "$($LogPath.FullName) must be a file and path to a log file"
  }
}
Function Save-Log {
  <#
  .SYNOPSIS
  Archives the specified log file in a self-contained format.
  .DESCRIPTION
  Archives the specified log file in a self-contained format. A
  subdirectory with the name of the locale is created and all locale-
  specific information is saved in that subdirectory. After the
  directory and log file are created by running Save-WevtLog, events
  in the file can be read whether the publisher is installed or not.
  .PARAMETER LogPath
  Defines the log file name. <Logpath> is a full path to the file
  where the Event Log service stores events for this log.
  .EXAMPLE
  .NOTES
  FunctionName : Save-WevtLog
  Created by   : jspatton
  Date Coded   : 03/02/2015 11:20:23
  .LINK
  https://github.com/jeffpatton1971/mod-posh/wiki/WevtUtil#Save-WevtLog
  .LINK
  https://msdn.microsoft.com/en-us/library/windows/desktop/aa820708%28v=vs.85%29.aspx?f=255&MSPPError=-2147217396
  .LINK
  https://technet.microsoft.com/en-us/library/cc732848.aspx
  #>
  [CmdletBinding()]
  Param
  (
    [Parameter(Mandatory = $true, ParameterSetName = 'archive-log')]
    [System.IO.FileInfo]$LogPath
  )
  if ($LogPath.Exists) {
    Invoke-Wevtutil -ArchiveLog -LogPath $LogPath.FullName;
  }
  else {
    throw "$($LogPath.FullName) must be a file and path to a log file"
  }
}
Function Clear-Log {
  [CmdletBinding(HelpURI = 'https://github.com/mod-posh/wevtutil/blob/master/docs/Clear-Log.md#clear-log')]
  Param
  (
    [Parameter(Mandatory = $true, ParameterSetName = 'clear-log')]
    [string]$LogName,
    [Parameter(Mandatory = $false, ParameterSetName = 'clear-log')]
    [System.IO.FileInfo]$LogPath
  )
  if (Invoke-Wevtutil -EnumLog | Where-Object { $_ -eq $Logname }) {
    if ($Logpath.Extension.ToLower() -eq '.evtx') {
      Invoke-Wevtutil -ClearLog -LogName "`"$Logname`"" -LogPath $LogPath
    }
  }
}
Function Install-Manifest {
  [CmdletBinding(HelpURI = 'https://github.com/mod-posh/wevtutil/blob/master/docs/Install-Manifest.md#install-manifest')]
  Param
  (
    [Parameter(Mandatory = $true, ParameterSetName = 'install-manifest')]
    [System.IO.FileInfo]$Manifest,
    [Parameter(Mandatory = $false, ParameterSetName = 'install-manifest')]
    [System.IO.FileInfo]$ResourcePath,
    [Parameter(Mandatory = $false, ParameterSetName = 'install-manifest')]
    [System.IO.FileInfo]$MessagePath,
    [Parameter(Mandatory = $false, ParameterSetName = 'install-manifest')]
    [System.IO.FileInfo]$ParameterPath
  )
  $Params = @{};
  if ($Manifest.Exists) {
    $Params.Add('Manifest', $Manifest.FullName);
  }
  if ($ResourcePath.Exists) {
    $Params.Add('ResourcePath', $ResourcePath.FullName);
  }
  if ($MessagePath.Exists) {
    $Params.Add('MessagePath', $MessagePath.FullName);
  }
  if ($ParameterPath.Exists) {
    $Params.Add('ParameterPath', $ParameterPath.FullName);
  }
  Invoke-Wevtutil -InstallManifest @Params;
}
Function Uninstall-Manifest {
  <#
  .SYNOPSIS
  Uninstalls all publishers and logs from a manifest.
  .DESCRIPTION
  Uninstalls all publishers and logs from a manifest. For more
  information about event manifests and using this parameter, see
  the Windows Event Log SDK at the Microsoft Developers Network
  (MSDN) Web site (http://msdn.microsoft.com).
  .PARAMETER Manifest
  This is a valid XML file containing the Manifest, see MSDN for
  more details.
  https://msdn.microsoft.com/en-us/library/windows/desktop/dd996930(v=vs.85).aspx
  .EXAMPLE
  Uninstall-WevtManifest -Manifest C:\Temp\Sample-Manifest.man

  Description
  -----------
  Uninstalls the Sample-Manifest as a publisher
  .NOTES
  FunctionName : Uninstall-WevtManifest
  Created by   : jspatton
  Date Coded   : 03/02/2015 10:30:24
  .LINK
  https://github.com/jeffpatton1971/mod-posh/wiki/WevtUtil#Uninstall-WevtManifest
  .LINK
  https://msdn.microsoft.com/en-us/library/windows/desktop/aa820708%28v=vs.85%29.aspx?f=255&MSPPError=-2147217396
  .LINK
  https://technet.microsoft.com/en-us/library/cc732848.aspx
  #>
  [CmdletBinding()]
  Param
  (
    [Parameter(Mandatory = $true, ParameterSetName = 'uninstall-manifest')]
    [System.IO.FileInfo]$Manifest
  )
  if ($Manifest.Exists) {
    Invoke-Wevtutil -UninstallManifest -Manifest $Manifest.FullName;
  }
}
Function Find-Event {
  [CmdletBinding(HelpURI = 'https://github.com/mod-posh/wevtutil/blob/master/docs/Find-Log.md#find-log')]
  Param
  (
    [Parameter(Mandatory = $true, ParameterSetName = 'LogName')]
    [string]$LogName,
    [Parameter(Mandatory = $false, ParameterSetName = 'LogFile')]
    [System.IO.FileInfo]$LogFile,
    [Parameter(Mandatory = $false, ParameterSetName = 'QueryFile')]
    [System.IO.FileInfo]$StructuredQuery,
    [Parameter(Mandatory = $false, ParameterSetName = 'LogName')]
    [Parameter(Mandatory = $false, ParameterSetName = 'LogFile')]
    [string]$Query,
    [Parameter(Mandatory = $false, ParameterSetName = 'LogName')]
    [Parameter(Mandatory = $false, ParameterSetName = 'LogFile')]
    [Parameter(Mandatory = $false, ParameterSetName = 'QueryFile')]
    [System.IO.FileInfo]$Bookmark,
    [Parameter(Mandatory = $false, ParameterSetName = 'LogName')]
    [Parameter(Mandatory = $false, ParameterSetName = 'LogFile')]
    [Parameter(Mandatory = $false, ParameterSetName = 'QueryFile')]
    [System.IO.FileInfo]$SaveBookMark,
    [Parameter(Mandatory = $false, ParameterSetName = 'LogName')]
    [Parameter(Mandatory = $false, ParameterSetName = 'LogFile')]
    [Parameter(Mandatory = $false, ParameterSetName = 'QueryFile')]
    [bool]$Direction,
    [Parameter(Mandatory = $false, ParameterSetName = 'LogName')]
    [Parameter(Mandatory = $false, ParameterSetName = 'LogFile')]
    [Parameter(Mandatory = $false, ParameterSetName = 'QueryFile')]
    [ValidateSet("xml", "text")]
    [Parameter(Mandatory = $false, ParameterSetName = 'query-events')]
    [string]$Format,
    [Parameter(Mandatory = $false, ParameterSetName = 'LogName')]
    [Parameter(Mandatory = $false, ParameterSetName = 'LogFile')]
    [Parameter(Mandatory = $false, ParameterSetName = 'QueryFile')]
    [string]$Count
  )
  <#
  [Parameter(Mandatory = $false, ParameterSetName = 'query-events')]
  [string]$BookMark,
  [Parameter(Mandatory = $false, ParameterSetName = 'query-events')]
  [string]$SaveBookMark,
#>
  $Params = @{};
  if ($Format) {
    $Params.Add('Format', $Format);
  }
  if ($Count) {
    $Params.Add('Count', $Count);
  }
  if ($Direction) {
    $Params.Add('Reverse', $Direction);
  }
  switch ($PSCmdlet.ParameterSetName) {
    'LogName' {
      if (Invoke-Wevtutil -EnumLog | Where-Object { $_ -eq $Logname }) {
        $Params.Add('LogName', $LogName);
        if ($Query) {
          $Params.Add('Query', $Query);
        }
      }
    }
    'LogFile' {
      if ($LogFile.Exists) {
        $Params.Add('LogName', $LogFile);
        if ($Query) {
          $Params.Add('Query', $Query);
        }
        $Params.Add('LogFile', $true);
      }
    }
    'QueryFile' {
      if ($StructuredQuery.Exists) {
        $Params.Add('LogName', $StructuredQuery);
        $Params.Add('QueryFile', $true);
      }
    }
  }
  if ($Bookmark.Exists -and $Bookmark.Extension.ToLower() -eq '.xml') {
    $Params.Add('BookMark', $Bookmark);
  }
  if ($SaveBookMark.Exists -and $SaveBookMark.Extension.ToLower() -eq '.xml') {
    $Params.Add('SaveBookMark', $SaveBookMark);
  }
  Invoke-Wevtutil -QueryEvents @Params;
}
Function Set-Log {
  <#
  .SYNOPSIS
  Modifies the configuration of the specified log.
  .DESCRIPTION
  Modifies the configuration of the specified log.
  .PARAMETER Logname
  The name of a log
  .PARAMETER Enbled
  Enables or disables a log. <Enabled> can be true or false.
  .PARAMETER Quiet
  Quiet display option. No prompts or messages are displayed to the user. If not
  specified, the default is true.
  .PARAMETER Isolation
  Sets the log isolation mode. <Isolation> can be system, application
  or custom. The isolation mode of a log determines whether a log
  shares a session with other logs in the same isolation class. If
  you specify system isolation, the target log will share at least
  write permissions with the System log. If you specify application
  isolation, the target log will share at least write permissions
  with the Application log. If you specify custom isolation, you
  must also provide a security descriptor by using the Channel option.
  .PARAMETER Logpath
  Defines the log file name. <Logpath> is a full path to the file
  where the Event Log service stores events for this log.
  .PARAMETER Retention
  Sets the log retention mode. <Retention> can be true or false. The
  log retention mode determines the behavior of the Event Log service
  when a log reaches its maximum size. If an event log reaches its
  maximum size and the log retention mode is true, existing events
  are retained and incoming events are discarded. If the log
  retention mode is false, incoming events overwrite the oldest
  events in the log.
  .PARAMETER AutoBackup
  Specifies the log auto-backup policy. <Auto> can be true or false.
  If this value is true, the log will be backed up automatically when
  it reaches the maximum size. If this value is true, the retention
  (specified with the Retention option) must also be set to true.
  .PARAMETER Size
  Sets the maximum size of the log in bytes. The minimum log size is
  1048576 bytes (1024KB) and log files are always multiples of 64KB,
  so the value you enter will be rounded off accordingly.
  .PARAMETER Level
  Defines the level filter of the log. <Level> can be any valid level
  value. This option is only applicable to logs with a dedicated
  session. You can remove a level filter by setting <Level> to 0.
  .PARAMETER Keywords
  Specifies the keywords filter of the log. <Keywords> can be any
  valid 64 bit keyword mask. This option is only applicable to logs
  with a dedicated session.
  .PARAMETER Channel
  Sets the access permission for an event log. <Channel> is a
  security descriptor that uses the Security Descriptor Definition
  Language (SDDL). For more information about SDDL format, see the
  Microsoft Developers Network (MSDN) Web site (http://msdn.microsoft.com).
  .PARAMETER Config
  Specifies the path to a configuration file. This option will cause
  log properties to be read from the configuration file defined in
  <Config>. If you use this option, you must not specify a <Logname>
  parameter. The log name will be read from the configuration file.
  .EXAMPLE
  Set-WevtLog -Logname Microsoft-Windows-CAPI2/Operational -Enabled $true -Retention $true -AutoBackup $true

  # jspatton@IT08082 | 13:16:15 | 03-02-2015 | C:\projects\mod-posh\powershell\production #
  Get-WevtLog -Logname Microsoft-Windows-CAPI2/Operational

  name: Microsoft-Windows-CAPI2/Operational
  enabled: true
  type: Operational
  owningPublisher: Microsoft-Windows-CAPI2
  isolation: Application
  channelAccess: O:BAG:SYD:(A;;0x7;;;BA)(A;;0x2;;;AU)
  logging:
  logFileName: %SystemRoot%\System32\Winevt\Logs\Microsoft-Windows-CAPI2%4Operational.evtx
  retention: true
  autoBackup: true
  maxSize: 1052672
  publishing:
  fileMax: 1

  Description
  -----------
  Enable the CAPI2 log, and set it's retention and autobackup settings. Then use Get-WevtLog
  to confirm.
  .NOTES
  FunctionName : Set-WevtLog
  Created by   : jspatton
  Date Coded   : 03/02/2015 8:50:14
  .LINK
  https://github.com/jeffpatton1971/mod-posh/wiki/WevtUtil#Set-WevtLog
  .LINK
  https://msdn.microsoft.com/en-us/library/windows/desktop/aa820708%28v=vs.85%29.aspx?f=255&MSPPError=-2147217396
  .LINK
  https://technet.microsoft.com/en-us/library/cc732848.aspx
  #>
  [CmdletBinding(SupportsShouldProcess, ConfirmImpact = 'Low')]
  Param
  (
    [Parameter(Mandatory = $true, ParameterSetName = 'set-log')]
    $Logname,
    [Parameter(Mandatory = $false, ParameterSetName = 'set-log')]
    [string]$Enabled,
    [Parameter(Mandatory = $false, ParameterSetName = 'set-log')]
    [bool]$Quiet,
    [Parameter(Mandatory = $false, ParameterSetName = 'set-log')]
    [ValidateSet("system", "application", "custom")]
    [string]$Isolation,
    [Parameter(Mandatory = $false, ParameterSetName = 'set-log')]
    [System.IO.FileInfo]$Logpath,
    [Parameter(Mandatory = $false, ParameterSetName = 'set-log')]
    [bool]$Retention,
    [Parameter(Mandatory = $false, ParameterSetName = 'set-log')]
    [bool]$AutoBackup,
    [Parameter(Mandatory = $false, ParameterSetName = 'set-log')]
    [int]$Size,
    [Parameter(Mandatory = $false, ParameterSetName = 'set-log')]
    [string]$Level,
    [Parameter(Mandatory = $false, ParameterSetName = 'set-log')]
    [string]$Keywords,
    [Parameter(Mandatory = $false, ParameterSetName = 'set-log')]
    [string]$Channel,
    [Parameter(Mandatory = $false, ParameterSetName = 'set-log')]
    [System.IO.FileInfo]$Config
  )
  <#
    [Parameter(Mandatory = $false, ParameterSetName = 'set-log')]
    [string]$Keywords,
    [Parameter(Mandatory = $false, ParameterSetName = 'set-log')]
    [string]$ChannelAccess,
    [Parameter(Mandatory = $false, ParameterSetName = 'set-log')]
    [string]$Config,
  #>
  if ($PSCmdlet.ShouldProcess("Change", "Change log settings for $($LogName)")) {
    $Params = @{};
    $Params.Add('LogName',$Logname);
    if ($Config) {
      if ($Config.Exists -and $Config.Extension -eq '.xml') {
        $Params.Add('Config', $Config);
      }
    }
    else {
      if ($Enabled) {
        $Params.Add('Enabled', $Enabled);
      }
      if ($Quiet) {
        $Params.Add('Quiet', $Quiet);
      }
      if ($MaxSize) {
        #
        # check between 1 and 16
        #
        $Params.Add('FileMax', $MaxSize);
      }
      if ($Isolation) {
        $Params.Add('Isolation', $Isolation);
      }
      if ($Logpath) {
        if ($Logpath.Exists) {
          $Params.Add('LogPath', $Logpath);
        }
      }
      if ($Retention) {
        $Params.Add('Retention', $Retention);
      }
      if ($AutoBackup) {
        $Params.Add('AutoBackup', $AutoBackup);
      }
      if ($Size) {
        #
        # check divisible by 64
        # min is 1024*1024
        #
        $Params.Add('MaxSize', $Size);
      }
      if ($Level) {
        $Params.Add('Level', $Level);
      }
      if ($Keywords) {
        $Params.Add('Keywords', $Keywords);
      }
      if ($Channel) {
        $Params.Add('ChannelAccess', $Channel);
      }
    }
    Invoke-Wevtutil -SetLog @Params;
  }
}
function Invoke-Wevtutil {
  [CmdletBinding(HelpURI = 'https://github.com/mod-posh/wevtutil/blob/master/docs/Invoke-Wevtutil.md#invoke-wevtutil')]
  param (
    [Parameter(Mandatory = $false, ParameterSetName = 'enum-logs')]
    [switch]$EnumLog,
    [Parameter(Mandatory = $false, ParameterSetName = 'get-log')]
    [switch]$GetLog,
    [Parameter(Mandatory = $false, ParameterSetName = 'enum-publishers')]
    [switch]$EnumPublishers,
    [Parameter(Mandatory = $false, ParameterSetName = 'get-publisher')]
    [switch]$GetPublisher,
    [Parameter(Mandatory = $false, ParameterSetName = 'get-loginfo')]
    [switch]$GetLogInfo,
    [Parameter(Mandatory = $false, ParameterSetName = 'clear-log')]
    [switch]$ClearLog,
    [Parameter(Mandatory = $false, ParameterSetName = 'archive-log')]
    [switch]$ArchiveLog,
    [Parameter(Mandatory = $false, ParameterSetName = 'export-log')]
    [switch]$ExportLog,
    [Parameter(Mandatory = $false, ParameterSetName = 'install-manifest')]
    [switch]$InstallManifest,
    [Parameter(Mandatory = $false, ParameterSetName = 'uninstall-manifest')]
    [switch]$UninstallManifest,
    [Parameter(Mandatory = $false, ParameterSetName = 'query-events')]
    [switch]$QueryEvents,
    [Parameter(Mandatory = $false, ParameterSetName = 'set-log')]
    [switch]$SetLog,

    [Parameter(Mandatory = $true, ParameterSetName = 'get-log')]
    [Parameter(Mandatory = $true, ParameterSetName = 'get-loginfo')]
    [Parameter(Mandatory = $true, ParameterSetName = 'clear-log')]
    [Parameter(Mandatory = $true, ParameterSetName = 'query-events')]
    [Parameter(Mandatory = $true, ParameterSetName = 'set-log')]
    [string]$LogName,
    [Parameter(Mandatory = $true, ParameterSetName = 'get-publisher')]
    [string]$PublisherName,
    [Parameter(Mandatory = $true, ParameterSetName = 'get-publisher')]
    [bool]$GetEvents,
    [Parameter(Mandatory = $true, ParameterSetName = 'get-publisher')]
    [bool]$GetMessage,
    [Parameter(Mandatory = $true, ParameterSetName = 'get-log')]
    [Parameter(Mandatory = $true, ParameterSetName = 'get-publisher')]
    [Parameter(Mandatory = $true, ParameterSetName = 'query-events')]
    [ValidateSet("XML", "Text")]
    [string]$Format,
    [Parameter(Mandatory = $true, ParameterSetName = 'clear-log')]
    [Parameter(Mandatory = $true, ParameterSetName = 'archive-log')]
    [Parameter(Mandatory = $true, ParameterSetName = 'export-log')]
    [Parameter(Mandatory = $true, ParameterSetName = 'set-log')]
    [string]$LogPath,
    [Parameter(Mandatory = $true, ParameterSetName = 'export-log')]
    [bool]$Overwrite,
    [Parameter(Mandatory = $true, ParameterSetName = 'install-manifest')]
    [Parameter(Mandatory = $false, ParameterSetName = 'uninstall-manifest')]
    [string]$Manifest,
    [Parameter(Mandatory = $false, ParameterSetName = 'install-manifest')]
    [string]$ResourcePath,
    [Parameter(Mandatory = $false, ParameterSetName = 'install-manifest')]
    [string]$MessagePath,
    [Parameter(Mandatory = $false, ParameterSetName = 'install-manifest')]
    [string]$ParameterPath,
    [Parameter(Mandatory = $true, ParameterSetName = 'query-events')]
    [Parameter(Mandatory = $false, ParameterSetName = 'get-loginfo')]
    [bool]$LogFile,
    [Parameter(Mandatory = $true, ParameterSetName = 'query-events')]
    [bool]$QueryFile,
    [Parameter(Mandatory = $false, ParameterSetName = 'query-events')]
    [string]$Query,
    [Parameter(Mandatory = $false, ParameterSetName = 'query-events')]
    [string]$BookMark,
    [Parameter(Mandatory = $false, ParameterSetName = 'query-events')]
    [string]$SaveBookMark,
    [Parameter(Mandatory = $false, ParameterSetName = 'query-events')]
    [bool]$Reverse,
    [Parameter(Mandatory = $false, ParameterSetName = 'query-events')]
    [int]$Count,
    [Parameter(Mandatory = $true, ParameterSetName = 'set-log')]
    [bool]$Enabled,
    [Parameter(Mandatory = $true, ParameterSetName = 'set-log')]
    [bool]$Quiet,
    [Parameter(Mandatory = $true, ParameterSetName = 'set-log')]
    [int]$FileMax,
    [Parameter(Mandatory = $true, ParameterSetName = 'set-log')]
    [ValidateSet("system", "application", "custom")]
    [string]$Isolation,
    [Parameter(Mandatory = $false, ParameterSetName = 'set-log')]
    [bool]$Retention,
    [Parameter(Mandatory = $false, ParameterSetName = 'set-log')]
    [bool]$AutoBackup,
    [Parameter(Mandatory = $false, ParameterSetName = 'set-log')]
    [int]$MaxSize,
    [Parameter(Mandatory = $true, ParameterSetName = 'set-log')]
    [int]$Level,
    [Parameter(Mandatory = $false, ParameterSetName = 'set-log')]
    [string]$Keywords,
    [Parameter(Mandatory = $false, ParameterSetName = 'set-log')]
    [string]$ChannelAccess,
    [Parameter(Mandatory = $false, ParameterSetName = 'set-log')]
    [string]$Config,

    [Parameter(Mandatory = $false, ParameterSetName = 'enum-logs')]
    [Parameter(Mandatory = $false, ParameterSetName = 'get-log')]
    [Parameter(Mandatory = $false, ParameterSetName = 'enum-publishers')]
    [Parameter(Mandatory = $false, ParameterSetName = 'get-publisher')]
    [Parameter(Mandatory = $false, ParameterSetName = 'get-loginfo')]
    [Parameter(Mandatory = $false, ParameterSetName = 'clear-log')]
    [Parameter(Mandatory = $false, ParameterSetName = 'archive-log')]
    [Parameter(Mandatory = $false, ParameterSetName = 'export-log')]
    [Parameter(Mandatory = $false, ParameterSetName = 'query-events')]
    [Parameter(Mandatory = $false, ParameterSetName = 'set-log')]
    [string]$ComputerName,
    [Parameter(Mandatory = $false, ParameterSetName = 'enum-logs')]
    [Parameter(Mandatory = $false, ParameterSetName = 'get-log')]
    [Parameter(Mandatory = $false, ParameterSetName = 'enum-publishers')]
    [Parameter(Mandatory = $false, ParameterSetName = 'get-publisher')]
    [Parameter(Mandatory = $false, ParameterSetName = 'get-loginfo')]
    [Parameter(Mandatory = $false, ParameterSetName = 'clear-log')]
    [Parameter(Mandatory = $false, ParameterSetName = 'archive-log')]
    [Parameter(Mandatory = $false, ParameterSetName = 'export-log')]
    [Parameter(Mandatory = $false, ParameterSetName = 'query-events')]
    [Parameter(Mandatory = $false, ParameterSetName = 'set-log')]
    [pscredential]$Credential,
    [Parameter(Mandatory = $false, ParameterSetName = 'enum-logs')]
    [Parameter(Mandatory = $false, ParameterSetName = 'get-log')]
    [Parameter(Mandatory = $false, ParameterSetName = 'enum-publishers')]
    [Parameter(Mandatory = $false, ParameterSetName = 'get-publisher')]
    [Parameter(Mandatory = $false, ParameterSetName = 'get-loginfo')]
    [Parameter(Mandatory = $false, ParameterSetName = 'clear-log')]
    [Parameter(Mandatory = $false, ParameterSetName = 'archive-log')]
    [Parameter(Mandatory = $false, ParameterSetName = 'export-log')]
    [Parameter(Mandatory = $false, ParameterSetName = 'query-events')]
    [Parameter(Mandatory = $false, ParameterSetName = 'set-log')]
    [ValidateSet("Default", "Negotiate", "Kerberos", "NTLM")]
    [string]$Authentication,
    [Parameter(Mandatory = $false, ParameterSetName = 'enum-logs')]
    [Parameter(Mandatory = $false, ParameterSetName = 'get-log')]
    [Parameter(Mandatory = $false, ParameterSetName = 'enum-publishers')]
    [Parameter(Mandatory = $false, ParameterSetName = 'get-publisher')]
    [Parameter(Mandatory = $false, ParameterSetName = 'get-loginfo')]
    [Parameter(Mandatory = $false, ParameterSetName = 'clear-log')]
    [Parameter(Mandatory = $false, ParameterSetName = 'archive-log')]
    [Parameter(Mandatory = $false, ParameterSetName = 'export-log')]
    [Parameter(Mandatory = $false, ParameterSetName = 'install-manifest')]
    [Parameter(Mandatory = $false, ParameterSetName = 'uninstall-manifest')]
    [Parameter(Mandatory = $false, ParameterSetName = 'query-events')]
    [Parameter(Mandatory = $false, ParameterSetName = 'set-log')]
    [bool]$Unicode
  )
  $wevtUtil = "wevtutil $($PSCmdlet.ParameterSetName)";
  switch ($PSCmdlet.ParameterSetName) {
    'enum-logs' {
    }
    'get-log' {
      $wevtUtil += " $($LogName) /f:$($Format)";
    }
    'enum-publishers' {
    }
    'get-publisher' {
      $wevtUtil += " $($PublisherName) /ge:$($GetEvents) /gm:$($GetMessage) /f:$($Format)";
    }
    'get-loginfo' {
      $wevtUtil += " $($LogName) /lf:$($LogFile)";
    }
    'clear-log' {
      $wevtUtil += " $($LogName) /bu:$($LogPath)";
    }
    'archive-log' {
      $wevtUtil += " $($LogPath)";
    }
    'export-log' {
      $wevtUtil += " $($LogPath) /lf:True /ow:$($OverWrite)";
    }
    'install-manifest' {
      $wevtUtil += " $($Manifest)";
      if ($ResourcePath) {
        $wevtUtil += " /rf:$($ResourcePath)";
      }
      if ($MessagePath) {
        $wevtUtil += " /mf:$($MessagePath)";
      }
      if ($ParameterPath) {
        $wevtUtil += " /pf:$($ParameterPath)";
      }
    }
    'uninstall-manifest' {
      $wevtUtil += " $($Manifest)";
    }
    'query-events' {
      $wevtUtil += " $($LogName) /lf:$($LogFile) /sq:$($QueryFile)";
      if (!($QueryFile)) {
        if ($Query) {
          $wevtUtil += " /q:$($Query)";
        }
      }
      if ($BookMark) {
        $wevtUtil += " /bm:$($BookMark)";
      }
      if ($SaveBookMark) {
        $wevtUtil += " /sbm:$($SaveBookMark)";
      }
      $wevtUtil += " /rd:$($Reverse) /f:$($Format)";
      if ($Count) {
        $wevtUtil += " /c:$($Count)";
      }
    }
    'set-log' {
      if ($Config) {
        $wevtUtil += " $($Config)";
      }
      else {
        $wevtUtil += " $($LogName) /e:$($Enabled) /q:$($Quiet)";
        if ($FileMax) {
          $wevtUtil += " /fm:$($FileMax)";
        }
        if ($AutoBackup) {
          $wevtUtil += " /rt:True /ab:$($AutoBackup)";
        }
        if ($Retention) {
          $wevtUtil += " /rt:$($Retention)";
        }
        if ($MaxSize) {
          $wevtUtil += " /ms:$($MaxSize)";
        }
        if ($Level) {
          $wevtUtil += " /l:$($Level)";
        }
        if ($Keywords) {
          $wevtUtil += " /k:$($Keywords)";
        }
        if ($ChannelAccess) {
          $wevtUtil += " /ca:$($ChannelAccess)";
        }
      }
    }
  }
  if ($ComputerName) {
    $wevtUtil += " /r:$($ComputerName) /u:$($Credential.UserName) /p:$($Credential.GetNetworkCredential().Password) /a:$($Authentication)";
  }
  $wevtUtil += " /uni:$($Unicode)";
  Invoke-Expression $wevtUtil;
}