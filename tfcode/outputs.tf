
output "vnet_id" {
  description = "The id of the newly created vNet"
  value       = vnet.vnet.id
}

output "vnet_name" {
  description = "The name of the newly created vNet"
  value       = vnet.vnet.name
}

output "vnet_location" {
  description = "The location of the newly created vNet"
  value       = vnet.vnet.location
}

output "vnet_address_space" {
  description = "The address space of the newly created vNet"
  value       = vnet.vnet.address_space
}

output "vnet_subnets" {
  description = "The ids of subnets created inside the newly created vNet"
  value       = vnet.subnet.*.id
}