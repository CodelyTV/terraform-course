# Do not use sudo if you are testing in a ubuntu docker

sudo apt-get update 
sudo apt-get install -y gnupg software-properties-common wget

echo "Download the signing key to a new keyring"
wget -O- https://apt.releases.hashicorp.com/gpg | \
    gpg --dearmor | \
    sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg

echo "Verify the key's fingerprint"
gpg --no-default-keyring --keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg --fingerprint

echo "Add the HashiCorp repo"
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list

echo "apt update"
sudo apt update

sudo apt install terraform

terraform --version