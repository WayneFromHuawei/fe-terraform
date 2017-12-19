region="eu-west-0"
bucket_name="terrtest-bucket1"
acl_policy="public-read-write"
bucket_policy = "{ \"Statement\":[ { \"Effect\":\"Allow\", \"Principal\":{ \"AWS\":[\"arn:aws:iam::5ea9bc57575d4997b2a295ede80d4fc0:user/e0447c5534b34f2481391ec12e7b47ba\"] }, \"Action\":[\"s3:GetObject\"], \"Resource\":\"arn:aws:s3:::terrtest-bucket1/*\" } ] }"
