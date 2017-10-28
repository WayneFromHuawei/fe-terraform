name="terrafrom-test"
description="terrafrom test sg"
rules_count="2"
rules= 
[
	{  
		direction         = "ingress"
		ethertype         = "IPv4"
		protocol          = "tcp"
		port_range_min    = 22
		port_range_max    = 22
		remote_ip_prefix  = "0.0.0.0/0"
	},
	{  
		direction         = "ingress"
		ethertype         = "IPv4"
		protocol          = "tcp"
		port_range_min    = 8080
		port_range_max    = 8080
		remote_ip_prefix  = "0.0.0.0/0"
	}
   ]      
