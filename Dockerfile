FROM centos:7
ENV container docker
COPY vm-manager.service /usr/lib/systemd/system/
RUN (cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == \
systemd-tmpfiles-setup.service ] || rm -f $i; done); \
rm -f /lib/systemd/system/multi-user.target.wants/*;\
rm -f /etc/systemd/system/*.wants/*;\
rm -f /lib/systemd/system/local-fs.target.wants/*; \
rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
rm -f /lib/systemd/system/basic.target.wants/*;\
rm -f /lib/systemd/system/anaconda.target.wants/*;
RUN yum -y install epel-release; \
curl --silent --location https://rpm.nodesource.com/setup_10.x | bash -; \
yum  -y install libvirt qemu-kvm libguestfs-tools virt-install.noarch git python-pip nodejs nginx; \
mkdir -p /usr/lib/vm_manager; \
cd /usr/lib/vm_manager; \
git clone https://github.com/fanjunwei/vm_manager_vue; \
git clone https://github.com/fanjunwei/vm_manager_django.git; \
cd /usr/lib/vm_manager/vm_manager_vue; \
npm install; \
npm run build; \
systemctl enable libvirtd.service; \
systemctl enable vm-manager.service; \
yum clean;
COPY nginx.conf /etc/nginx/nginx.conf
VOLUME [ "/sys/fs/cgroup" ]
CMD ["/usr/sbin/init"]
