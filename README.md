# 虚拟机管理
## 初始化
```bash
export VM_MANAGE_DIR=/opt/vm_manage
mkdir -p $VM_MANAGE_DIR/libvirt_config
mkdir -p $VM_MANAGE_DIR/vm_data
mkdir -p $VM_MANAGE_DIR/libvirt_data
mkdir -p $VM_MANAGE_DIR/rabbitmq_data
chmod 777 $VM_MANAGE_DIR/rabbitmq_data
docker run --rm --network host --privileged \
-v /sys/fs/cgroup:/sys/fs/cgroup:ro \
-v $VM_MANAGE_DIR/vm_data:/opt/vm_manage/vm_data \
-v $VM_MANAGE_DIR/libvirt_data:/var/lib/libvirt \
-v $VM_MANAGE_DIR/libvirt_config:/etc/libvirt \
-v $VM_MANAGE_DIR/rabbitmq_data:/var/lib/rabbitmq \
fanjunwei/libvirt init_data
```
## 运行
```bash
export VM_MANAGE_DIR=/opt/vm_manage
docker run --name libvirt -d --network host --privileged \
-v /sys/fs/cgroup:/sys/fs/cgroup:ro \
-v $VM_MANAGE_DIR/vm_data:/opt/vm_manage/vm_data \
-v $VM_MANAGE_DIR/libvirt_data:/var/lib/libvirt \
-v $VM_MANAGE_DIR/libvirt_config:/etc/libvirt \
-v $VM_MANAGE_DIR/rabbitmq_data:/var/lib/rabbitmq \
fanjunwei/libvirt
```

如果需求修改存储路径，请修改VM_MANAGE_DIR变量，其他内容不要修改
