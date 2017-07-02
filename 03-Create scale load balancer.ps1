# Create a public IP address
$publicIP = New-AzureRmPublicIpAddress `
  -ResourceGroupName AZScaleUS `
  -Location EastUS `
  -AllocationMethod Static `
  -Name myPublicIP

# Create a frontend and backend IP pool
$frontendIP = New-AzureRmLoadBalancerFrontendIpConfig `
  -Name myFrontEndPool `
  -PublicIpAddress $publicIP
$backendPool = New-AzureRmLoadBalancerBackendAddressPoolConfig -Name myBackEndPool

# Create the load balancer
$lb = New-AzureRmLoadBalancer `
  -ResourceGroupName AZScaleUS `
  -Name myLoadBalancer `
  -Location EastUS `
  -FrontendIpConfiguration $frontendIP `
  -BackendAddressPool $backendPool

# Create a load balancer health probe on port 80
Add-AzureRmLoadBalancerProbeConfig -Name myHealthProbe `
  -LoadBalancer $lb `
  -Protocol tcp `
  -Port 80 `
  -IntervalInSeconds 15 `
  -ProbeCount 2

# Create a load balancer rule to distribute traffic on port 80
Add-AzureRmLoadBalancerRuleConfig `
  -Name myLoadBalancerRule `
  -LoadBalancer $lb `
  -FrontendIpConfiguration $lb.FrontendIpConfigurations[0] `
  -BackendAddressPool $lb.BackendAddressPools[0] `
  -Protocol Tcp `
  -FrontendPort 80 `
  -BackendPort 80


#   On this step, before you go further, you can create Inbound nat rules, however when you restart the scale set
#   this setting will be removed automatically, or the configs down below will not work..
#   azure portal says this situation is temporary...

# Create a NAT Rule
#Add-AzureRmLoadBalancerInboundNatRuleConfig 
#-LoadBalancer $lb 
#-Name myLoadBalancerNatRule 
#-BackendPort 3389 
#-FrontendIpConfiguration $lb.FrontendIpConfigurations[0] 
#-FrontendPort 50001 
#-IdleTimeoutInMinutes 10 
#-Protocol Tcp



# Update the load balancer configuration
Set-AzureRmLoadBalancer -LoadBalancer $lb
