# Changelog
All changes to this module should be reflected in this document.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## Unreleased
- Update module for current PowerShell

## [1.0.0.0] - 2020-09-15
### Added
- Created wevtutil repository in mod-posh Organization
- Imported the original wevtutil module from the mod-posh repository

### Updated
- Issue #1 Removed Trailing whitespace
- Issue #9 Corrected empty Try/Catch block
- Issue #7 Set Output Type properly
- Issue #2 Removed default values for Mandatory parameters
- Issue #14 Removed unused parameters
- Issue #4 Removed Get-UpTime as it's built-in now
- Issue #13 Proper evaluation of $null
- Issue #6 Changed to proper verbs
- Issue #12 Use SecureString for Credentials/Passwords
- Issue #11 Construct SecureString