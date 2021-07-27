# packer build -var-file debian10.pkrvars.hcl debian10.pkr.hcl
variable "vm_name" {
  type      = string
  default   = "Debian-10-Template"
  description = "Name of the created VM"
}

variable "vm-cpu-num" {
  type      = number
  default   = 2
  description = "Number of vCPUs"
}

variable "vm-mem-size" {
  type    = number
  default = 1024
  description = "Memory size"
}

variable "vm-disk-size" {
  type    = number
  default = 16384
  description = "Disk size"
}

variable "iso-url" {
  type    = string
  default = "https://cdimage.debian.org/debian-cd/current/amd64/iso-cd/debian-10.10.0-amd64-netinst.iso"
  description = "ISO URL-address"
}

variable "iso_checksum_type" {
  type    = string
  default = "sha256"
  description = "Checksum type"
}

variable "iso-checksum" {
  type    = string
  default = "c433254a7c5b5b9e6a05f9e1379a0bd6ab3323f89b56537b684b6d1bd1f8b6ad"
  description = "Checksum"
}

variable "ssh_username" {
  type      = string
  default   = "ansible"
  description = "Default user"
}

variable "ssh_password" {
  type      = string
  default   = ""
  sensitive = true
}

source "vmware-iso" "debian10-managed" {
  cpus              = "2"
  boot_command      = ["<esc><wait>", "install <wait>", "auto preseed/url=http://192.168.1.60:8888/preseed.cfg <wait>", "debian-installer=en_US.UTF-8 <wait>", "locale=en_US.UTF-8 <wait>", "kbd-chooser/method=us <wait>", "keyboard-configuration/xkb-keymap=us <wait>", "netcfg/get_hostname=debian10 <wait>", "netcfg/get_domain=omega.loc <wait>", "fb=false <wait>", "debconf/frontend=noninteractive <wait>", "console-setup/ask_detect=false <wait>", "console-keymaps-at/keymap=us <wait>", "grub-installer/bootdev=/dev/sda <wait>", "<enter><wait>"]
  boot_key_interval = "10ms"
  disk_size         = "${var.vm-disk-size}"
  format            = "ova"
  guest_os_type     = "debian10_64Guest"
  http_bind_address = "192.168.1.2"
  http_directory    = "http"
  http_port_max     = "8888"
  http_port_min     = "8888"
  iso_checksum      = "${var.iso-checksum}"
  iso_url           = "${var.iso-url}"
  memory            = "1024"
  shutdown_command  = "echo '${var.ssh_password}' | sudo -S shutdown -P now"
  ssh_password      = "${var.ssh_password}"
  ssh_timeout       = "1h"
  ssh_username      = "${var.ssh_username}"
  vm_name           = "${var.vm_name}"
}

build {
  sources = ["source.vmware-iso.debian10-managed"]
  provisioner "shell" {
    inline = ["echo 'Packer Template Build -- Complete'"]
  }
}
