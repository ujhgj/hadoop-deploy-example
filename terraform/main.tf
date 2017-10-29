provider "google" {
  project = "${var.project}"
  region  = "${var.region}"
}

module "master" {
  source                          = "modules/node"
  public_key_path                 = "${var.public_key_path}"
  disk_image                      = "${var.disk_image}"
  provisioner_connection_key_path = "${var.provisioner_connection_key_path}"
  role                            = "master"
  name                            = "master"
}

module "slave1" {
  source                          = "modules/node"
  public_key_path                 = "${var.public_key_path}"
  disk_image                      = "${var.disk_image}"
  provisioner_connection_key_path = "${var.provisioner_connection_key_path}"
  role                            = "slave"
  name                            = "slave1"
}

module "slave2" {
  source                          = "modules/node"
  public_key_path                 = "${var.public_key_path}"
  disk_image                      = "${var.disk_image}"
  provisioner_connection_key_path = "${var.provisioner_connection_key_path}"
  role                            = "slave"
  name                            = "slave2"
}

module "vpc" {
  source        = "modules/vpc"
}
