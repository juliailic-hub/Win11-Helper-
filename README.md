# Win11 Helper: Automated Troubleshooter for Common User Issues

## Overview
** Win11 Helper ** is a PowerShell script designed to help everyday Windows 11 users clean up temporary files, check network connectivity, manage OneDrive startup, and ensure essential services are running properly — all in one place.

This project is perfect for users who want a simple way to maintain their system without needing deep technical knowledge.

## ✨ Features

- 🧹 **Cleans Temporary Files**: Clears system and user temp folders.
- 🌐 **Checks Network Health**:
  - Tests connectivity to Google DNS (8.8.8.8)
  - Lists active network adapters with link speed and status
- 🔧 **Disables OneDrive Auto-Start**: Prevents OneDrive from launching at login to improve boot speed.
- ♻️ **Restarts Key Services**:
  - BITS (Background Intelligent Transfer Service)
  - Windows Update (wuauserv)
- 🛠 **Lists Startup Programs**: Helps identify apps slowing down your boot time.
- 📄 **Generates Report**: Saves a log of actions taken in `Desktop\Win11HelperReport.txt`
- 
## 📦 How to Use

1. **Download** or **clone** the repository.
2. Right-click the script file (`Win11-Helper.ps1`) → click **“Run with PowerShell”**.
3. Or:
   - Open PowerShell as Administrator
   - Navigate to the script folder:
     ```powershell
     Set-Location "C:\Users\YourName\Desktop"
       - Run the script:
     powershell
     .\Win11-Helper.ps1

## 📁 Output

A detailed report is saved here:
C:\Users\YourName\Desktop\Win11HelperReport.txt
You will also see clear output messages during the script run in your terminal window.

## 🧠 Notes

- Requires **PowerShell 5.1+** (default on Windows 11)
- Ensure script execution is allowed:
  ```powershell
  Set-ExecutionPolicy RemoteSigned -Scope CurrentUser

## Author
Created with care by** **Julia Ilić**  
🇭🇷 Zagreb, Croatia  
