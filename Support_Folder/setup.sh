echo "creating ssh key"
#ssh-keygen -t rsa

echo "installing Hadolint"
sudo wget -O /bin/hadolint https://github.com/hadolint/hadolint/releases/download/v1.16.3/hadolint-Linux-x86_64
sudo chmod +x /bin/hadolint

echo "installing circleCI"
curl -fLSs https://raw.githubusercontent.com/CircleCI-Public/circleci-cli/master/install.sh | sudo bash

echo "Installing Kubectl"
#curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl

curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
curl -LO "https://dl.k8s.io/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"
echo "$(cat kubectl.sha256)  kubectl" | sha256sum --check
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

echo "checking version : kubectl version --client"
kubectl version --client

echo "verify if system supports hyper-v virtualization"
sudo sysctl -a | grep machdep.cpu.features | grep VMX <----------------verify if system supports virtualizaion

echo "installing minikube"
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube

echo "Installing EKSCLI"
ARCH=amd64
PLATFORM=$(uname -s)_$ARCH
curl -sLO "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$PLATFORM.tar.gz"
curl -sL "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_checksums.txt" | grep $PLATFORM | sha256sum --check
tar -xzf eksctl_$PLATFORM.tar.gz -C /tmp && rm eksctl_$PLATFORM.tar.gz
sudo mv /tmp/eksctl /usr/local/bin

echo "fetching eksctl version"
eksctl version

echo "aws update version"
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install

echo "install prometheus client"
wget https://github.com/prometheus/prometheus/releases/download/v2.43.1/prometheus-2.43.1.linux-amd64.tar.gz
tar xvfz prometheus-2.43.1.linux-amd64.tar.gz
cd prometheus-2.43.1.linux-amd64


echo "create below token in git"
echo "================================================="
cat /home/ec2-user/.ssh/id_rsa.pub
echo "================================================="
echo "https://github.com/anshul-jain23/DevOps_Microservices"
