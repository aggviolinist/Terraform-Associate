module "vpc" {
    source = "../modules/vpc"
    project_name = var.project_name
    region = var.region  
    vpc_cidr = var.vpc_cidr
    pub_sub_1a_cidr = var.pub_sub_1a_cidr
    pub_sub_2b_cidr = var.pub_sub_2b_cidr
    pri_sub_3a_cidr = var.pri_sub_3a_cidr
    pri_sub_4b_cidr = var.pri_sub_4b_cidr
    pri_sub_5a_cidr = var.pri_sub_5a_cidr
    pri_sub_6b_cidr = var.pri_sub_6b_cidr
}