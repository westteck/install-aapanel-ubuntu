#!/bin/bash

# check for sudo
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

# Ask user for username for folder creation
read user
# or uncoment this line and type the username directly and # the line above
# #user = "user_name"

# make folder for install script
mkdir /home/$user/aapanel-install

# wget install script and savbe it as install.sh to the install folder
wget -O /home/$user/aapanel-install/install.sh http://www.aapanel.com/script/install-ubuntu_6.0_en.sh

# since we used sudo it saves the file as owned by root, change to user as owner
chown $user:user /home/$user/aapanel-install/install.sh

# Make the install.sh file executable
chmod +x /home/#user/aapanel-install/install.sh

# Start the install
sudo bash /home/$user/aapanel-install/install.sh

if [ $? -eq 0 ]; then
   echo " for referance to aapanel cli commands see https://www.aapanel.com/reference.html"
else
   echo "aapanel failed for some reason, FAIL"
fi



 
