$vcxsrv = Get-Process vcxsrv -ErrorAction SilentlyContinue
if (!$vcxsrv) {
    Start-Process $HOME'\.bin\config.xlaunch'
}
Remove-Variable vcxsrv
$pulseaudio = Get-Process pulseaudio -ErrorAction SilentlyContinue
if (!$pulseaudio) {
    Start-Process $HOME'\.bin\pulseaudio\bin\pulseaudio.exe' -WindowStyle Hidden
}
Remove-Variable pulseaudio
