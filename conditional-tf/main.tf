provider "aws" {
  region = "ap-northeast-2"
}

# conditional Expression
# condition ? if_ture : if_false
variable "is_john" {
  type = bool
  default = true
}

locals {
  message = var.is_john ? "Hello John!" : "Hello!"
}

output "message" {
  value = local.message
}