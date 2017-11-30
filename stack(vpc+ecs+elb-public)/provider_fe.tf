provider "orangecloud" {
  user_name   = "wayne.wan"
  tenant_name = "eu-west-0"
  password    = "Huawei@201203"
  domain_id   = "5ea9bc57575d4997b2a295ede80d4fc0" //OCB0001835

  //domain_id = "624425dc6e84486ea7869be887496784" //OCB0001686
  insecure = "true"
  auth_url = "https://iam.eu-west-0.prod-cloud-ocb.orange-business.com/v3"

  //auth_url = "http://iam.eu-west-0.cloud-ocb.orange-business.com/v3"
}

provider "openstack" {
  user_name   = "wayne.wan"
  tenant_name = "eu-west-0"
  password    = "Huawei@201203"
  domain_id   = "5ea9bc57575d4997b2a295ede80d4fc0" //OCB0001835

  //domain_id = "624425dc6e84486ea7869be887496784" //OCB0001686
  insecure = "true"
  auth_url = "https://iam.eu-west-0.prod-cloud-ocb.orange-business.com/v3"

  //auth_url = "http://iam.eu-west-0.cloud-ocb.orange-business.com/v3"
}
