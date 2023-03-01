terraform {
    backend "s3" {
        bucket = "terra-lock-test"
        key = "terraform.tfstate"
        region = "ap-south-1"
        dynamodb_table = "terraform-lock"
    }
}

provider "aws" {
    access_key = ""
    secret_key = ""
    region     = "ap-south-1"
}

resource "aws_instance" "ec2_Instance" {
    ami = "ami-062df10d14676e201"  #ubuntu-22.04
    instance_type = "${var.instance_type}"
    key_name = "${var.key_name}"
    tenancy = "default"
    subnet_id = "${var.subnet_id}"
    ebs_optimized = false
    vpc_security_group_ids = [
        "${var.security_group_ids}"
    ]
    source_dest_check = true
    root_block_device {
        volume_size = "${var.volume_size}"
        volume_type = "gp2"
        delete_on_termination = true
    }
    tags = {
    Name = "${var.tag_name}"
  } 
}