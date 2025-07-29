# Clears temporary files in the local C:drive to free up space and improve system performance
Remove-Item -Path "C:\Windows\Temp\*" -Recurse -Force -ErrorAction SilentlyContinue 

# Clear temporary files in the current user's temp folder free up space
Remove-Item -Path "$env:TEMP\*" -Recurse -Force -ErrorAction SilentlyContinue
Write-Host "Temporary files cleared." -ForegroundColor Green 

# This helps fix update issues by removing potentially corrupted update cache files 
Stop-Service wuauserv -Force 
Remove-Item "C:\Windows\SoftwareDistribution\Download\*" -Recurse -Force
Start-Service wuauserv

# Retrieves list of startup programs from system configuration 
Get-CimInstance -ClassName Win32_StartupCommand | Select-Object Name, Command, Location 

# This prevents OneDrive from launching automatically at user login, improving boot speed
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Run" -Name "OneDrive" -Value ""
Write-Host "Prevented OneDrive from launching at login to improve startup time."-ForegroundColor Green

# Restart Key Services 
$services =@("wuauserv", "BITS")
foreach ($s in $services) {
try {
     # Restart service, supress warnings 
     Restart-Service -Name $s -ErrorAction Stop
     $successMsg = "Service $s restarted successfully."
     Write-Host $successMsg -ForegroundColor Green
     # Append to log file 
     $errorMsg | Out-File -FilePath $logPath -Append -Encoding utf8
}
catch { 
     $errorMsg = "Failed to restart service ${s}: $_"
     Write-Host $errorMsg -ForegroundColor Red
     # Append to log file 
     $errorMsg | Out-File -FilePath $logPath -Append -Encoding utf8
     }
}


# Check network status 

#Test connectivity to important DNS servers (local DNS and Google DNS 
Test-Connection -ComputerName 8.8.8.8 -Count 4 | Format-Table -Autosize 

# Retrieves the list of network adapters with their current connection staus and link speed 
Get-NetAdapter | Select Name, Status, lInkSpeed | Format-Table -AutoSize

$logPath = "$env:USERPROFILE\Desktop\Win11HelperReport.txt"
"===== Win11 Helper Script started at $(Get-Date) ====="| Out-File -FilePath $logPath -Encoding utf8

"Temporary files cleaned successfully." | Out-File -FilePath $logPath -Append -Encoding utf8
"OneDrive auto start disabled." | Out-File -FilePath $logPath -Append -Encoding utf8
"Network connectivity check completed." | Out-File -FilePath $logPath -Append -Encoding utf8

"===== Script completed  at $(Get-Date) =====" | Out-File -FilePath $logPath -Append -Encoding utf8
