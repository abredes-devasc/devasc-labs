# Run on VM to bootstrap Ansible server
 
# Configure /etc/hosts file
echo "" | sudo tee --append /etc/hosts 2> /dev/null && \
echo "# Host config for Ansible Server and Nodes" | sudo tee --append /etc/hosts 2> /dev/null && \
echo "192.168.69.5    ansible.local ansible" | sudo tee --append /etc/hosts 2> /dev/null && \
echo "192.168.69.10   server1.local  server1" | sudo tee --append /etc/hosts 2> /dev/null && \
echo "192.168.69.20   server2.local  server2" | sudo tee --append /etc/hosts 2> /dev/null

# Install Ansible
sudo apt-get update -yq && sudo apt-get upgrade -yq && \
sudo apt install software-properties-common
sudo apt-add-repository --yes --update ppa:ansible/ansible
sudo apt-get install -yq ansible sshpass