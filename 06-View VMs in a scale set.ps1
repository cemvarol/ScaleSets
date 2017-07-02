
# Get current scale set
$scaleset = Get-AzureRmVmss `
  -ResourceGroupName AZScaleUS `
  -VMScaleSetName AZScale02

# Loop through the instanaces in your scale set
for ($i=0; $i -le ($scaleset.Sku.Capacity - 1); $i++) {
    Get-AzureRmVmssVM -ResourceGroupName AZScaleUS `
      -VMScaleSetName AZScale02 `
      -InstanceId $i
} 
