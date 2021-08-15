resource "local_file" "ansible_inventory" {
  content = templatefile("ansible_inventory.tmpl", {
    monitoring_ip  = linode_instance.monitoring.ip_address,
    ethereum_node_ip = linode_instance.filecoin_node.ip_address
  })
  filename = "../ansible/inventory.yml"
}
