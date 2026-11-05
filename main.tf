#Пример передачи cloud-config в ВМ для демонстрации №3
#data "template_file" "cloudinit" {
#  template = file("${path.module}/cloud-init.yml")
#
#  vars = {
#    ssh_public_key = local.ssh_public_key
#  }
#}

resource "local_file" "ansible_inventory" {
  content = templatefile("${path.module}/inventory.tftpl", {
    workers = yandex_compute_instance.worker
  })
  filename = "${path.module}/inventory/prod.yml"
}
