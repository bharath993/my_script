#Script to configure NVGRE/VXLAN



param(
[Parameter(Mandatory=$true)][ValidateSet('2','4','8')][string]$no_of_vm,
[Parameter(Mandatory=$true)][string]$remote_ip
)

if (!(Test-Path C:\Test)){

Write-Host "C:\Test doesn't exist,exiting.." -f Red
exit

}


function feature_check {
if (!(((Get-WindowsFeature -Name hyper-v).installed) -and ((Get-WindowsFeature -Name NetworkVirtualization).installed))){

Write-Host "Hyper-v feature : "(Get-WindowsFeature -Name hyper-v).installed
Write-Host "NetworkVirtualization feature : "(Get-WindowsFeature -Name NetworkVirtualization).installed
Write-Host "Please check which feature is not installed and install it.." -f Red
return 1
}
return 0
}



Write-Host "starting the WINRM service" -f Yellow
Start-Service WinRM
Set-Item WSMan:\localhost\Client\TrustedHosts * -Force


function basic_setup{

$ret = Invoke-Command   -ScriptBlock ${function:feature_check}
$ret1 = Invoke-Command -ComputerName $remote_ip -ScriptBlock ${function:feature_check}

if(($ret -eq 1) -or ($ret1 -eq 1))
{
write-host "Exiting the script" -f Red
exit
}

if (!(Test-Path ".\configure_start_vmnetworkadapter.ps1")){
write-host ".\configure_start_vmnetworkadapter.ps1 is missing!!!,it must be present in the same location as this script" -f Yellow
exit
}
else {
Invoke-Expression -Command .\configure_start_vmnetworkadapter.ps1
Copy-Item .\configure_start_vmnetworkadapter.ps1 \\$remote_ip\C$\Test -Force
Invoke-Command -ComputerName $remote_ip -ScriptBlock {Invoke-Expression -Command $args[0]} -ArgumentList C:\Test\.\configure_start_vmnetworkadapter.ps1
sleep 3
}
}






function remove_mac_file($content){


$a = Get-Content $content 
$a[6] = $a[6] | ForEach-Object { $_ -replace "\w+-\w+",""}
$a[6] = $a[6]  | ForEach-Object { $_ -replace "--",""} 
$a | Set-Content $content


}




function gateway_add($content,$gateway_ip){
$a = Get-Content $content
$a[4] = $a[4] | ForEach-Object {$_ -replace "GW`": `"`"","GW`": `"$($gateway_ip)`""}
$a | Set-Content $content

}

function content_edit_vswitch($content){
write-host "Editing the vswitch name" -f Yellow
$a[7] = $a[7] | ForEach-Object {$_ -replace "\w+",""}
$a[7] = $a[7] -replace "#`": `"`"","#VFPSWITCH`": `"p0`""
$a | Set-Content $content
}

function content_edit($mac_list,$content,$judge){

$a = Get-Content $content
$j = 0
if($judge -eq 1)
{
write-host "Editing the mac-address" -f Yellow
for($i = 1;$i -lt $no_of_vm ;$i = $i + 2 )
{
$a[6] = $a[6]  | ForEach-Object { $_ -replace "VM$($i)_MAC`": `"`"","VM$($i)_MAC`": `"$($mac_list[$j])`""}
$j++
}
}
else {
write-host "Editing the mac-address of remote machine" -f Yellow
for($i = 2;$i -le $no_of_vm ; $i = $i + 2){
$a[6] = $a[6]  | ForEach-Object { $_ -replace "VM$($i)_MAC`": `"`"","VM$($i)_MAC`": `"$($mac_list[$j])`""}
$j++
}
}
$a  | set-content -Path $content



if($judge -ne 1)
{
content_edit_vswitch $content 
Write-Host "Copying the $content to the Remote Machine:$remote_ip" -f Yellow
Copy-Item $content \\$remote_ip\C$\Test -Force
write-host "Copied!!" -f Green
}

}



function content_edit_vm_ip($vm_ip,$content,$judge){

$a = Get-Content $content

$j = 1
if($judge -ne 1){
$j = 2
}

for($i = 0 ;$i -lt $no_of_vm/2; $i++)
{
$a[4] = $a[4] | ForEach-Object {$_  -replace "IP$($j)`": `"`"","IP$($j)`": `"$($vm_ip[$i])`""}
$j = $j + 2
}

$a | Set-Content -Path $content
}


function insert($mac_address){
$mac_list = New-Object system.collections.arraylist
foreach($mac in $mac_address){
if($mac.length -eq 12){
$mac_list.add($($mac.insert(2,"-").insert(5,"-").insert(8,"-").insert(11,"-").insert(14,"-"))) | Out-Null

 }
else{Write-Warning "Mac address $mac is not 12 characters"}
}
return $mac_list
}


function get_mac($content)
{
$macaddress_local = (Get-VMNetworkAdapter *).MacAddress | Sort-Object
$macaddress_remote = Invoke-Command -ComputerName $remote_ip -ScriptBlock {(Get-VMNetworkAdapter *).MacAddress | Sort-Object} 

$mac_list = insert $macaddress_local 


remove_mac_file $content

content_edit $mac_list $content 1
sleep 3
$mac_list = insert $macaddress_remote 

content_edit $mac_list $content 2
}



function GW_replace($content,$gateway_ip){
$sep = $gateway_ip.LastIndexOf(".")
$gateway_ip=  $gateway_ip -replace $gateway_ip.substring($sep+1),1
gateway_add $content $gateway_ip                                   #need to continue from here


}


function get_vm_ip($content){
$a = Get-Content $content
$vm_ip = (Get-VMNetworkAdapter *).ipaddresses | Sort-Object
$vm_ip_remote = Invoke-Command -ComputerName $remote_ip -ScriptBlock {(Get-VMNetworkAdapter *).ipaddresses | Sort-Object} 



$a[4] = $a[4] | ForEach-Object { $_  -replace "\b\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}\b",""}
$a | Set-Content -Path $content
content_edit_vm_ip $vm_ip $content 1
sleep 3
content_edit_vm_ip $vm_ip_remote $content 2
sleep 3
GW_replace $content $vm_ip[0]
}


function select_case
{

switch($no_of_vm){


'2' {

$content  = "C:\Test\HNV_2host_2vms.json"  



break;

}


'4' {
$content = "C:\Test\HNV_2host_4vms.json"




break;

}


'8'  {

$content = "C:\Test\HNV_2host_8vms.json"

}

}
return $content
}

basic_setup
$content = select_case 
get_vm_ip $content
get_mac $content
