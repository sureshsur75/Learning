#!/bin/bash
echo "Checking for centos5-x86"
COMMAND_RESULT=$(echo "$(uname -a 2>/dev/null)"; echo "$(test -f /etc/os-release -a -f /etc/redhat-release && grep -qi 'centos' /etc/os-release && cat /etc/redhat-release 2>/dev/null)"; echo "$(test -f /etc/redhat-release -a ! -f /etc/enterprise-release && cat /etc/redhat-release 2>/dev/null)"; echo "$(test -f /etc/issue && cat /etc/issue 2>/dev/null)"; echo "$(uname -m 2>/dev/null)")
echo "$COMMAND_RESULT" | grep -q "CentOS .*release[[:space:]]5.*"
OS_MATCH=$?
echo "$COMMAND_RESULT" | grep -q "i686"
ARCH_MATCH=$?
if [[ $OS_MATCH -eq "0" && $ARCH_MATCH -eq "0" ]]; then
  rpm -i ./TaniumClient-7.6.4.2106-1.rhe5.i386.rpm
  if [[ "$?" -eq "0" ]]; then
    echo "Installation successful. Copying tanium-init.dat."
    cp ./tanium-init.dat /opt/Tanium/TaniumClient/
    echo "Starting service."
    /sbin/service TaniumClient start
  else
    echo "Install failed."
    exit 1
  fi
  exit
fi
echo "Checking for rhel5-x86"
COMMAND_RESULT=$(echo "$(uname -a 2>/dev/null)"; echo "$(test -f /etc/os-release -a -f /etc/redhat-release && grep -qi 'red hat' /etc/os-release && cat /etc/redhat-release 2>/dev/null)"; echo "$(test -f /etc/redhat-release -a ! -f /etc/enterprise-release -a ! -f /etc/oracle-release && cat /etc/redhat-release 2>/dev/null)"; echo "$(test -f /etc/issue && cat /etc/issue 2>/dev/null)"; echo "$(uname -m 2>/dev/null)")
echo "$COMMAND_RESULT" | grep -q "Red Hat Enterprise.*release[[:space:]]5.*"
OS_MATCH0=$?
echo "$COMMAND_RESULT" | grep -q "RHEL[[:space:]]5.*"
OS_MATCH1=$?
if [ "$OS_MATCH0" = "0" ] || [ "$OS_MATCH1" = "0" ]; then OS_MATCH="0"; else OS_MATCH="1"; fi
echo "$COMMAND_RESULT" | grep -q "i686"
ARCH_MATCH=$?
if [[ $OS_MATCH -eq "0" && $ARCH_MATCH -eq "0" ]]; then
  rpm -i ./TaniumClient-7.6.4.2106-1.rhe5.i386.rpm
  if [[ "$?" -eq "0" ]]; then
    echo "Installation successful. Copying tanium-init.dat."
    cp ./tanium-init.dat /opt/Tanium/TaniumClient/
    echo "Starting service."
    /sbin/service TaniumClient start
  else
    echo "Install failed."
    exit 1
  fi
  exit
fi
echo "Checking for rhel9-x64"
COMMAND_RESULT=$(echo "$(uname -a 2>/dev/null)"; echo "$(test -f /etc/os-release -a -f /etc/redhat-release && grep -qi 'red hat' /etc/os-release && cat /etc/redhat-release 2>/dev/null)"; echo "$(test -f /etc/redhat-release -a ! -f /etc/enterprise-release -a ! -f /etc/oracle-release && cat /etc/redhat-release 2>/dev/null)"; echo "$(test -f /etc/issue && cat /etc/issue 2>/dev/null)"; echo "$(uname -m 2>/dev/null)")
echo "$COMMAND_RESULT" | grep -q "Red Hat Enterprise.*release[[:space:]]9.*"
OS_MATCH0=$?
echo "$COMMAND_RESULT" | grep -q "RHEL[[:space:]]9.*"
OS_MATCH1=$?
if [ "$OS_MATCH0" = "0" ] || [ "$OS_MATCH1" = "0" ]; then OS_MATCH="0"; else OS_MATCH="1"; fi
echo "$COMMAND_RESULT" | grep -q "x86_64"
ARCH_MATCH=$?
if [[ $OS_MATCH -eq "0" && $ARCH_MATCH -eq "0" ]]; then
  rpm -i ./TaniumClient-7.6.4.2106-1.rhe9.x86_64.rpm
  if [[ "$?" -eq "0" ]]; then
    echo "Installation successful. Copying tanium-init.dat."
    cp ./tanium-init.dat /opt/Tanium/TaniumClient/
    echo "Starting service."
    systemctl start taniumclient
  else
    echo "Install failed."
    exit 1
  fi
  exit
fi
echo "Checking for alma9-x64"
COMMAND_RESULT=$(echo "$(uname -a 2>/dev/null)"; echo "$(test -f /etc/os-release -a -f /etc/redhat-release && grep -qi 'centos' /etc/os-release && cat /etc/redhat-release 2>/dev/null)"; echo "$(test -f /etc/centos-release && cat /etc/centos-release 2>/dev/null)")
echo "$COMMAND_RESULT" | grep -q "AlmaLinux release[[:space:]]9.*"
OS_MATCH=$?
echo "$COMMAND_RESULT" | grep -q "x86_64"
ARCH_MATCH=$?
if [[ $OS_MATCH -eq "0" && $ARCH_MATCH -eq "0" ]]; then
  rpm -i ./TaniumClient-7.6.4.2106-1.rhe9.x86_64.rpm
  if [[ "$?" -eq "0" ]]; then
    echo "Installation successful. Copying tanium-init.dat."
    cp ./tanium-init.dat /opt/Tanium/TaniumClient/
    echo "Starting service."
    systemctl start taniumclient
  else
    echo "Install failed."
    exit 1
  fi
  exit
fi
echo "Checking for rocky9-x64"
COMMAND_RESULT=$(echo "$(uname -a 2>/dev/null)"; echo "$(test -f /etc/os-release -a -f /etc/redhat-release && grep -qi 'centos' /etc/os-release && cat /etc/redhat-release 2>/dev/null)"; echo "$(test -f /etc/centos-release && cat /etc/centos-release 2>/dev/null)"; echo "$(test -f /etc/rocky-release && cat /etc/rocky-release 2>/dev/null)")
echo "$COMMAND_RESULT" | grep -q "Rocky Linux.*[[:space:]]9\..*"
OS_MATCH=$?
echo "$COMMAND_RESULT" | grep -q "x86_64"
ARCH_MATCH=$?
if [[ $OS_MATCH -eq "0" && $ARCH_MATCH -eq "0" ]]; then
  rpm -i ./TaniumClient-7.6.4.2106-1.rhe9.x86_64.rpm
  if [[ "$?" -eq "0" ]]; then
    echo "Installation successful. Copying tanium-init.dat."
    cp ./tanium-init.dat /opt/Tanium/TaniumClient/
    echo "Starting service."
    systemctl start taniumclient
  else
    echo "Install failed."
    exit 1
  fi
  exit
fi
echo "Checking for debian10-x64"
COMMAND_RESULT=$(echo "$(uname -a 2>/dev/null)"; echo "$(test -f /etc/debian_version && cat /etc/debian_version 2>/dev/null)"; echo "$(test -f /etc/lsb-release && cat /etc/lsb-release 2>/dev/null)"; echo "$(test -f /etc/issue && cat /etc/issue 2>/dev/null)"; echo "$(uname -m 2>/dev/null)")
echo "$COMMAND_RESULT" | grep -q "Debian GNU/Linux 10 "
OS_MATCH=$?
echo "$COMMAND_RESULT" | grep -q "x86_64"
ARCH_MATCH=$?
if [[ $OS_MATCH -eq "0" && $ARCH_MATCH -eq "0" ]]; then
  dpkg --force-all -i ./taniumclient_7.6.4.2106-debian10_amd64.deb
  if [[ "$?" -eq "0" ]]; then
    echo "Installation successful. Copying tanium-init.dat."
    cp ./tanium-init.dat /opt/Tanium/TaniumClient/
    echo "Starting service."
    systemctl start taniumclient
  else
    echo "Install failed."
    exit 1
  fi
  exit
