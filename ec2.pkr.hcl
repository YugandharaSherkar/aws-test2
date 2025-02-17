# defining a packer block

packer {
    required_plugis {
        amazon = {
            required_versions = ">= 1.2.0"
            source = "github.com\hashicorp\amazon"
        }
        
    }
}

# Defining a source block

source "aws-ec2-est" "ubuntu" {
    ami_name = "linux-packer-test"
    instance_type = "t2.micro"
    region = "us_east_1c"
    
    Source_ami_filtets {
        filters ={
         name = "ubuntu/images/*ubuntu-jammy-22.04-amd64-server-*"
         root-device-type = "ebs"
         virtualization-type = "hvm"
        
        }
        most_recent = true
        owners = ["761131776275"]

    }
    ssh_username = "ubuntu"
}

build {
    name = "learn_packer"
    sources= ["source.aws-ec2-est"]
}