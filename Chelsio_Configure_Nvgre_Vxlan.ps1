#Script to configure NVGRE/VXLAN



param(
[Parameter(Mandatory=$true)][ValidateSet('2','4','8')][string]$no_of_vm,
[Parameter(Mandatory=$true)][string]$remote_ip
)

if (!(Test-Path C:\Test)){

Write-Host "C:\Test doesn't exist,exiting.." -f Red
exit

}

if (!(((Get-WindowsFeature -Name hyper-v).installed) -and ((Get-WindowsFeature -Name NetworkVirtualization).installed))){

Write-Host "Hyper-v feature : "(Get-WindowsFeature -Name hyper-v).installed
Write-Host "Hyper-v feature : "(Get-WindowsFeature -Name NetworkVirtualization).installed
Write-Host "Please check which feature is not installed and install it.." -f Red
exit
}


Write-Host "starting the WINRM service" -f Yellow
Start-Service WinRM
Set-Item WSMan:\localhost\Client\TrustedHosts * -Force

function remove_mac_file($content){


$a = Get-Content $content 
$a[6] = $a[6] | ForEach-Object { $_ -replace "\w+-\w+",""}
$a[6] = $a[6]  | ForEach-Object { $_ -replace "--",""} 
$a | Set-Content $content


}

function content_edit($mac_list,$content,$judge){
 
$a = Get-Content $content
$j = 0
if($judge -eq 1)
{
for($i = 1;$i -lt $no_of_vm ;$i = $i + 2 )
{
$a[6] = $a[6]  | ForEach-Object { $_ -replace "VM$($i)_MAC`": `"`"","VM$($i)_MAC`": `"$($mac_list[$j])`""}
$j++
}
}
else {
for($i = 2;$i -le $no_of_vm ; $i = $i + 2){

$a[6] = $a[6]  | ForEach-Object { $_ -replace "VM$($i)_MAC`": `"`"","VM$($i)_MAC`": `"$($mac_list[$j])`""}
$j++
}
}
$a  | set-content -Path $content

if($judge -ne 1)
{
Write-Host "Copying the $content to the Remote Machine:$remote_ip" -f Yellow
Copy-Item $content \\$remote_ip\C$\Test -Force
}

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


$content = select_case 
get_mac $content