fi
echo "Checking for centos8-x64"
COMMAND_RESULT=$(echo "$(uname -a 2>/dev/null)"; echo "$(test -f /etc/os-release -a -f /etc/redhat-release && grep -qi 'centos' /etc/os-release && cat /etc/redhat-release 2>/dev/null)"; echo "$(test -f /etc/centos-release && cat /etc/centos-release 2>/dev/null)")
echo "$COMMAND_RESULT" | grep -q "CentOS .*release[[:space:]]8.*"
OS_MATCH=$?
echo "$COMMAND_RESULT" | grep -q "x86_64"
ARCH_MATCH=$?
if [[ $OS_MATCH -eq "0" && $ARCH_MATCH -eq "0" ]]; then
  rpm -i ./TaniumClient-7.6.4.2106-1.rhe8.x86_64.rpm
  if [[ "$?" -eq "0" ]]; then
    echo "Installation successful. Copying tanium-init.dat."
    cp ./tanium-init.dat /opt/Tanium/TaniumClient/
    echo "Starting service."
    systemctl start taniumclient
  else
    echo "Install failed."
    exit 1
  fi
  exit
fi
echo "Checking for alma8-x64"
COMMAND_RESULT=$(echo "$(uname -a 2>/dev/null)"; echo "$(test -f /etc/os-release -a -f /etc/redhat-release && grep -qi 'centos' /etc/os-release && cat /etc/redhat-release 2>/dev/null)"; echo "$(test -f /etc/centos-release && cat /etc/centos-release 2>/dev/null)")
echo "$COMMAND_RESULT" | grep -q "AlmaLinux release[[:space:]]8.*"
OS_MATCH=$?
echo "$COMMAND_RESULT" | grep -q "x86_64"
ARCH_MATCH=$?
if [[ $OS_MATCH -eq "0" && $ARCH_MATCH -eq "0" ]]; then
  rpm -i ./TaniumClient-7.6.4.2106-1.rhe8.x86_64.rpm
  if [[ "$?" -eq "0" ]]; then
    echo "Installation successful. Copying tanium-init.dat."
    cp ./tanium-init.dat /opt/Tanium/TaniumClient/
    echo "Starting service."
    systemctl start taniumclient
  else
    echo "Install failed."
    exit 1
  fi
  exit
fi
echo "Checking for rocky8-x64"
COMMAND_RESULT=$(echo "$(uname -a 2>/dev/null)"; echo "$(test -f /etc/os-release -a -f /etc/redhat-release && grep -qi 'centos' /etc/os-release && cat /etc/redhat-release 2>/dev/null)"; echo "$(test -f /etc/centos-release && cat /etc/centos-release 2>/dev/null)"; echo "$(test -f /etc/rocky-release && cat /etc/rocky-release 2>/dev/null)")
echo "$COMMAND_RESULT" | grep -q "Rocky Linux.*[[:space:]]8\..*"
OS_MATCH=$?
echo "$COMMAND_RESULT" | grep -q "x86_64"
ARCH_MATCH=$?
if [[ $OS_MATCH -eq "0" && $ARCH_MATCH -eq "0" ]]; then
  rpm -i ./TaniumClient-7.6.4.2106-1.rhe8.x86_64.rpm
  if [[ "$?" -eq "0" ]]; then
    echo "Installation successful. Copying tanium-init.dat."
    cp ./tanium-init.dat /opt/Tanium/TaniumClient/
    echo "Starting service."
    systemctl start taniumclient
  else
    echo "Install failed."
    exit 1
  fi
  exit
fi
echo "Checking for rhel8-x64"
COMMAND_RESULT=$(echo "$(uname -a 2>/dev/null)"; echo "$(test -f /etc/os-release -a -f /etc/redhat-release && grep -qi 'red hat' /etc/os-release && cat /etc/redhat-release 2>/dev/null)"; echo "$(test -f /etc/redhat-release -a ! -f /etc/enterprise-release -a ! -f /etc/oracle-release && cat /etc/redhat-release 2>/dev/null)"; echo "$(test -f /etc/issue && cat /etc/issue 2>/dev/null)"; echo "$(uname -m 2>/dev/null)")
echo "$COMMAND_RESULT" | grep -q "Red Hat Enterprise.*release[[:space:]]8.*"
OS_MATCH0=$?
echo "$COMMAND_RESULT" | grep -q "RHEL[[:space:]]8.*"
OS_MATCH1=$?
if [ "$OS_MATCH0" = "0" ] || [ "$OS_MATCH1" = "0" ]; then OS_MATCH="0"; else OS_MATCH="1"; fi
echo "$COMMAND_RESULT" | grep -q "x86_64"
ARCH_MATCH=$?
if [[ $OS_MATCH -eq "0" && $ARCH_MATCH -eq "0" ]]; then
  rpm -i ./TaniumClient-7.6.4.2106-1.rhe8.x86_64.rpm
  if [[ "$?" -eq "0" ]]; then
    echo "Installation successful. Copying tanium-init.dat."
    cp ./tanium-init.dat /opt/Tanium/TaniumClient/
    echo "Starting service."
    systemctl start taniumclient
  else
    echo "Install failed."
    exit 1
  fi
  exit
fi
echo "Checking for amazon2023-x64"
COMMAND_RESULT=$(echo "$(uname -a 2>/dev/null)"; echo "$(test -f /etc/os-release && cat /etc/os-release 2>/dev/null)"; echo "$(uname -m 2>/dev/null)")
echo "$COMMAND_RESULT" | grep -q "amzn2023\.x86_64"
OS_MATCH=$?
echo "$COMMAND_RESULT" | grep -q "x86_64"
ARCH_MATCH=$?
if [[ $OS_MATCH -eq "0" && $ARCH_MATCH -eq "0" ]]; then
  rpm -i ./TaniumClient-7.6.4.2106-1.amzn2023.0.20230503.x86_64.rpm
  if [[ "$?" -eq "0" ]]; then
    echo "Installation successful. Copying tanium-init.dat."
    cp ./tanium-init.dat /opt/Tanium/TaniumClient/
    echo "Starting service."
    service taniumclient start
  else
    echo "Install failed."
    exit 1
  fi
  exit
fi
echo "Checking for oracle5-x64"
COMMAND_RESULT=$(echo "$(test -f /etc/redhat-release -a ! -f /etc/enterprise-release && cat /etc/redhat-release 2>/dev/null)"; echo "$(test -f /etc/enterprise-release && cat /etc/enterprise-release 2>/dev/null)"; echo "$(uname -m 2>/dev/null)")
echo "$COMMAND_RESULT" | grep -q "Enterprise Linux Server release 5.*"
OS_MATCH=$?
echo "$COMMAND_RESULT" | grep -q "x86_64"
ARCH_MATCH=$?
if [[ $OS_MATCH -eq "0" && $ARCH_MATCH -eq "0" ]]; then
  rpm -i ./TaniumClient-7.6.4.2106-1.oel5.x86_64.rpm
  if [[ "$?" -eq "0" ]]; then
    echo "Installation successful. Copying tanium-init.dat."
    cp ./tanium-init.dat /opt/Tanium/TaniumClient/
    echo "Starting service."
    service TaniumClient start
  else
    echo "Install failed."
    exit 1
  fi
  exit
fi
echo "Checking for debian12-arm64"
COMMAND_RESULT=$(echo "$(uname -a 2>/dev/null)"; echo "$(test -f /etc/os-release && cat /etc/os-release 2>/dev/null)"; echo "$(lsb_release -d 2>/dev/null)"; echo "$(uname -m 2>/dev/null)")
echo "$COMMAND_RESULT" | grep -q "Debian GNU/Linux 12 "
OS_MATCH=$?
echo "$COMMAND_RESULT" | grep -q "aarch64"
ARCH_MATCH=$?
if [[ $OS_MATCH -eq "0" && $ARCH_MATCH -eq "0" ]]; then
  dpkg --force-all -i ./taniumclient_7.6.4.2106-debian12_arm64.deb
  if [[ "$?" -eq "0" ]]; then
    echo "Installation successful. Copying tanium-init.dat."
    cp ./tanium-init.dat /opt/Tanium/TaniumClient/
    echo "Starting service."
    systemctl start taniumclient
  else
    echo "Install failed."
    exit 1
  fi
  exit
