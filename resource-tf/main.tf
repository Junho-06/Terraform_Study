provider "aws" {
  region = "ap-northeast-2"
}

data "aws_ami" "ubuntu" {

  # 여러가지의 AMI 리턴 결과중 최신 결과를 가져오는것
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

# resource블록 에서 첫번째 레이블은 리소스의 종류, 두번째 레이블은 리소스 종류에 대한 네이밍 
resource "aws_instance" "ubuntu" {
  ami           = data.aws_ami.ubuntu.image_id
  instance_type = "t2.micro"

  tags = {
    Name = "Test-ubuntu-instance"
  }
}