
provider "aws" {
  region = "us-west-2"
}

provider "aws" {
  alias  = "other"
  region = "us-east-1"
}

module "level_1" {
  source = "../../modules/level-1"
  providers = {
    aws       = aws
    aws.other = aws.other
  }
}

output "level_1" {
  value = module.level_1
}
