ipmo C:\Projects\PS\STUPS\UIA\UIAutomation\bin\Release35\UIAutomation.dll;
Start-Process calc -PassThru | Get-UIAWindow | Get-UIAMenuItem help | Invoke-UIAMenuItemExpand | Get-UIAMenuItem -n *about* | Invoke-UIAMenuItemClick;
Start-Process calc -PassThru;

# by process name
# $true
Write-Host "expecting $true";
Wait-UIAWindow -pn calc;
# $true
Write-Host "expecting $true";
Wait-UIAWindow -pn calc -n *about*;
# $true
Write-Host "expecting $true";
Wait-UIAWindow -pn calc -c *32770*;
# $true
Write-Host "expecting $true";
Wait-UIAWindow -pn calc -c *frame*;
# $false
Write-Host "expecting $false";
Wait-UIAWindow -pn calc -c *aaa*;

# by process object
# $true
Write-Host "expecting $true";
Wait-UIAWindow -InputObject (Get-Process calc);

# by process Id
# $true
Write-Host "expecting $true";
Wait-UIAWindow -pid (Get-Process calc).Id;
# $true
Write-Host "expecting $true";
Wait-UIAWindow -pid (Get-Process calc).Id -n *calc*;
# $true
Write-Host "expecting $true";
Wait-UIAWindow -pid (Get-Process calc).Id -n *about*;
# $false
Write-Host "expecting $false";
Wait-UIAWindow -pid (Get-Process calc).Id -n *asdf*;

# by window title (name)
# $false (there is no recursive search by default)
Write-Host "expecting $false";
Wait-UIAWindow -n *about*
# $true
Write-Host "expecting $true";
Wait-UIAWindow -n *about* -Recurse