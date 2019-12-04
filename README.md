# 虚拟机管理
## 运行
```bash
mkdir -p /home/ms_vm
mkdir -p /home/libvirt_data
docker run --name libvirt -d --network host --privileged \
-v /sys/fs/cgroup:/sys/fs/cgroup:ro \
-v /home/ms_vm:/home/ms_vm \
-v /home/libvirt_data:/var/lib/libvirt \
fanjunwei/libvirt
```
