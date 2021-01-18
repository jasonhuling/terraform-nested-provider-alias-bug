provider "aws" {
  alias  = "us-west-2"
  region = "us-west-2"
}

provider "aws" {
  alias  = "other-us-east-1"
  region = "us-east-1"
}

data "aws_region" "other" {
  provider = aws.other-us-east-1
}

module "level_2" {
  source = "../../modules/level-2"
  providers = {
    aws.us-west-2       = aws.us-west-2
    aws.other-us-east-1 = aws.other-us-east-1
  }

  depends_on = [data.aws_region.other]
}

output "level_2" {
  value = module.level_2
}