fi
echo "Checking for ubuntu20-x64"
COMMAND_RESULT=$(echo "$(uname -a 2>/dev/null)"; echo "$(test -f /etc/lsb-release && cat /etc/lsb-release 2>/dev/null)"; echo "$(test -f /etc/issue && cat /etc/issue 2>/dev/null)"; echo "$(uname -m 2>/dev/null)")
echo "$COMMAND_RESULT" | grep -q "[Uu]buntu 20\."
OS_MATCH=$?
echo "$COMMAND_RESULT" | grep -q "x86_64"
ARCH_MATCH=$?
if [[ $OS_MATCH -eq "0" && $ARCH_MATCH -eq "0" ]]; then
  dpkg --force-all -i ./taniumclient_7.6.4.2106-ubuntu20_amd64.deb
  if [[ "$?" -eq "0" ]]; then
    echo "Installation successful. Copying tanium-init.dat."
    cp ./tanium-init.dat /opt/Tanium/TaniumClient/
    echo "Starting service."
    systemctl start taniumclient
  else
    echo "Install failed."
    exit 1
  fi
  exit
fi
echo "Checking for centos7-x64"
COMMAND_RESULT=$(echo "$(uname -a 2>/dev/null)"; echo "$(test -f /etc/os-release -a -f /etc/redhat-release && grep -qi 'centos' /etc/os-release && cat /etc/redhat-release 2>/dev/null)"; echo "$(test -f /etc/centos-release && cat /etc/centos-release 2>/dev/null)"; echo "$(test -f /etc/issue && cat /etc/issue 2>/dev/null)"; echo "$(uname -m 2>/dev/null)")
echo "$COMMAND_RESULT" | grep -q "CentOS .*release[[:space:]]7.*"
OS_MATCH=$?
echo "$COMMAND_RESULT" | grep -q "x86_64"
ARCH_MATCH=$?
if [[ $OS_MATCH -eq "0" && $ARCH_MATCH -eq "0" ]]; then
  rpm -i ./TaniumClient-7.6.4.2106-1.rhe7.x86_64.rpm
  if [[ "$?" -eq "0" ]]; then
    echo "Installation successful. Copying tanium-init.dat."
    cp ./tanium-init.dat /opt/Tanium/TaniumClient/
    echo "Starting service."
    systemctl start taniumclient
  else
    echo "Install failed."
    exit 1
  fi
  exit
fi
echo "Checking for rhel7-x64"
COMMAND_RESULT=$(echo "$(uname -a 2>/dev/null)"; echo "$(test -f /etc/os-release -a -f /etc/redhat-release && grep -qi 'red hat' /etc/os-release && cat /etc/redhat-release 2>/dev/null)"; echo "$(test -f /etc/redhat-release -a ! -f /etc/enterprise-release -a ! -f /etc/oracle-release && cat /etc/redhat-release 2>/dev/null)"; echo "$(test -f /etc/issue && cat /etc/issue 2>/dev/null)"; echo "$(uname -m 2>/dev/null)")
echo "$COMMAND_RESULT" | grep -q "Red Hat Enterprise.*release[[:space:]]7.*"
OS_MATCH0=$?
echo "$COMMAND_RESULT" | grep -q "RHEL[[:space:]]7.*"
OS_MATCH1=$?
if [ "$OS_MATCH0" = "0" ] || [ "$OS_MATCH1" = "0" ]; then OS_MATCH="0"; else OS_MATCH="1"; fi
echo "$COMMAND_RESULT" | grep -q "x86_64"
ARCH_MATCH=$?
if [[ $OS_MATCH -eq "0" && $ARCH_MATCH -eq "0" ]]; then
  rpm -i ./TaniumClient-7.6.4.2106-1.rhe7.x86_64.rpm
  if [[ "$?" -eq "0" ]]; then
    echo "Installation successful. Copying tanium-init.dat."
    cp ./tanium-init.dat /opt/Tanium/TaniumClient/
    echo "Starting service."
    systemctl start taniumclient
  else
    echo "Install failed."
    exit 1
  fi
  exit
fi
echo "Checking for ubuntu16-x64"
COMMAND_RESULT=$(echo "$(uname -a 2>/dev/null)"; echo "$(test -f /etc/lsb-release && cat /etc/lsb-release 2>/dev/null)"; echo "$(test -f /etc/issue && cat /etc/issue 2>/dev/null)"; echo "$(uname -m 2>/dev/null)")
echo "$COMMAND_RESULT" | grep -q "[Uu]buntu 16\."
OS_MATCH=$?
echo "$COMMAND_RESULT" | grep -q "x86_64"
ARCH_MATCH=$?
if [[ $OS_MATCH -eq "0" && $ARCH_MATCH -eq "0" ]]; then
  dpkg --force-all -i ./taniumclient_7.6.4.2106-ubuntu16_amd64.deb
  if [[ "$?" -eq "0" ]]; then
    echo "Installation successful. Copying tanium-init.dat."
    cp ./tanium-init.dat /opt/Tanium/TaniumClient/
    echo "Starting service."
    systemctl start taniumclient
  else
    echo "Install failed."
    exit 1
  fi
  exit
fi
echo "Checking for ubuntu22-x64"
COMMAND_RESULT=$(echo "$(uname -a 2>/dev/null)"; echo "$(test -f /etc/lsb-release && cat /etc/lsb-release 2>/dev/null)"; echo "$(uname -m 2>/dev/null)")
echo "$COMMAND_RESULT" | grep -q "[Uu]buntu 22\.*"
OS_MATCH=$?
echo "$COMMAND_RESULT" | grep -q "x86_64"
ARCH_MATCH=$?
if [[ $OS_MATCH -eq "0" && $ARCH_MATCH -eq "0" ]]; then
  dpkg --force-all -i ./taniumclient_7.6.4.2106-ubuntu22_amd64.deb
  if [[ "$?" -eq "0" ]]; then
    echo "Installation successful. Copying tanium-init.dat."
    cp ./tanium-init.dat /opt/Tanium/TaniumClient/
    echo "Starting service."
    systemctl start taniumclient
  else
    echo "Install failed."
    exit 1
  fi
  exit
fi
echo "Checking for rhel9-arm64"
COMMAND_RESULT=$(echo "$(uname -a 2>/dev/null)"; echo "$(test -f /etc/os-release -a -f /etc/redhat-release && grep -qi 'red hat' /etc/os-release && cat /etc/redhat-release 2>/dev/null)"; echo "$(test -f /etc/redhat-release -a ! -f /etc/enterprise-release -a ! -f /etc/oracle-release && cat /etc/redhat-release 2>/dev/null)"; echo "$(test -f /etc/issue && cat /etc/issue 2>/dev/null)"; echo "$(uname -m 2>/dev/null)")
echo "$COMMAND_RESULT" | grep -q "aarch64.*Red Hat Enterprise.*release[[:space:]]9.*"
OS_MATCH0=$?
echo "$COMMAND_RESULT" | grep -q "aarch.*RHEL[[:space:]]9.*"
OS_MATCH1=$?
if [ "$OS_MATCH0" = "0" ] || [ "$OS_MATCH1" = "0" ]; then OS_MATCH="0"; else OS_MATCH="1"; fi
if [[ $OS_MATCH -eq "0" ]]; then
  rpm -i ./TaniumClient-7.6.4.2106-1.rhe9.aarch64.rpm
  if [[ "$?" -eq "0" ]]; then
    echo "Installation successful. Copying tanium-init.dat."
    cp ./tanium-init.dat /opt/Tanium/TaniumClient/
    echo "Starting service."
    systemctl start taniumclient
  else
    echo "Install failed."
    exit 1
  fi
  exit
