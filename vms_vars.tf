variable "vms" {
  description = "Конфигурация группы виртуальных машин"
  type = map(object({
    vm_name            = string
    platform_id        = string
    cpu                = number
    ram                = number
    core_fraction      = number
    preemptible        = bool
    image_id           = string
    disk_volume        = number
    disk_type          = string
    nat                = bool
    serial_port_enable = number
    username           = string
  }))

  default = {
    "clickhouse-01" = {
      vm_name            = "clickhouse-01"
      platform_id        = "standard-v2"
      cpu                = 2
      ram                = 2
      core_fraction      = 20
      preemptible        = true
      image_id           = "fd8bu5qanc4labigou11"
      disk_volume        = 20
      disk_type          = "network-hdd"
      nat                = true
      serial_port_enable = 1
      username           = "ansible"
    },
    "vector-01" = {
      vm_name            = "vector-01"
      platform_id        = "standard-v2"
      cpu                = 2
      ram                = 4
      core_fraction      = 20
      preemptible        = true
      image_id           = "fd8bu5qanc4labigou11"
      disk_volume        = 20
      disk_type          = "network-hdd"
      nat                = true
      serial_port_enable = 1
      username           = "vector"
    },
    "lighthouse-01" = {
      vm_name            = "lighthouse-01"
      platform_id        = "standard-v2"
      cpu                = 2
      ram                = 4
      core_fraction      = 20
      preemptible        = true
      image_id           = "fd8bu5qanc4labigou11"
      disk_volume        = 20
      disk_type          = "network-hdd"
      nat                = true
      serial_port_enable = 1
      username           = "lighthouse"
    }
  }
}
