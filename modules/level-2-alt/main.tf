
provider "aws" {}

provider "aws" {
  alias = "other"
}

module "level_1" {
  source = "../level-1"
  count  = 1
  providers = {
    aws       = aws
    aws.other = aws.other
  }
}

output "level_1" {
  value = module.level_1
}