fi
echo "Checking for amazon2023-arm"
COMMAND_RESULT=$(echo "$(uname -a 2>/dev/null)"; echo "$(test -f /etc/os-release && cat /etc/os-release 2>/dev/null)"; echo "$(uname -m 2>/dev/null)")
echo "$COMMAND_RESULT" | grep -q "amzn2023\.aarch64"
OS_MATCH=$?
if [[ $OS_MATCH -eq "0" ]]; then
  rpm -i ./TaniumClient-7.6.4.2106-1.amzn2023.0.20230503.aarch64.rpm
  if [[ "$?" -eq "0" ]]; then
    echo "Installation successful. Copying tanium-init.dat."
    cp ./tanium-init.dat /opt/Tanium/TaniumClient/
    echo "Starting service."
    service taniumclient start
  else
    echo "Install failed."
    exit 1
  fi
  exit
fi
echo "Checking for debian9-x86"
COMMAND_RESULT=$(echo "$(uname -a 2>/dev/null)"; echo "$(test -f /etc/debian_version && cat /etc/debian_version 2>/dev/null)"; echo "$(test -f /etc/lsb-release && cat /etc/lsb-release 2>/dev/null)"; echo "$(test -f /etc/issue && cat /etc/issue 2>/dev/null)"; echo "$(uname -m 2>/dev/null)")
echo "$COMMAND_RESULT" | grep -q "Debian GNU/Linux 9 "
OS_MATCH=$?
echo "$COMMAND_RESULT" | grep -q "i686"
ARCH_MATCH=$?
if [[ $OS_MATCH -eq "0" && $ARCH_MATCH -eq "0" ]]; then
  dpkg --force-all -i ./taniumclient_7.6.4.2106-debian9_i386.deb
  if [[ "$?" -eq "0" ]]; then
    echo "Installation successful. Copying tanium-init.dat."
    cp ./tanium-init.dat /opt/Tanium/TaniumClient/
    echo "Starting service."
    systemctl start taniumclient
  else
    echo "Install failed."
    exit 1
  fi
  exit
fi
echo "Checking for ubuntu14-x64"
COMMAND_RESULT=$(echo "$(uname -a 2>/dev/null)"; echo "$(test -f /etc/lsb-release && cat /etc/lsb-release 2>/dev/null)"; echo "$(test -f /etc/issue && cat /etc/issue 2>/dev/null)"; echo "$(uname -m 2>/dev/null)")
echo "$COMMAND_RESULT" | grep -q "[Uu]buntu 14\."
OS_MATCH=$?
echo "$COMMAND_RESULT" | grep -q "x86_64"
ARCH_MATCH=$?
if [[ $OS_MATCH -eq "0" && $ARCH_MATCH -eq "0" ]]; then
  dpkg --force-all -i ./taniumclient_7.6.4.2106-ubuntu14_amd64.deb
  if [[ "$?" -eq "0" ]]; then
    echo "Installation successful. Copying tanium-init.dat."
    cp ./tanium-init.dat /opt/Tanium/TaniumClient/
    echo "Starting service."
    service taniumclient start
  else
    echo "Install failed."
    exit 1
  fi
  exit
fi
echo "Checking for oracle8-x64"
COMMAND_RESULT=$(echo "$(uname -a 2>/dev/null)"; echo "$(test -f /etc/lsb-release && cat /etc/lsb-release 2>/dev/null)"; echo "$(test -f /etc/oracle-release && cat /etc/oracle-release 2>/dev/null)"; echo "$(test -f /etc/issue && cat /etc/issue 2>/dev/null)"; echo "$(uname -m 2>/dev/null)")
echo "$COMMAND_RESULT" | grep -q "Oracle Linux Server release 8.*"
OS_MATCH=$?
echo "$COMMAND_RESULT" | grep -q "x86_64"
ARCH_MATCH=$?
if [[ $OS_MATCH -eq "0" && $ARCH_MATCH -eq "0" ]]; then
  rpm -i ./TaniumClient-7.6.4.2106-1.oel8.x86_64.rpm
  if [[ "$?" -eq "0" ]]; then
    echo "Installation successful. Copying tanium-init.dat."
    cp ./tanium-init.dat /opt/Tanium/TaniumClient/
    echo "Starting service."
    systemctl start taniumclient.service
  else
    echo "Install failed."
    exit 1
  fi
  exit
fi
echo "Checking for oracle6-x64"
COMMAND_RESULT=$(echo "$(uname -a 2>/dev/null)"; echo "$(test -f /etc/lsb-release && cat /etc/lsb-release 2>/dev/null)"; echo "$(test -f /etc/oracle-release && cat /etc/oracle-release 2>/dev/null)"; echo "$(test -f /etc/issue && cat /etc/issue 2>/dev/null)"; echo "$(uname -m 2>/dev/null)")
echo "$COMMAND_RESULT" | grep -q "Oracle Linux Server release 6.*"
OS_MATCH=$?
echo "$COMMAND_RESULT" | grep -q "x86_64"
ARCH_MATCH=$?
if [[ $OS_MATCH -eq "0" && $ARCH_MATCH -eq "0" ]]; then
  rpm -i ./TaniumClient-7.6.4.2106-1.oel6.x86_64.rpm
  if [[ "$?" -eq "0" ]]; then
    echo "Installation successful. Copying tanium-init.dat."
    cp ./tanium-init.dat /opt/Tanium/TaniumClient/
    echo "Starting service."
    service TaniumClient start
  else
    echo "Install failed."
    exit 1
  fi
  exit
fi
echo "Checking for debian11-x64"
COMMAND_RESULT=$(echo "$(uname -a 2>/dev/null)"; echo "$(test -f /etc/os-release && cat /etc/os-release 2>/dev/null)"; echo "$(lsb_release -d 2>/dev/null)"; echo "$(uname -m 2>/dev/null)")
echo "$COMMAND_RESULT" | grep -q "Debian GNU/Linux 11 "
OS_MATCH=$?
echo "$COMMAND_RESULT" | grep -q "x86_64"
ARCH_MATCH=$?
if [[ $OS_MATCH -eq "0" && $ARCH_MATCH -eq "0" ]]; then
  dpkg --force-all -i ./taniumclient_7.6.4.2106-debian11_amd64.deb
  if [[ "$?" -eq "0" ]]; then
    echo "Installation successful. Copying tanium-init.dat."
    cp ./tanium-init.dat /opt/Tanium/TaniumClient/
    echo "Starting service."
    systemctl start taniumclient
  else
    echo "Install failed."
    exit 1
  fi
  exit
fi
echo "Checking for ubuntu18-x64"
COMMAND_RESULT=$(echo "$(uname -a 2>/dev/null)"; echo "$(test -f /etc/lsb-release && cat /etc/lsb-release 2>/dev/null)"; echo "$(test -f /etc/issue && cat /etc/issue 2>/dev/null)"; echo "$(uname -m 2>/dev/null)")
echo "$COMMAND_RESULT" | grep -q "[Uu]buntu 18\."
OS_MATCH=$?
echo "$COMMAND_RESULT" | grep -q "x86_64"
ARCH_MATCH=$?
if [[ $OS_MATCH -eq "0" && $ARCH_MATCH -eq "0" ]]; then
  dpkg --force-all -i ./taniumclient_7.6.4.2106-ubuntu18_amd64.deb
  if [[ "$?" -eq "0" ]]; then
    echo "Installation successful. Copying tanium-init.dat."
    cp ./tanium-init.dat /opt/Tanium/TaniumClient/
    echo "Starting service."
    systemctl start taniumclient
  else
    echo "Install failed."
    exit 1
  fi
  exit
fi
echo "Checking for opensuse12-x64"
COMMAND_RESULT=$(echo "$(cat /etc/os-release 2>/dev/null)"; echo "$(uname -m 2>/dev/null)")
echo "$COMMAND_RESULT" | grep -q "openSUSE 12.*"
OS_MATCH=$?
echo "$COMMAND_RESULT" | grep -q "x86_64"
ARCH_MATCH=$?
if [[ $OS_MATCH -eq "0" && $ARCH_MATCH -eq "0" ]]; then
  rpm -i ./TaniumClient-7.6.4.2106-1.sle12.x86_64.rpm
  if [[ "$?" -eq "0" ]]; then
    echo "Installation successful. Copying tanium-init.dat."
    cp ./tanium-init.dat /opt/Tanium/TaniumClient/
    echo "Starting service."
    systemctl start taniumclient.service
  else
    echo "Install failed."
    exit 1
  fi
  exit
