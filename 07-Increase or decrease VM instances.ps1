

Get-AzureRmVmss -ResourceGroupName AZScaleUS `
    -VMScaleSetName AZScale02 | `
    Select -ExpandProperty Sku

# Get current scale set
$scaleset = Get-AzureRmVmss `
  -ResourceGroupName AZScaleUS `
  -VMScaleSetName AZScale02

# Set and update the capacity of your scale set
$scaleset.sku.capacity = 5
Update-AzureRmVmss -ResourceGroupName AZScaleUS `
    -Name AZScale02 `
    -VirtualMachineScaleSet $scaleset
