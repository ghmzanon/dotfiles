$wslCount = @(Get-Process wsl -ErrorAction SilentlyContinue).count + 1
$vcxsrv = Get-Process vcxsrv -ErrorAction SilentlyContinue
if ($vcxsrv -and $wslCount -eq 0) {
    Stop-Process $vcxsrv
}
Remove-Variable vcxsrv
$pulseaudio = Get-Process pulseaudio -ErrorAction SilentlyContinue
if ($pulseaudio -and $wslCount -eq 0) {
    Stop-Process $pulseaudio
}
Remove-Variable pulseaudio
Remove-Variable wslCount
