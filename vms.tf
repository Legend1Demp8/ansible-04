resource "yandex_compute_instance" "worker" {
  for_each = var.vms

  name        = each.value.vm_name
  platform_id = each.value.platform_id
  zone        = var.default_zone

  resources {
    cores         = each.value.cpu
    memory        = each.value.ram
    core_fraction = each.value.core_fraction
  }

  scheduling_policy {
    preemptible = each.value.preemptible
  }

  boot_disk {
    initialize_params {
      image_id = each.value.image_id
      size     = each.value.disk_volume
      type     = each.value.disk_type
    }
  }

  network_interface {
    subnet_id          = yandex_vpc_subnet.develop.id
    security_group_ids = [yandex_vpc_security_group.dev_sg.id]
    nat                = each.value.nat
  }

  #  metadata = {
  #  user-data          = data.template_file.cloudinit.rendered
  #  serial-port-enable = each.value.serial_port_enable
  #}

  metadata = {
    user-data = templatefile("${path.module}/cloud-init.yml", {
      username       = each.value.username
      ssh_public_key = local.ssh_public_key
    })
    serial-port-enable = each.value.serial_port_enable
  }
}
