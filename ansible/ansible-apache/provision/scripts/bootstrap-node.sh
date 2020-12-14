# Configure /etc/hosts file
echo "" | sudo tee --append /etc/hosts 2> /dev/null && \
echo "# Host config for Ansible Server and Nodes" | sudo tee --append /etc/hosts 2> /dev/null && \
echo "192.168.69.5    ansible.local ansible" | sudo tee --append /etc/hosts 2> /dev/null && \
echo "192.168.69.10   server1.local  server1" | sudo tee --append /etc/hosts 2> /dev/null && \
echo "192.168.69.20   server2.local  server2" | sudo tee --append /etc/hosts 2> /dev/null

# Ansible user config
sudo useradd -m ansible
sudo usermod -aG sudo ansible
echo 'ansible:123456' | sudo chpasswd

# Root password
echo 'root:123456' | sudo chpasswd

# SSH Server password authentication
sudo sed -i 's/.*PermitRootLogin.*/PermitRootLogin yes/' /etc/ssh/sshd_config
sudo sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config
sudo systemctl restart sshd

# Python symlink
sudo ln -s /usr/bin/python3 /usr/bin/python