#Script to rename the chelsio adapter and assign ip to it
function host ($name)
{
if($name -eq "bumblebee")
{
netsh interface ip add address  "port0" 102.1.7.60 255.255.255.0 > $nul
netsh interface ip add address  "port1" 102.1.8.60 255.255.255.0 > $nul
netsh interface ip add address  "port2" 102.1.9.60 255.255.255.0 > $nul
netsh interface ip add address  "port3" 102.1.10.60 255.255.255.0 > $nul
netsh interface ip add address  "port00" 102.1.11.60 255.255.255.0 > $nul
netsh interface ip add address  "port11" 102.1.12.60 255.255.255.0 > $nul
netsh interface ip add address  "port22" 102.1.13.60 255.255.255.0 > $nul
netsh interface ip add address  "port33" 102.1.14.60 255.255.255.0 > $nul
}
elseif ($name -eq "core96cn23")
{
netsh interface ip add address  "port0" 102.1.7.30 255.255.255.0 > $nul
netsh interface ip add address  "port1" 102.1.8.30 255.255.255.0 > $nul
netsh interface ip add address  "port2" 102.1.9.30 255.255.255.0 2 > $nul
netsh interface ip add address  "port3" 102.1.10.30 255.255.255.0 2 > $nul
netsh interface ip add address  "port00" 102.1.11.30 255.255.255.0 > $nul
netsh interface ip add address  "port11" 102.1.12.30 255.255.255.0 > $nul
netsh interface ip add address  "port22" 102.1.13.30 255.255.255.0 > $nul
netsh interface ip add address  "port33" 102.1.14.30 255.255.255.0 > $nul

}
elseif ($name -eq "core96cn4")
{
netsh interface ip add address  "port0" 102.1.7.2 255.255.255.0  > $nul
netsh interface ip add address  "port1" 102.1.8.2 255.255.255.0  > $nul
netsh interface ip add address  "port2" 102.1.9.2 255.255.255.0  > $nul
netsh interface ip add address  "port3" 102.1.10.2 255.255.255.0  > $nul
netsh interface ip add address  "port00" 102.1.11.2 255.255.255.0 > $nul
netsh interface ip add address  "port11" 102.1.12.2 255.255.255.0 > $nul
netsh interface ip add address  "port22" 102.1.13.2 255.255.255.0 > $nul
netsh interface ip add address  "port33" 102.1.14.2 255.255.255.0 > $nul
}
elseif ($name -eq "core96cn16")
{
netsh interface ip add address  "port0" 102.1.7.3 255.255.255.0 > $nul
netsh interface ip add address  "port1" 102.1.8.3 255.255.255.0 > $nul
netsh interface ip add address  "port2" 102.1.9.3 255.255.255.0 > $nul
netsh interface ip add address  "port3" 102.1.10.3 255.255.255.0 > $nul
netsh interface ip add address  "port00" 102.1.11.3 255.255.255.0 > $nul
netsh interface ip add address  "port11" 102.1.12.3 255.255.255.0 > $nul
netsh interface ip add address  "port22" 102.1.13.3 255.255.255.0 > $nul
netsh interface ip add address  "port33" 102.1.14.3 255.255.255.0 > $nul
}
elseif ($name -eq "core96cn22")
{
netsh interface ip add address  "port0" 102.1.7.22 255.255.255.0 > $nul
netsh interface ip add address  "port1" 102.1.8.22 255.255.255.0 > $nul
netsh interface ip add address  "port2" 102.1.9.22 255.255.255.0 > $nul
netsh interface ip add address  "port3" 102.1.10.22 255.255.255.0 > $nul
netsh interface ip add address  "port00" 102.1.11.22 255.255.255.0 > $nul
netsh interface ip add address  "port11" 102.1.12.22 255.255.255.0 > $nul
netsh interface ip add address  "port22" 102.1.13.22 255.255.255.0 > $nul
netsh interface ip add address  "port33" 102.1.14.22 255.255.255.0 > $nul
}
elseif ($name -eq "core96cn24")
{
netsh interface ip add address  "port0" 102.1.7.24 255.255.255.0 > $nul
netsh interface ip add address  "port1" 102.1.8.24 255.255.255.0 > $nul
netsh interface ip add address  "port2" 102.1.9.24 255.255.255.0 > $nul
netsh interface ip add address  "port3" 102.1.10.24 255.255.255.0 > $nul
netsh interface ip add address  "port00" 102.1.11.24 255.255.255.0 > $nul
netsh interface ip add address  "port11" 102.1.12.24 255.255.255.0 > $nul
netsh interface ip add address  "port22" 102.1.13.24 255.255.255.0 > $nul
netsh interface ip add address  "port33" 102.1.14.24 255.255.255.0 > $nul
}
elseif ($name -eq "rattletrap")
{
netsh interface ip add address  "port0" 102.1.7.62 255.255.255.0 > $nul
netsh interface ip add address  "port1" 102.1.8.62 255.255.255.0 > $nul
netsh interface ip add address  "port2" 102.1.9.62 255.255.255.0 > $nul
netsh interface ip add address  "port3" 102.1.10.62 255.255.255.0 > $nul
netsh interface ip add address  "port00" 102.1.11.62 255.255.255.0 > $nul
netsh interface ip add address  "port11" 102.1.12.62 255.255.255.0 > $nul
netsh interface ip add address  "port22" 102.1.13.62 255.255.255.0 > $nul
netsh interface ip add address  "port33" 102.1.14.62 255.255.255.0 > $nul
}
elseif ($name -eq "warrior")
{
netsh interface ip add address  "port0" 102.1.7.56 255.255.255.0 > $nul
netsh interface ip add address  "port1" 102.1.8.56 255.255.255.0 > $nul
netsh interface ip add address  "port2" 102.1.9.56 255.255.255.0 > $nul
netsh interface ip add address  "port3" 102.1.10.56 255.255.255.0 > $nul
netsh interface ip add address  "port00" 102.1.11.56 255.255.255.0 > $nul
netsh interface ip add address  "port11" 102.1.12.56 255.255.255.0 > $nul
netsh interface ip add address  "port22" 102.1.13.56 255.255.255.0 > $nul
netsh interface ip add address  "port33" 102.1.14.56 255.255.255.0 > $nul
}
else
{
Write-Host "The local host name doesn't match with any of the hostname, please provide the ip manually" -f Yellow
$ip1 = Read-Host "Enter ip for port0" 
netsh interface ip add address  "port0" $ip1 255.255.255.0 > $nul
$ip2 = Read-Host "Enter ip for port1" 
netsh interface ip add address  "port1" $ip2 255.255.255.0 > $nul
$ip3 = Read-Host "Enter ip for port2" 
netsh interface ip add address  "port2" $ip3 255.255.255.0 > $nul 
$ip4 = Read-Host "Enter ip for port3" 
netsh interface ip add address  "port3" $ip4 255.255.255.0 > $nul
}
}


