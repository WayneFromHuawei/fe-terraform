provider "flexibleengine" {
  user_name   = ""
  tenant_name = "eu-west-0"
  password    = ""
  domain_id   = "" 
  insecure = "true"
  auth_url = "https://iam.eu-west-0.prod-cloud-ocb.orange-business.com/v3"
}

provider "openstack" {
  user_name   = ""
  tenant_name = "eu-west-0"
  password    = ""
  domain_id   = "" 
  insecure = "true"
  auth_url = "https://iam.eu-west-0.prod-cloud-ocb.orange-business.com/v3"
}
