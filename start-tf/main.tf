provider "local" {

}

provider "aws" {
    # 하나의 aws provider는 하나의 리전과 연결됨, 여러 리전이 필요하다면 여러 provider 생성
    region = "ap-northeast-2"
}

resource "local_file" "foo" {
    # path.module = 현재 파일이 위치한 경로
    filename = "${path.module}/foo.txt"
    content  = "Hello World!"
}

data "local_file" "bar" {
    filename = "${path.module}/bar.txt"
}

output "file_bar" {
    value = data.local_file.bar
}

resource "aws_vpc" "foo" {
    cidr_block = "10.0.0.0/16"

    tags = {
        "Name" = "This is test VPC"
    }
}

output "vpc_foo" {
    value = aws_vpc.foo
}