fi
echo "Checking for sles12-x64"
COMMAND_RESULT=$(echo "$(cat /etc/os-release 2>/dev/null)"; echo "$(uname -m 2>/dev/null)")
echo "$COMMAND_RESULT" | grep -q "SUSE Linux Enterprise .* 12"
OS_MATCH=$?
echo "$COMMAND_RESULT" | grep -q "x86_64"
ARCH_MATCH=$?
if [[ $OS_MATCH -eq "0" && $ARCH_MATCH -eq "0" ]]; then
  rpm -i ./TaniumClient-7.6.4.2106-1.sle12.x86_64.rpm
  if [[ "$?" -eq "0" ]]; then
    echo "Installation successful. Copying tanium-init.dat."
    cp ./tanium-init.dat /opt/Tanium/TaniumClient/
    echo "Starting service."
    systemctl start taniumclient.service
  else
    echo "Install failed."
    exit 1
  fi
  exit
fi
echo "Checking for debian8-x86"
COMMAND_RESULT=$(echo "$(uname -a 2>/dev/null)"; echo "$(test -f /etc/debian_version && cat /etc/debian_version 2>/dev/null)"; echo "$(test -f /etc/lsb-release && cat /etc/lsb-release 2>/dev/null)"; echo "$(test -f /etc/issue && cat /etc/issue 2>/dev/null)"; echo "$(uname -m 2>/dev/null)")
echo "$COMMAND_RESULT" | grep -q "Debian GNU/Linux 8 "
OS_MATCH=$?
echo "$COMMAND_RESULT" | grep -q "i686"
ARCH_MATCH=$?
if [[ $OS_MATCH -eq "0" && $ARCH_MATCH -eq "0" ]]; then
  dpkg --force-all -i ./taniumclient_7.6.4.2106-debian8_i386.deb
  if [[ "$?" -eq "0" ]]; then
    echo "Installation successful. Copying tanium-init.dat."
    cp ./tanium-init.dat /opt/Tanium/TaniumClient/
    echo "Starting service."
    systemctl start taniumclient
  else
    echo "Install failed."
    exit 1
  fi
  exit
fi
echo "Checking for oracle8-arm64"
COMMAND_RESULT=$(echo "$(uname -a 2>/dev/null)"; echo "$(test -f /etc/lsb-release && cat /etc/lsb-release 2>/dev/null)"; echo "$(test -f /etc/oracle-release && cat /etc/oracle-release 2>/dev/null)"; echo "$(test -f /etc/issue && cat /etc/issue 2>/dev/null)"; echo "$(uname -m 2>/dev/null)")
echo "$COMMAND_RESULT" | grep -q "Oracle Linux Server release 8.*aarch64"
OS_MATCH=$?
if [[ $OS_MATCH -eq "0" ]]; then
  rpm -i ./TaniumClient-7.6.4.2106-1.oel8.aarch64.rpm
  if [[ "$?" -eq "0" ]]; then
    echo "Installation successful. Copying tanium-init.dat."
    cp ./tanium-init.dat /opt/Tanium/TaniumClient/
    echo "Starting service."
    systemctl start taniumclient.service
  else
    echo "Install failed."
    exit 1
  fi
  exit
fi
echo "Checking for amazon1-x64"
COMMAND_RESULT=$(echo "$(uname -a 2>/dev/null)"; echo "$(test -f /etc/os-release && cat /etc/os-release 2>/dev/null)"; echo "$(test -f /etc/issue && cat /etc/issue 2>/dev/null)"; echo "$(uname -m 2>/dev/null)")
echo "$COMMAND_RESULT" | grep -q "Amazon Linux AMI 201.*"
OS_MATCH=$?
echo "$COMMAND_RESULT" | grep -q "x86_64"
ARCH_MATCH=$?
if [[ $OS_MATCH -eq "0" && $ARCH_MATCH -eq "0" ]]; then
  rpm -i ./TaniumClient-7.6.4.2106-1.amzn2018.03.x86_64.rpm
  if [[ "$?" -eq "0" ]]; then
    echo "Installation successful. Copying tanium-init.dat."
    cp ./tanium-init.dat /opt/Tanium/TaniumClient/
    echo "Starting service."
    service TaniumClient start
  else
    echo "Install failed."
    exit 1
  fi
  exit
fi
echo "Checking for centos5-x64"
COMMAND_RESULT=$(echo "$(uname -a 2>/dev/null)"; echo "$(test -f /etc/os-release -a -f /etc/redhat-release && grep -qi 'centos' /etc/os-release && cat /etc/redhat-release 2>/dev/null)"; echo "$(test -f /etc/redhat-release -a ! -f /etc/enterprise-release && cat /etc/redhat-release 2>/dev/null)"; echo "$(test -f /etc/issue && cat /etc/issue 2>/dev/null)"; echo "$(uname -m 2>/dev/null)")
echo "$COMMAND_RESULT" | grep -q "CentOS .*release[[:space:]]5.*"
OS_MATCH=$?
echo "$COMMAND_RESULT" | grep -q "x86_64"
ARCH_MATCH=$?
if [[ $OS_MATCH -eq "0" && $ARCH_MATCH -eq "0" ]]; then
  rpm -i ./TaniumClient-7.6.4.2106-1.rhe5.x86_64.rpm
  if [[ "$?" -eq "0" ]]; then
    echo "Installation successful. Copying tanium-init.dat."
    cp ./tanium-init.dat /opt/Tanium/TaniumClient/
    echo "Starting service."
    /sbin/service TaniumClient start
  else
    echo "Install failed."
    exit 1
  fi
  exit
fi
echo "Checking for rhel5-x64"
COMMAND_RESULT=$(echo "$(uname -a 2>/dev/null)"; echo "$(test -f /etc/os-release -a -f /etc/redhat-release && grep -qi 'red hat' /etc/os-release && cat /etc/redhat-release 2>/dev/null)"; echo "$(test -f /etc/redhat-release -a ! -f /etc/enterprise-release -a ! -f /etc/oracle-release && cat /etc/redhat-release 2>/dev/null)"; echo "$(test -f /etc/issue && cat /etc/issue 2>/dev/null)"; echo "$(uname -m 2>/dev/null)")
echo "$COMMAND_RESULT" | grep -q "Red Hat Enterprise.*release[[:space:]]5.*"
OS_MATCH0=$?
echo "$COMMAND_RESULT" | grep -q "RHEL[[:space:]]5.*"
OS_MATCH1=$?
if [ "$OS_MATCH0" = "0" ] || [ "$OS_MATCH1" = "0" ]; then OS_MATCH="0"; else OS_MATCH="1"; fi
echo "$COMMAND_RESULT" | grep -q "x86_64"
ARCH_MATCH=$?
if [[ $OS_MATCH -eq "0" && $ARCH_MATCH -eq "0" ]]; then
  rpm -i ./TaniumClient-7.6.4.2106-1.rhe5.x86_64.rpm
  if [[ "$?" -eq "0" ]]; then
    echo "Installation successful. Copying tanium-init.dat."
    cp ./tanium-init.dat /opt/Tanium/TaniumClient/
    echo "Starting service."
    /sbin/service TaniumClient start
  else
    echo "Install failed."
    exit 1
  fi
  exit
