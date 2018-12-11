set -ex

apt-get update -q
apt-get upgrade -y -q

apt-get install -y gnupg2 wget curl

echo 'deb http://repo.pritunl.com/stable/apt xenial main' > /etc/apt/sources.list.d/pritunl.list
echo "deb http://build.openvpn.net/debian/openvpn/stable xenial main" > /etc/apt/sources.list.d/openvpn-aptrepo.list

apt-key adv --keyserver hkp://keyserver.ubuntu.com --recv 7568D9BB55FF9E5287D586017AE645C0CF8E292A
wget -O - https://swupdate.openvpn.net/repos/repo-public.gpg | apt-key add -

apt-get update -q

apt-get install -y iptables pritunl