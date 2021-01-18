
provider "aws" {
  alias = "us-west-2"
}

provider "aws" {
  alias = "other-us-east-1"
}

module "level_1" {
  source = "../level-1"
  count  = 1
  providers = {
    aws       = aws.us-west-2
    aws.other = aws.other-us-east-1
  }
}

output "level_1" {
  value = module.level_1
}
