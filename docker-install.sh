set -ex

apt-get update -q
apt-get upgrade -y -q

apt-get install -y gnupg2 wget

echo 'deb http://repo.pritunl.com/stable/apt xenial main' > /etc/apt/sources.list.d/pritunl.list
echo "deb http://build.openvpn.net/debian/openvpn/stable xenial main" > /etc/apt/sources.list.d/openvpn-aptrepo.list

apt-key adv --keyserver hkp://keyserver.ubuntu.com --recv 9DA31620334BD75D9DCB49F368818C72E52529D4
apt-key adv --keyserver hkp://keyserver.ubuntu.com --recv 7568D9BB55FF9E5287D586017AE645C0CF8E292A
wget -O - https://swupdate.openvpn.net/repos/repo-public.gpg | apt-key add -

apt-get update -q

apt-get install -y locales iptables 

locale-gen en_US en_US.UTF-8
dpkg-reconfigure locales
ln -sf /usr/share/zoneinfo/UTC /etc/localtime

wget --quiet https://github.com/pritunl/pritunl/releases/download/${PRITUNL_VERSION}/pritunl_${PRITUNL_VERSION}-0ubuntu1.xenial_amd64.deb
dpkg -i pritunl_${PRITUNL_VERSION}-0ubuntu1.xenial_amd64.deb || apt-get -f -y install
rm pritunl_${PRITUNL_VERSION}-0ubuntu1.xenial_amd64.deb

apt-get --purge autoremove -y wget
apt-get -y -q autoclean
apt-get -y -q autoremove
rm -rf /tmp/*