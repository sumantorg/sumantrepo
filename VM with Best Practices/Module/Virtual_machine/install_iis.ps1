Install-WindowsFeature -Name Web-Server -IncludeManagementTools
New-Item -Path "C:\inetpub\wwwroot\index.html" -ItemType "File" -Value "<h1>Hello from IIS!</h1>"