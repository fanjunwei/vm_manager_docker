# 虚拟机管理
## 运行
```bash
docker run -d --network host --privileged \
-v /sys/fs/cgroup:/sys/fs/cgroup:ro \
-v /home:/home \
fanjunwei/libvirt
```
