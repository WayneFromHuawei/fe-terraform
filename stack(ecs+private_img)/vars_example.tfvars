region="eu-west-0"
az="eu-west-0a"
project="terrtest-stack-privateimg"
image_id="ab30dd89-ca93-4e0d-b23d-75fecdea8e4e"
flavor="t2.micro"
keypair="KeyPair-wanwei-ocb"
metadata_this="that"
network_id="8d4e1aae-8ddc-41a6-84f8-283b824e4c72"
subnet_id="c88c755b-3244-43ce-8c06-e979c3c0a1de"
security_groups=["1d52c37c-e27f-422a-b508-f00f2f25fe0a"]
diff_hosts_id=["a43fbeeb-1bcf-4b38-b7b0-da69ae850cd8"] 
user_data=""
attach_eip="false"
instance_count="1"
#local_file_path="/home/cloud/images/SLES_11_SP4.x86_64-0.0.13.qcow2"
image_source_url="https://oss.prod-cloud-ocb.orange-business.com/obs-liangdezhi/SLES_11_SP4.x86_64-0.0.13.qcow2"
container_format="bare"
min_disk_gb="10"
disk_format="qcow2"
visibility="private"