# Various Packer builds
## Debian 10.10 OVA with Packer on VMware Workstation (Windows)
Based on: https://github.com/guillermo-musumeci/packer-vsphere-iso-linux

### Build command:
    
    packer build -var-file debian10.pkrvars.hcl debian10.pkr.hcl

### Prerequisities:
 - VMware Workstation
 - VMware OVF Tool

### ToDo:
 - Unhardcode HTTP endpoint: http://192.168.1.2:8888/preseed.cfg
 - Hide secrets of default user (ansible) and root in preseed.cfg

### Sample output:

    D:\Packer>packer build -var-file debian10.pkrvars.hcl debian10.pkr.hcl    
    vmware-iso.debian10-managed: output will be in this color.

    ==> vmware-iso.debian10-managed: Retrieving ISO
    ==> vmware-iso.debian10-managed: Trying https://cdimage.debian.org/debian-cd/current/amd64/iso-cd/debian-10.10.0-amd64-netinst.iso
    ==> vmware-iso.debian10-managed: Trying https://cdimage.debian.org/debian-cd/current/amd64/iso-cd/debian-10.10.0-amd64-netinst.iso?checksum=sha256%3Ac433254a7c5b5b9e6a05f9e1379a0bd6ab3323f89b56537b684b6d1bd1f8b6ad
    ==> vmware-iso.debian10-managed: https://cdimage.debian.org/debian-cd/current/amd64/iso-cd/debian-10.10.0-amd64-netinst.iso?checksum=sha256%3Ac433254a7c5b5b9e6a05f9e1379a0bd6ab3323f89b56537b684b6d1bd1f8b6ad => D:\Packer\packer_cache\d90446f610ce2bf4e4e7ad48a2fa68d698c5484d.iso
    ==> vmware-iso.debian10-managed: Configuring output and export directories...
    ==> vmware-iso.debian10-managed: Creating required virtual machine disks
    ==> vmware-iso.debian10-managed: Building and writing VMX file
    ==> vmware-iso.debian10-managed: Starting HTTP server on port 8888
    ==> vmware-iso.debian10-managed: Starting virtual machine...
    ==> vmware-iso.debian10-managed: Connecting to VNC...
    ==> vmware-iso.debian10-managed: Waiting 10s for boot...
    ==> vmware-iso.debian10-managed: Typing the boot command over VNC...
    ==> vmware-iso.debian10-managed: Waiting for SSH to become available...
    ==> vmware-iso.debian10-managed: Connected to SSH!
    ==> vmware-iso.debian10-managed: Provisioning with shell script: C:\Users\User1\AppData\Local\Temp\packer-shell457632251
        vmware-iso.debian10-managed: Packer Template Build -- Complete
    ==> vmware-iso.debian10-managed: Gracefully halting virtual machine...
        vmware-iso.debian10-managed: Waiting for VMware to clean up after itself...
    ==> vmware-iso.debian10-managed: Deleting unnecessary VMware files...
        vmware-iso.debian10-managed: Deleting: output-debian10-managed\vmware.log
    ==> vmware-iso.debian10-managed: Compacting all attached virtual disks...
        vmware-iso.debian10-managed: Compacting virtual disk 1
    ==> vmware-iso.debian10-managed: Cleaning VMX prior to finishing up...
        vmware-iso.debian10-managed: Detaching ISO from CD-ROM device ide0:0...
        vmware-iso.debian10-managed: Disabling VNC server...
    ==> vmware-iso.debian10-managed: Exporting virtual machine...
        vmware-iso.debian10-managed: Executing: ovftool.exe
    Build 'vmware-iso.debian10-managed' finished after 8 minutes 22 seconds.

    ==> Wait completed after 8 minutes 22 seconds

    ==> Builds finished. The artifacts of successful builds are:
    --> vmware-iso.debian10-managed: VM files in directory: output-debian10-managed