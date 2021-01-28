add-WindowsFeature Web-Server, Web-Mgmt-Tools
Add-Content -Path "C:\inetpub\wwwroot\Default.htm" -Value $($env:computername)


netsh advfirewall set allprofiles state off

$url = "https://github.com/cemvarol/AZ-Migration/blob/master/ChromeSetup.exe?raw=true"
$output = "$env:USERPROFILE\downloads\ChromeSetup.exe"
Invoke-WebRequest -Uri $url -OutFile $output

& "$env:USERPROFILE\downloads\ChromeSetup.exe"


