provider "aws" {
  region  = var.region
  # profile = var.profile
  access_key = var.access_key
  secret_key = var.secret_key

}

module "eks-jx" {
  source               = "github.com/jenkins-x/terraform-aws-eks-jx?ref=v1.19.0"
  cluster_version      = var.cluster_version
  cluster_name         = var.cluster_name
  region               = var.region
  vault_user           = var.vault_user
  is_jx2               = false
  jx_git_url           = var.jx_git_url
  jx_bot_username      = var.jx_bot_username
  jx_bot_token         = var.jx_bot_token
  force_destroy        = var.force_destroy
  nginx_chart_version  = var.nginx_chart_version
  install_kuberhealthy = var.install_kuberhealthy
}

# module "kms_key" {
#       source = "cloudposse/kms-key/aws"
#       # Cloud Posse recommends pinning every module to a specific version
#       # version = "x.x.x"
#       namespace               = "eg"
#       stage                   = "test"
#       name                    = "chamber"
#       description             = "KMS key for chamber"
#       deletion_window_in_days = 10
#       enable_key_rotation     = true
#       alias                   = "alias/parameter_store_key"
#     }
