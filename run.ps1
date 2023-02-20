# Prompt user to confirm they want to reset Task Manager
$confirmation = Read-Host "This script will reset Task Manager. Are you sure you want to continue? (Y/N)"

# If user confirms, proceed with resetting Task Manager
if ($confirmation.ToLower() -eq "y") {
  # Backup TaskManager registry key
  reg export "HKCU\Software\Microsoft\Windows\CurrentVersion\TaskManager" "$HOME\TaskManager_Backup.reg" /y

  # Delete Preferences subkey to reset Task Manager
  Remove-ItemProperty "HKCU:\Software\Microsoft\Windows\CurrentVersion\TaskManager" -Name "Preferences" -Force

  Write-Host "Task Manager has been reset to its default settings."
}
else {
  Write-Host "Task Manager was not reset."
}
