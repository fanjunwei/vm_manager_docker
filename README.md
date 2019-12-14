# 虚拟机管理
## 运行
```bash
mkdir -p /opt/vm_manage/libvirt_config
mkdir -p /opt/vm_manage/vm_data
mkdir -p /opt/vm_manage/libvirt_data
docker run --rm --env VM_BASE_DIR=/opt/vm_manage/vm_data --network host --privileged \
-v /sys/fs/cgroup:/sys/fs/cgroup:ro \
-v /opt/vm_manage/vm_data:/opt/vm_manage/vm_data \
-v /opt/vm_manage/libvirt_data:/var/lib/libvirt \
-v /opt/vm_manage/libvirt_config:/etc/libvirt \
-v /opt/vm_manage/rabbitmq_data:/var/lib/rabbitmq \
fanjunwei/libvirt init_data
docker run --name libvirt --env VM_BASE_DIR=/opt/vm_manage/vm_data -d --network host --privileged \
-v /sys/fs/cgroup:/sys/fs/cgroup:ro \
-v /opt/vm_manage/vm_data:/opt/vm_manage/vm_data \
-v /opt/vm_manage/libvirt_data:/var/lib/libvirt \
-v /opt/vm_manage/libvirt_config:/etc/libvirt \
-v /opt/vm_manage/rabbitmq_data:/var/lib/rabbitmq \
fanjunwei/libvirt
```
