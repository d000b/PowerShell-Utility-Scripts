Set shell = CreateObject("WScript.Shell")

base_path = "F:\PowerShell-Utility-Scripts\check-network-adapter\"
script = base_path + "Check-NetworkAdapter.ps1"
logger = base_path + "(Check-NetworkAdapter).log"

params = "-NoProfile -ExecutionPolicy Bypass -NoLogo -NonInteractive -WindowStyle Hidden"

shell.Run "powershell.exe " & params & " -File '" & script & "' >> '" & logger & "' 2>&1", 0