fi
echo "Checking for rhel6-x64"
COMMAND_RESULT=$(echo "$(uname -a 2>/dev/null)"; echo "$(test -f /etc/os-release -a -f /etc/redhat-release && grep -qi 'red hat' /etc/os-release && cat /etc/redhat-release 2>/dev/null)"; echo "$(test -f /etc/redhat-release -a ! -f /etc/enterprise-release -a ! -f /etc/oracle-release && cat /etc/redhat-release 2>/dev/null)"; echo "$(test -f /etc/issue && cat /etc/issue 2>/dev/null)"; echo "$(uname -m 2>/dev/null)")
echo "$COMMAND_RESULT" | grep -q "Red Hat Enterprise.*release[[:space:]]6.*"
OS_MATCH0=$?
echo "$COMMAND_RESULT" | grep -q "RHEL[[:space:]]6.*"
OS_MATCH1=$?
if [ "$OS_MATCH0" = "0" ] || [ "$OS_MATCH1" = "0" ]; then OS_MATCH="0"; else OS_MATCH="1"; fi
echo "$COMMAND_RESULT" | grep -q "x86_64"
ARCH_MATCH=$?
if [[ $OS_MATCH -eq "0" && $ARCH_MATCH -eq "0" ]]; then
  rpm -i ./TaniumClient-7.6.4.2106-1.rhe6.x86_64.rpm
  if [[ "$?" -eq "0" ]]; then
    echo "Installation successful. Copying tanium-init.dat."
    cp ./tanium-init.dat /opt/Tanium/TaniumClient/
    echo "Starting service."
    /sbin/service TaniumClient start
  else
    echo "Install failed."
    exit 1
  fi
  exit
fi
echo "Checking for centos6-x64"
COMMAND_RESULT=$(echo "$(uname -a 2>/dev/null)"; echo "$(test -f /etc/os-release -a -f /etc/redhat-release && grep -qi 'centos' /etc/os-release && cat /etc/redhat-release 2>/dev/null)"; echo "$(test -f /etc/centos-release && cat /etc/centos-release 2>/dev/null)"; echo "$(test -f /etc/issue && cat /etc/issue 2>/dev/null)"; echo "$(uname -m 2>/dev/null)")
echo "$COMMAND_RESULT" | grep -q "CentOS .*release[[:space:]]6.*"
OS_MATCH=$?
echo "$COMMAND_RESULT" | grep -q "x86_64"
ARCH_MATCH=$?
if [[ $OS_MATCH -eq "0" && $ARCH_MATCH -eq "0" ]]; then
  rpm -i ./TaniumClient-7.6.4.2106-1.rhe6.x86_64.rpm
  if [[ "$?" -eq "0" ]]; then
    echo "Installation successful. Copying tanium-init.dat."
    cp ./tanium-init.dat /opt/Tanium/TaniumClient/
    echo "Starting service."
    /sbin/service TaniumClient start
  else
    echo "Install failed."
    exit 1
  fi
  exit
fi
echo "Checking for oracle9-arm64"
COMMAND_RESULT=$(echo "$(uname -a 2>/dev/null)"; echo "$(test -f /etc/lsb-release && cat /etc/lsb-release 2>/dev/null)"; echo "$(test -f /etc/oracle-release && cat /etc/oracle-release 2>/dev/null)"; echo "$(test -f /etc/issue && cat /etc/issue 2>/dev/null)"; echo "$(uname -m 2>/dev/null)")
echo "$COMMAND_RESULT" | grep -q "Oracle Linux Server release 9.*aarch64"
OS_MATCH=$?
if [[ $OS_MATCH -eq "0" ]]; then
  rpm -i ./TaniumClient-7.6.4.2106-1.oel9.aarch64.rpm
  if [[ "$?" -eq "0" ]]; then
    echo "Installation successful. Copying tanium-init.dat."
    cp ./tanium-init.dat /opt/Tanium/TaniumClient/
    echo "Starting service."
    systemctl start taniumclient.service
  else
    echo "Install failed."
    exit 1
  fi
  exit
fi
echo "Checking for oracle9-x64"
COMMAND_RESULT=$(echo "$(uname -a 2>/dev/null)"; echo "$(test -f /etc/lsb-release && cat /etc/lsb-release 2>/dev/null)"; echo "$(test -f /etc/oracle-release && cat /etc/oracle-release 2>/dev/null)"; echo "$(test -f /etc/issue && cat /etc/issue 2>/dev/null)"; echo "$(uname -m 2>/dev/null)")
echo "$COMMAND_RESULT" | grep -q "Oracle Linux Server release 9.*"
OS_MATCH=$?
echo "$COMMAND_RESULT" | grep -q "x86_64"
ARCH_MATCH=$?
if [[ $OS_MATCH -eq "0" && $ARCH_MATCH -eq "0" ]]; then
  rpm -i ./TaniumClient-7.6.4.2106-1.oel9.x86_64.rpm
  if [[ "$?" -eq "0" ]]; then
    echo "Installation successful. Copying tanium-init.dat."
    cp ./tanium-init.dat /opt/Tanium/TaniumClient/
    echo "Starting service."
    systemctl start taniumclient.service
  else
    echo "Install failed."
    exit 1
  fi
  exit
fi
echo "Checking for ubuntu24-arm64"
COMMAND_RESULT=$(echo "$(uname -a 2>/dev/null)"; echo "$(test -f /etc/lsb-release && cat /etc/lsb-release 2>/dev/null)"; echo "$(uname -m 2>/dev/null)")
echo "$COMMAND_RESULT" | grep -q "[Uu]buntu 24\.*"
OS_MATCH=$?
echo "$COMMAND_RESULT" | grep -q "aarch64"
ARCH_MATCH=$?
if [[ $OS_MATCH -eq "0" && $ARCH_MATCH -eq "0" ]]; then
  dpkg --force-all -i ./taniumclient_7.6.4.2106-ubuntu24_arm64.deb
  if [[ "$?" -eq "0" ]]; then
    echo "Installation successful. Copying tanium-init.dat."
    cp ./tanium-init.dat /opt/Tanium/TaniumClient/
    echo "Starting service."
    systemctl start taniumclient
  else
    echo "Install failed."
    exit 1
  fi
  exit
fi
echo "Checking for rhel8-arm64"
COMMAND_RESULT=$(echo "$(uname -a 2>/dev/null)"; echo "$(test -f /etc/os-release -a -f /etc/redhat-release && grep -qi 'red hat' /etc/os-release && cat /etc/redhat-release 2>/dev/null)"; echo "$(test -f /etc/redhat-release -a ! -f /etc/enterprise-release -a ! -f /etc/oracle-release && cat /etc/redhat-release 2>/dev/null)"; echo "$(test -f /etc/issue && cat /etc/issue 2>/dev/null)"; echo "$(uname -m 2>/dev/null)")
echo "$COMMAND_RESULT" | grep -q "aarch64.*Red Hat Enterprise.*release[[:space:]]8.*"
OS_MATCH0=$?
echo "$COMMAND_RESULT" | grep -q "aarch64.*RHEL[[:space:]]8.*"
OS_MATCH1=$?
if [ "$OS_MATCH0" = "0" ] || [ "$OS_MATCH1" = "0" ]; then OS_MATCH="0"; else OS_MATCH="1"; fi
if [[ $OS_MATCH -eq "0" ]]; then
  rpm -i ./TaniumClient-7.6.4.2106-1.rhe8.aarch64.rpm
  if [[ "$?" -eq "0" ]]; then
    echo "Installation successful. Copying tanium-init.dat."
    cp ./tanium-init.dat /opt/Tanium/TaniumClient/
    echo "Starting service."
    systemctl start taniumclient
  else
    echo "Install failed."
    exit 1
  fi
  exit
fi
echo "Checking for opensuse12-x86"
COMMAND_RESULT=$(echo "$(cat /etc/os-release 2>/dev/null)"; echo "$(uname -m 2>/dev/null)")
echo "$COMMAND_RESULT" | grep -q "openSUSE 12.*"
OS_MATCH=$?
echo "$COMMAND_RESULT" | grep -q "i686"
ARCH_MATCH=$?
if [[ $OS_MATCH -eq "0" && $ARCH_MATCH -eq "0" ]]; then
  rpm -i ./TaniumClient-7.6.4.2106-1.sle12.i586.rpm
  if [[ "$?" -eq "0" ]]; then
    echo "Installation successful. Copying tanium-init.dat."
    cp ./tanium-init.dat /opt/Tanium/TaniumClient/
    echo "Starting service."
    systemctl start taniumclient.service
  else
    echo "Install failed."
    exit 1
  fi
  exit
