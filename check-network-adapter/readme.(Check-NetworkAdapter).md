# Как дейстовать
## Создать планировщик для скрипта:
```powershell
schtasks.exe /Create /TN "CheckNetworkAdapter" /XML "F:\PowerShell-Utility-Scripts\check-network-adapter\TaskShedule-Ghost-(Check-NetworkAdapter).xml"
```

## Полностью удалить задачу:
```powershell
schtasks /Delete /TN "CheckNetworkAdapter" /F
```

## Или временно отключить:
```powershell
scschtasks /Change /TN "CheckNetworkAdapter" /Disable
```

## И включить обратно:
```powershell
schtasks /Change /TN "CheckNetworkAdapter" /Enable
```

# Основные параметры:
* `adapterName` - указывайте имя вашего проблемного драйвера сети. Его имя также может меняться в процессе эксплуатации.
* `expectedSpeed` - заявленная скорость работы


# Скрытый Режим или режим невидимки (ОПАСНО, крайне не рекомендую)
*Скрывая консоль вы вероятнее всего забудете о ней*

## Создать планировщик для скрытого скрипта:
```powershell
schtasks.exe /Create /TN "CheckNetworkAdapter" /XML "F:\PowerShell-Utility-Scripts\check-network-adapter\TaskShedule-Hidden-(Check-NetworkAdapter).xml"
```
