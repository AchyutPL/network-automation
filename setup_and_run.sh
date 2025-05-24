echo "Setting up network automation environment..."

# Install required packages
apt update
apt install -y ansible python3-pip git
pip3 install paramiko netmiko

# Install Ansible collections
ansible-galaxy collection install cisco.ios
