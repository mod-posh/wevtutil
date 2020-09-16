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
  [CmdletBinding(HelpURI = 'https://github.com/mod-posh/wevtutil/blob/master/docs/Save-Log.md#save-log')]
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
  [CmdletBinding(HelpURI = 'https://github.com/mod-posh/wevtutil/blob/master/docs/Uninstall-Manifest.md#uninstall-manifest')]
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
  [CmdletBinding(HelpURI = 'https://github.com/mod-posh/wevtutil/blob/master/docs/Set-LogInfo.md#set-loginfo',
    SupportsShouldProcess,
    ConfirmImpact = 'Low')]
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