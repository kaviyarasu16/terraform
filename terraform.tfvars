ami_id             = "ami-062df10d14676e201"   #ubuntu 22.04 (os)
security_group_ids = "sg-f7233793"             #default
subnet_id          = "subnet-338cf07f"         #default
key_name           = "fibonalabs-docker-key"   #default
instance_type      = "t2.micro"
volume_size        =  "8"
tag_name           = "terratest"    #instance name