function validate($port,$netif_index_port){
$adapter = Get-NetAdapter -InterfaceDescription "Chel*" 
$combine = $netif_index_port[16] + $netif_index_port[17] 
if($port[16] -eq "0")
{
foreach($value in $adapter)
{
if($combine -eq $value.ifindex)
{
try{
Rename-NetAdapter $value.name -NewName "port0" -ErrorAction Stop
}
catch{
write-host "Already a adapter exist with name as port0, hence renaming to port00" -f Cyan
Rename-NetAdapter $value.name -NewName "port00" -ErrorAction SilentlyContinue #for second adapter
}
}
}
}
if($port[16] -eq "1")
{
foreach($value in $adapter)
{
if($combine -eq $value.ifindex)
{
try{
Rename-NetAdapter $value.name -NewName "port1" -ErrorAction Stop
}
catch
{
write-host "Already a adapter exist with name as port1, hence renaming to port11" -f Cyan
Rename-NetAdapter $value.name -NewName "port11" -ErrorAction Stop #for second adapter
}
}
}
}
if($port[16] -eq "2")
{
foreach($value in $adapter)
{
if($combine -eq $value.ifindex)
{
try{
Rename-NetAdapter $value.name -NewName "port2" -ErrorAction ignore
}
catch
{
write-host "Already a adapter exist with name as port2, hence renaming to port22" -f Cyan
Rename-NetAdapter $value.name -NewName "port22" -ErrorAction Stop #for second adapter
}
}
}
}
if($port[16] -eq "3")
{
foreach($value in $adapter)
{
if($combine -eq $value.ifindex)
{
try{
Rename-NetAdapter $value.name -NewName "port3" -ErrorAction ignore
}
catch
{
write-host "Already a adapter exist with name as port3, hence renaming to port33" -f Cyan
Rename-NetAdapter $value.name -NewName "port33" -ErrorAction Stop #for second adapter
}
}
}
}
}

function dumpctx_check{

$port0 = cxgbtool nic0 debug dumpctx | findstr "Port No"
$netif_index_port0 = cxgbtool nic0 debug dumpctx | findstr "NetIfIdx"
$port1 = cxgbtool nic1 debug dumpctx | findstr "Port No"
$netif_index_port1 = cxgbtool nic1 debug dumpctx | findstr "NetIfIdx"
$port2 = cxgbtool nic2 debug dumpctx | findstr "Port No"
$netif_index_port2 = cxgbtool nic2 debug dumpctx | findstr "NetIfIdx"
$port3 = cxgbtool nic3 debug dumpctx | findstr "Port No"
$netif_index_port3 = cxgbtool nic3 debug dumpctx | findstr "NetIfIdx"

validate $port0 $netif_index_port0
validate $port1 $netif_index_port1
validate $port2 $netif_index_port2
validate $port3 $netif_index_port3


}


#old implementation to find the port no of the adapter
<#$a = Get-NetAdapter -InterfaceDescription "Chel*" 
$p = $a.macaddress -replace '[0-9,a-z]+-\w',""
if ( $p.Get(0) -eq 0 )
{
Rename-NetAdapter $a.name.Get(0) -NewName "port0" -ErrorAction Ignore
Rename-NetAdapter $a.name.Get(1) -NewName "port1" -ErrorAction Ignore
}
else
{
Rename-NetAdapter $a.name.Get(0) -NewName "port1" -ErrorAction Ignore
Rename-NetAdapter $a.name.Get(1) -NewName "port0" -ErrorAction Ignore
}#>


#new implementation to find the port no of the adapter using dumpctx
#main function
write-host "Renaming the chelsio adapters as port0,port1,port2 and port3 according to the ports" -f Yellow
dumpctx_check
write-host "Assigning the ip to the interfaces" -f Yellow
$hostname = hostname
host $hostname 


