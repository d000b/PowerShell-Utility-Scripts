Set shell = CreateObject("WScript.Shell")

script = "F:\PowerShell-Utility-Scripts\Check-NetworkAdapter.ps1"
logger = "F:\PowerShell-Utility-Scripts\adapter-check.log"

params = "-NoProfile -ExecutionPolicy Bypass -NoLogo -NonInteractive -WindowStyle Hidden"

shell.Run "powershell.exe " & params & " -File '" & script & "' >> '" & logger & "' 2>&1", 0