fi
echo "Checking for sles12-x86"
COMMAND_RESULT=$(echo "$(cat /etc/os-release 2>/dev/null)"; echo "$(uname -m 2>/dev/null)")
echo "$COMMAND_RESULT" | grep -q "SUSE Linux Enterprise .* 12"
OS_MATCH=$?
echo "$COMMAND_RESULT" | grep -q "i686"
ARCH_MATCH=$?
if [[ $OS_MATCH -eq "0" && $ARCH_MATCH -eq "0" ]]; then
  rpm -i ./TaniumClient-7.6.4.2106-1.sle12.i586.rpm
  if [[ "$?" -eq "0" ]]; then
    echo "Installation successful. Copying tanium-init.dat."
    cp ./tanium-init.dat /opt/Tanium/TaniumClient/
    echo "Starting service."
    systemctl start taniumclient.service
  else
    echo "Install failed."
    exit 1
  fi
  exit
fi
echo "Checking for debian9-x64"
COMMAND_RESULT=$(echo "$(uname -a 2>/dev/null)"; echo "$(test -f /etc/debian_version && cat /etc/debian_version 2>/dev/null)"; echo "$(test -f /etc/lsb-release && cat /etc/lsb-release 2>/dev/null)"; echo "$(test -f /etc/issue && cat /etc/issue 2>/dev/null)"; echo "$(uname -m 2>/dev/null)")
echo "$COMMAND_RESULT" | grep -q "Debian GNU/Linux 9 "
OS_MATCH=$?
echo "$COMMAND_RESULT" | grep -q "x86_64"
ARCH_MATCH=$?
if [[ $OS_MATCH -eq "0" && $ARCH_MATCH -eq "0" ]]; then
  dpkg --force-all -i ./taniumclient_7.6.4.2106-debian9_amd64.deb
  if [[ "$?" -eq "0" ]]; then
    echo "Installation successful. Copying tanium-init.dat."
    cp ./tanium-init.dat /opt/Tanium/TaniumClient/
    echo "Starting service."
    systemctl start taniumclient
  else
    echo "Install failed."
    exit 1
  fi
  exit
fi
echo "Checking for oracle6-x86"
COMMAND_RESULT=$(echo "$(uname -a 2>/dev/null)"; echo "$(test -f /etc/lsb-release && cat /etc/lsb-release 2>/dev/null)"; echo "$(test -f /etc/oracle-release && cat /etc/oracle-release 2>/dev/null)"; echo "$(test -f /etc/issue && cat /etc/issue 2>/dev/null)"; echo "$(uname -m 2>/dev/null)")
echo "$COMMAND_RESULT" | grep -q "Oracle Linux Server release 6.*"
OS_MATCH=$?
echo "$COMMAND_RESULT" | grep -q "i686"
ARCH_MATCH=$?
if [[ $OS_MATCH -eq "0" && $ARCH_MATCH -eq "0" ]]; then
  rpm -i ./TaniumClient-7.6.4.2106-1.oel6.i686.rpm
  if [[ "$?" -eq "0" ]]; then
    echo "Installation successful. Copying tanium-init.dat."
    cp ./tanium-init.dat /opt/Tanium/TaniumClient/
    echo "Starting service."
    service TaniumClient start
  else
    echo "Install failed."
    exit 1
  fi
  exit
fi
echo "Checking for debian8-x64"
COMMAND_RESULT=$(echo "$(uname -a 2>/dev/null)"; echo "$(test -f /etc/debian_version && cat /etc/debian_version 2>/dev/null)"; echo "$(test -f /etc/lsb-release && cat /etc/lsb-release 2>/dev/null)"; echo "$(test -f /etc/issue && cat /etc/issue 2>/dev/null)"; echo "$(uname -m 2>/dev/null)")
echo "$COMMAND_RESULT" | grep -q "Debian GNU/Linux 8 "
OS_MATCH=$?
echo "$COMMAND_RESULT" | grep -q "x86_64"
ARCH_MATCH=$?
if [[ $OS_MATCH -eq "0" && $ARCH_MATCH -eq "0" ]]; then
  dpkg --force-all -i ./taniumclient_7.6.4.2106-debian8_amd64.deb
  if [[ "$?" -eq "0" ]]; then
    echo "Installation successful. Copying tanium-init.dat."
    cp ./tanium-init.dat /opt/Tanium/TaniumClient/
    echo "Starting service."
    systemctl start taniumclient
  else
    echo "Install failed."
    exit 1
  fi
  exit
fi
echo "Checking for oracle5-x86"
COMMAND_RESULT=$(echo "$(test -f /etc/redhat-release -a ! -f /etc/enterprise-release && cat /etc/redhat-release 2>/dev/null)"; echo "$(test -f /etc/enterprise-release && cat /etc/enterprise-release 2>/dev/null)"; echo "$(uname -m 2>/dev/null)")
echo "$COMMAND_RESULT" | grep -q "Enterprise Linux Server release 5.*"
OS_MATCH=$?
echo "$COMMAND_RESULT" | grep -q "i686"
ARCH_MATCH=$?
if [[ $OS_MATCH -eq "0" && $ARCH_MATCH -eq "0" ]]; then
  rpm -i ./TaniumClient-7.6.4.2106-1.oel5.i386.rpm
  if [[ "$?" -eq "0" ]]; then
    echo "Installation successful. Copying tanium-init.dat."
    cp ./tanium-init.dat /opt/Tanium/TaniumClient/
    echo "Starting service."
    service TaniumClient start
  else
    echo "Install failed."
    exit 1
  fi
  exit
fi
echo "Checking for debian12-x64"
COMMAND_RESULT=$(echo "$(uname -a 2>/dev/null)"; echo "$(test -f /etc/os-release && cat /etc/os-release 2>/dev/null)"; echo "$(lsb_release -d 2>/dev/null)"; echo "$(uname -m 2>/dev/null)")
echo "$COMMAND_RESULT" | grep -q "Debian GNU/Linux 12 "
OS_MATCH=$?
echo "$COMMAND_RESULT" | grep -q "x86_64"
ARCH_MATCH=$?
if [[ $OS_MATCH -eq "0" && $ARCH_MATCH -eq "0" ]]; then
  dpkg --force-all -i ./taniumclient_7.6.4.2106-debian12_amd64.deb
  if [[ "$?" -eq "0" ]]; then
    echo "Installation successful. Copying tanium-init.dat."
    cp ./tanium-init.dat /opt/Tanium/TaniumClient/
    echo "Starting service."
    systemctl start taniumclient
  else
    echo "Install failed."
    exit 1
  fi
  exit
fi
echo "Checking for amazon2-arm"
COMMAND_RESULT=$(echo "$(uname -a 2>/dev/null)"; echo "$(test -f /etc/os-release && cat /etc/os-release 2>/dev/null)"; echo "$(test -f /etc/issue && cat /etc/issue 2>/dev/null)"; echo "$(uname -m 2>/dev/null)")
echo "$COMMAND_RESULT" | grep -q "amzn2\.aarch64"
OS_MATCH=$?
if [[ $OS_MATCH -eq "0" ]]; then
  rpm -i ./TaniumClient-7.6.4.2106-1.amzn2.aarch64.rpm
  if [[ "$?" -eq "0" ]]; then
    echo "Installation successful. Copying tanium-init.dat."
    cp ./tanium-init.dat /opt/Tanium/TaniumClient/
    echo "Starting service."
    service taniumclient start
  else
    echo "Install failed."
    exit 1
  fi
  exit
fi
echo "Checking for oracle7-x64"
COMMAND_RESULT=$(echo "$(uname -a 2>/dev/null)"; echo "$(test -f /etc/lsb-release && cat /etc/lsb-release 2>/dev/null)"; echo "$(test -f /etc/oracle-release && cat /etc/oracle-release 2>/dev/null)"; echo "$(test -f /etc/issue && cat /etc/issue 2>/dev/null)"; echo "$(uname -m 2>/dev/null)")
echo "$COMMAND_RESULT" | grep -q "Oracle Linux Server release 7.*"
OS_MATCH=$?
echo "$COMMAND_RESULT" | grep -q "x86_64"
ARCH_MATCH=$?
if [[ $OS_MATCH -eq "0" && $ARCH_MATCH -eq "0" ]]; then
  rpm -i ./TaniumClient-7.6.4.2106-1.oel7.x86_64.rpm
  if [[ "$?" -eq "0" ]]; then
    echo "Installation successful. Copying tanium-init.dat."
    cp ./tanium-init.dat /opt/Tanium/TaniumClient/
    echo "Starting service."
    systemctl start taniumclient.service
  else
    echo "Install failed."
    exit 1
  fi
  exit
