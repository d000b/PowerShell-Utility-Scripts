Set objShell = CreateObject("Wscript.Shell")
objShell.Run "powershell.exe -ExecutionPolicy Bypass -NoProfile -File ""F:\PowerShell-Utility-Scripts\check-network-adapter\Check-NetworkAdapter.ps1""", 0, False
