# Создать планировщик для скрипта:
```powershell
schtasks.exe /Create /TN "CheckNetworkAdapter" /XML "F:\PowerShell-Utility-Scripts\check-network-adapter\TaskShedule(Check-NetworkAdapter).xml"
```

# Полностью удалить задачу:
```powershell
schtasks /Delete /TN "CheckNetworkAdapter" /F
```

# Или временно отключить:
```powershell
scschtasks /Change /TN "CheckNetworkAdapter" /Disable
```

# И включить обратно:
```powershell
schtasks /Change /TN "CheckNetworkAdapter" /Enable
```
