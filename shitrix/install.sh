exit 1

# centos 7

timedatectl set-timezone $MY_TZ

yum clean all && yum update
yum -y install mc ncdu

wget https://repo.bitrix.info/yum/bitrix-env.sh && chmod +x bitrix-env.sh

# php version to use

# php80 (default for 20231201):
# sed -i -e '/\[remi-php74\]/,/^\[/s/enabled=1/enabled=0/' /etc/yum.repos.d/remi-php74.repo
# sed -i -e '/\[remi-php80\]/,/^\[/s/enabled=0/enabled=1/' /etc/yum.repos.d/remi-php80.repo

# php74
# sed -i -e '/\[remi-php74\]/,/^\[/s/enabled=0/enabled=1/' /etc/yum.repos.d/remi-php74.repo
# sed -i -e '/\[remi-php80\]/,/^\[/s/enabled=1/enabled=0/' /etc/yum.repos.d/remi-php80.repo

./bitrix-env.sh
