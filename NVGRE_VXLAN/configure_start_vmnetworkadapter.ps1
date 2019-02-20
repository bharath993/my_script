write-host "creating vswitch on port0" -f Yellow
New-VMSwitch -Name p0 -NetAdapterName port0 -AllowManagementOS 1 
Write-Host "enabled netadapter rdma" -f Yellow
Enable-NetAdapterRdma
Write-Host "Assign the vmswitch to all the vm's" -f Yellow
Connect-VMNetworkAdapter -SwitchName p0 -VMName *