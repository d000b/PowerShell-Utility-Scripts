# Требует запуска от имени администратора
$logFile = "F:\PowerShell-Utility-Scripts\check-network-adapter\(Check-NetworkAdapter).log"

$adapterName = "Ethernet 2"
$expectedSpeed = 100 * 1e6 # 100 Мбит/с в битах
$now = Get-Date -Format "yyyy-MM-dd HH:mm:ss"

# Получаем информацию об адаптере
$adapter = Get-NetAdapter -Name $adapterName -ErrorAction SilentlyContinue

Start-Transcript -Path $logFile -Append
if (-not $adapter) {
    Write-Host "$now [$adapterName] Adapter not found!" -ForegroundColor Red
    Stop-Transcript
    exit 1
}

$currentSpeed = $adapter.LinkSpeed
# Конвертация в числовой формат
$currentSpeedBits = ($currentSpeed -replace '[^0-9]') -as [int]
$currentSpeedUnit = ($currentSpeed -replace '[0-9\s]')

switch ($currentSpeedUnit.ToLower()) {
    "gbps" { $currentSpeedBits *= 1e9 }
    "mbps" { $currentSpeedBits *= 1e6 }
    "kbps" { $currentSpeedBits *= 1e3 }
    default { $currentSpeedBits = 0 }
}

if ($currentSpeedBits -lt $expectedSpeed) {
    Write-Host "$now [$adapterName] Link speed degraded: $currentSpeed < 100 Mbps. Attempting to reset..." -ForegroundColor Yellow

    Disable-NetAdapter -Name $adapterName -Confirm:$false -PassThru | Out-Null
    Start-Sleep -Seconds 5
    Enable-NetAdapter -Name $adapterName -Confirm:$false -PassThru | Out-Null

    Write-Host "$now [$adapterName] Adapter was restarted." -ForegroundColor Cyan
} else {
    Write-Host "$now [$adapterName] [NICE] Link speed: $currentSpeed"
}

Stop-Transcript
