provider "aws" {
  region = "ap-northeast-2"
}

# No count / No for_each
resource "aws_iam_user" "user_1" {
  name = "user-1"
}

resource "aws_iam_user" "user_2" {
  name = "user-2"
}

resource "aws_iam_user" "user_3" {
  name = "user-3"
}

output "user_arns" {
  value = [
    aws_iam_user.user_1.arn,
    aws_iam_user.user_2.arn,
    aws_iam_user.user_3.arn,
  ]
}

# count
resource "aws_iam_user" "count" {
  # count는 resource 최상단에 표기 하는것이 컨벤션
  count = 10

  # count는 index를 사용할 수 있음 (0~9)
  name = "count-user-${count.index}"
}

output "count_user_arns" {
          # count에서 만든 모든 user의 arn
  value = aws_iam_user.count.*.arn
}