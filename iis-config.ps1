add-WindowsFeature Web-Server, Web-Mgmt-Tools
Add-Content -Path "C:\inetpub\wwwroot\Default.htm" -Value $($env:computername)


netsh advfirewall set allprofiles state off



md c:\shell
$url = "https://github.com/cemvarol/AZ-Migration/blob/master/ChromeSetup.exe?raw=true"
$output = "c:\shell\ChromeSetup.exe"
Invoke-WebRequest -Uri $url -OutFile $output

& "c:\shell\ChromeSetup.exe"







