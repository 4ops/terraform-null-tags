# Tags

## Usage

```terraform
module instance_tags {
  source  = "4ops/tags/null"
  version = "1.0.0"
  name    = "my-server-name"
  testing = "yes"
}

data aws_ami ubuntu {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-trusty-14.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource aws_instance some_server {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  tags          = module.instance_tags.tags
  # tags = {
  #   "Name" = "my-server-name"
  #   "Testing" = "yes"
  # }
}
```
