
# Proxy Providers

provider "aws" {}

provider "aws" {
  alias = "other"
}

# Data

data "aws_region" "default" {}

data "aws_region" "other" {
  provider = aws.other
}

# Outputs

output "default" {
  value = data.aws_region.default
}

output "other" {
  value = data.aws_region.other
}
