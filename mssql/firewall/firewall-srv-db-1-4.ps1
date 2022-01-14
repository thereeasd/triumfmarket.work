New-NetFirewallRule -DisplayName "ALLOW TCP PORT 80 HTTP" -Direction inbound -Profile Any -Action Allow -LocalPort 80 -Protocol TCP  
New-NetFirewallRule -DisplayName "ALLOW UDP PORT 88 Kerberos" -Direction inbound -Profile Any -Action Allow -LocalPort 88 -Protocol UDP
New-NetFirewallRule -DisplayName "ALLOW TCP PORT 135 msrpc" -Direction inbound -Profile Any -Action Allow -LocalPort 135 -Protocol TCP
New-NetFirewallRule -DisplayName "ALLOW TCP PORT 139 NetBIOS session service" -Direction inbound -Profile Any -Action Allow -LocalPort 139 -Protocol TCP
New-NetFirewallRule -DisplayName "ALLOW TCP PORT 445 SMB" -Direction inbound -Profile Any -Action Allow -LocalPort 445 -Protocol TCP
New-NetFirewallRule -DisplayName "ALLOW TCP PORT 475 SMB" -Direction inbound -Profile Any -Action Allow -LocalPort 475 -Protocol TCP
New-NetFirewallRule -DisplayName "ALLOW UDP PORT 475 SMB" -Direction inbound -Profile Any -Action Allow -LocalPort 475 -Protocol UDP
New-NetFirewallRule -DisplayName "ALLOW UDP PORT 389 Lightweight Directory Access Protocol" -Direction inbound -Profile Any -Action Allow -LocalPort 389 -Protocol UDP
New-NetFirewallRule -DisplayName "ALLOW TCP PORT 389 Lightweight Directory Access Protocol" -Direction inbound -Profile Any -Action Allow -LocalPort 389 -Protocol TCP
New-NetFirewallRule -DisplayName "ALLOW TCP PORT 1025 lsass.exe" -Direction inbound -Profile Any -Action Allow -LocalPort 1025 -Protocol TCP
New-NetFirewallRule -DisplayName "ALLOW TCP PORT 1311 rxmon" -Direction inbound -Profile Any -Action Allow -LocalPort 1311 -Protocol TCP
New-NetFirewallRule -DisplayName "ALLOW TCP PORT 1433 msSQL" -Direction inbound -Profile Any -Action Allow -LocalPort 1433 -Protocol TCP
New-NetFirewallRule -DisplayName "ALLOW TCP PORT 1434 msSQL Discovery Service" -Direction inbound -Profile Any -Action Allow -LocalPort 1434 -Protocol TCP
New-NetFirewallRule -DisplayName "ALLOW UDP PORT 1540, 1541, 1560-1591 1cv83" -Direction inbound -Profile Any -Action Allow -LocalPort 1540, 1541, 1560-1591 -Protocol UDP
New-NetFirewallRule -DisplayName "ALLOW TCP PORT 1540, 1541, 1560-1591 1cv83" -Direction inbound -Profile Any -Action Allow -LocalPort 1540, 1541, 1560-1591 -Protocol TCP
New-NetFirewallRule -DisplayName "ALLOW TCP PORT 1947 sentinelsrm" -Direction inbound -Profile Any -Action Allow -LocalPort 1947 -Protocol TCP
New-NetFirewallRule -DisplayName "ALLOW TCP PORT 3389, 3390 RDP" -Direction inbound -Profile Any -Action Allow -LocalPort 3389,3390 -Protocol TCP
New-NetFirewallRule -DisplayName "ALLOW UDP PORT 3389, 3390 RDP" -Direction inbound -Profile Any -Action Allow -LocalPort 3389,3390 -Protocol UDP
New-NetFirewallRule -DisplayName "ALLOW UDP PORT 5355 Multicast name Discovery" -Direction inbound -Profile Any -Action Allow -LocalPort 5355 -Protocol UDP
New-NetFirewallRule -DisplayName "ALLOW TCP PORT 5357 WSDapi (webserices)" -Direction inbound -Profile Any -Action Allow -LocalPort 5357 -Protocol TCP