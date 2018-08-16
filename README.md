# ehost-device
Move an already-existing device in to a container.

This enhanced host-device plugin allows IPAM be configured after moving
the requested device from the host's network namespace to the container's.

The device can be specified with any one of three properties:
* `device`: The device name, e.g. `eth0`, `can0`
* `hwaddr`: A MAC address
* `kernelpath`: The kernel device kobj, e.g. `/sys/devices/pci0000:00/0000:00:1f.6`

For this plugin, `CNI_IFNAME` will be ignored. Upon DEL, the device will be moved back.

A sample configuration might look like:

```json
{
	"type": "ehost-device",
	"cniVersion": "0.3.0",
	"device": "enp0s1",
        "ipam": {
                "type": "host-local",
                "subnet": "10.10.10.0/24",
                "routes": [{
                        "dst": "0.0.0.0/0"
                }],
                "gateway": "10.10.10.1"
        }
}
```
