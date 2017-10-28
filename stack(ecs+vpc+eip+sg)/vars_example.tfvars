region="eu-west-0"
az="eu-west-0a"
project="terrtest-stack"
image_id="ab30dd89-ca93-4e0d-b23d-75fecdea8e4e"
flavor="t2.micro"
keypair="KeyPair-wanwei-ocb"
metadata_this="that"
diff_hosts_id=["a43fbeeb-1bcf-4b38-b7b0-da69ae850cd8"] 
user_data=""
attach_eip="false"
instance_count="1"
subnet_cidr="192.168.111.0/24"
sg_description="terrafrom test sg"
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