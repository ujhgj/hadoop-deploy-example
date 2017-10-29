output "external_master_ip" {
  value = "${module.master.external_ip}"
}
output "external_slave1_ip" {
  value = "${module.slave1.external_ip}"
}
output "external_slave2_ip" {
  value = "${module.slave2.external_ip}"
}
output "internal_master_ip" {
  value = "${module.master.internal_ip}"
}
output "internal_slave1_ip" {
  value = "${module.slave1.internal_ip}"
}
output "internal_slave2_ip" {
  value = "${module.slave2.internal_ip}"
}