fi
echo "Checking for ubuntu22-arm64"
COMMAND_RESULT=$(echo "$(uname -a 2>/dev/null)"; echo "$(test -f /etc/lsb-release && cat /etc/lsb-release 2>/dev/null)"; echo "$(uname -m 2>/dev/null)")
echo "$COMMAND_RESULT" | grep -q "[Uu]buntu 22\.*"
OS_MATCH=$?
echo "$COMMAND_RESULT" | grep -q "aarch64"
ARCH_MATCH=$?
if [[ $OS_MATCH -eq "0" && $ARCH_MATCH -eq "0" ]]; then
  dpkg --force-all -i ./taniumclient_7.6.4.2106-ubuntu22_arm64.deb
  if [[ "$?" -eq "0" ]]; then
    echo "Installation successful. Copying tanium-init.dat."
    cp ./tanium-init.dat /opt/Tanium/TaniumClient/
    echo "Starting service."
    systemctl start taniumclient
  else
    echo "Install failed."
    exit 1
  fi
  exit
fi
echo "Checking for ubuntu24-x64"
COMMAND_RESULT=$(echo "$(uname -a 2>/dev/null)"; echo "$(test -f /etc/lsb-release && cat /etc/lsb-release 2>/dev/null)"; echo "$(uname -m 2>/dev/null)")
echo "$COMMAND_RESULT" | grep -q "[Uu]buntu 24\.*"
OS_MATCH=$?
echo "$COMMAND_RESULT" | grep -q "x86_64"
ARCH_MATCH=$?
if [[ $OS_MATCH -eq "0" && $ARCH_MATCH -eq "0" ]]; then
  dpkg --force-all -i ./taniumclient_7.6.4.2106-ubuntu24_amd64.deb
  if [[ "$?" -eq "0" ]]; then
    echo "Installation successful. Copying tanium-init.dat."
    cp ./tanium-init.dat /opt/Tanium/TaniumClient/
    echo "Starting service."
    systemctl start taniumclient
  else
    echo "Install failed."
    exit 1
  fi
  exit
fi
echo "Checking for centos6-x86"
COMMAND_RESULT=$(echo "$(uname -a 2>/dev/null)"; echo "$(test -f /etc/os-release -a -f /etc/redhat-release && grep -qi 'centos' /etc/os-release && cat /etc/redhat-release 2>/dev/null)"; echo "$(test -f /etc/centos-release && cat /etc/centos-release 2>/dev/null)"; echo "$(test -f /etc/issue && cat /etc/issue 2>/dev/null)"; echo "$(uname -m 2>/dev/null)")
echo "$COMMAND_RESULT" | grep -q "CentOS .*release[[:space:]]6.*"
OS_MATCH=$?
echo "$COMMAND_RESULT" | grep -q "i686"
ARCH_MATCH=$?
if [[ $OS_MATCH -eq "0" && $ARCH_MATCH -eq "0" ]]; then
  rpm -i ./TaniumClient-7.6.4.2106-1.rhe6.i686.rpm
  if [[ "$?" -eq "0" ]]; then
    echo "Installation successful. Copying tanium-init.dat."
    cp ./tanium-init.dat /opt/Tanium/TaniumClient/
    echo "Starting service."
    /sbin/service TaniumClient start
  else
    echo "Install failed."
    exit 1
  fi
  exit
fi
echo "Checking for rhel6-x86"
COMMAND_RESULT=$(echo "$(uname -a 2>/dev/null)"; echo "$(test -f /etc/os-release -a -f /etc/redhat-release && grep -qi 'red hat' /etc/os-release && cat /etc/redhat-release 2>/dev/null)"; echo "$(test -f /etc/redhat-release -a ! -f /etc/enterprise-release -a ! -f /etc/oracle-release && cat /etc/redhat-release 2>/dev/null)"; echo "$(test -f /etc/issue && cat /etc/issue 2>/dev/null)"; echo "$(uname -m 2>/dev/null)")
echo "$COMMAND_RESULT" | grep -q "Red Hat Enterprise.*release[[:space:]]6.*"
OS_MATCH0=$?
echo "$COMMAND_RESULT" | grep -q "RHEL[[:space:]]6.*"
OS_MATCH1=$?
if [ "$OS_MATCH0" = "0" ] || [ "$OS_MATCH1" = "0" ]; then OS_MATCH="0"; else OS_MATCH="1"; fi
echo "$COMMAND_RESULT" | grep -q "i686"
ARCH_MATCH=$?
if [[ $OS_MATCH -eq "0" && $ARCH_MATCH -eq "0" ]]; then
  rpm -i ./TaniumClient-7.6.4.2106-1.rhe6.i686.rpm
  if [[ "$?" -eq "0" ]]; then
    echo "Installation successful. Copying tanium-init.dat."
    cp ./tanium-init.dat /opt/Tanium/TaniumClient/
    echo "Starting service."
    /sbin/service TaniumClient start
  else
    echo "Install failed."
    exit 1
  fi
  exit
fi
echo "Checking for opensuse15-x64"
COMMAND_RESULT=$(echo "$(cat /etc/os-release 2>/dev/null)"; echo "$(uname -m 2>/dev/null)")
echo "$COMMAND_RESULT" | grep -q "openSUSE Leap 15.*"
OS_MATCH=$?
echo "$COMMAND_RESULT" | grep -q "x86_64"
ARCH_MATCH=$?
if [[ $OS_MATCH -eq "0" && $ARCH_MATCH -eq "0" ]]; then
  rpm -i ./TaniumClient-7.6.4.2106-1.sle15.x86_64.rpm
  if [[ "$?" -eq "0" ]]; then
    echo "Installation successful. Copying tanium-init.dat."
    cp ./tanium-init.dat /opt/Tanium/TaniumClient/
    echo "Starting service."
    systemctl start taniumclient.service
  else
    echo "Install failed."
    exit 1
  fi
  exit
fi
echo "Checking for sles15-x64"
COMMAND_RESULT=$(echo "$(cat /etc/os-release 2>/dev/null)"; echo "$(uname -m 2>/dev/null)")
echo "$COMMAND_RESULT" | grep -q "SUSE Linux Enterprise .* 15"
OS_MATCH=$?
echo "$COMMAND_RESULT" | grep -q "x86_64"
ARCH_MATCH=$?
if [[ $OS_MATCH -eq "0" && $ARCH_MATCH -eq "0" ]]; then
  rpm -i ./TaniumClient-7.6.4.2106-1.sle15.x86_64.rpm
  if [[ "$?" -eq "0" ]]; then
    echo "Installation successful. Copying tanium-init.dat."
    cp ./tanium-init.dat /opt/Tanium/TaniumClient/
    echo "Starting service."
    systemctl start taniumclient.service
  else
    echo "Install failed."
    exit 1
  fi
  exit
fi
echo "Checking for amazon2-x64"
COMMAND_RESULT=$(echo "$(uname -a 2>/dev/null)"; echo "$(test -f /etc/os-release && cat /etc/os-release 2>/dev/null)"; echo "$(test -f /etc/issue && cat /etc/issue 2>/dev/null)"; echo "$(uname -m 2>/dev/null)")
echo "$COMMAND_RESULT" | grep -q "Amazon Linux 2"
OS_MATCH=$?
echo "$COMMAND_RESULT" | grep -q "x86_64"
ARCH_MATCH=$?
if [[ $OS_MATCH -eq "0" && $ARCH_MATCH -eq "0" ]]; then
  rpm -i ./TaniumClient-7.6.4.2106-1.amzn2.x86_64.rpm
  if [[ "$?" -eq "0" ]]; then
    echo "Installation successful. Copying tanium-init.dat."
    cp ./tanium-init.dat /opt/Tanium/TaniumClient/
    echo "Starting service."
    service taniumclient start
  else
    echo "Install failed."
    exit 1
  fi
  exit
fi