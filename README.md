# s2i-ocp-ansible-operations
Ansible OpenShift Operation S2I Builder image of ansible-container.  
Just put your playboook in your Git repo and build with S2I.

## Build S2I image
You can build base S2I image from local repository:

**Origin/OKD** base image:
```
git clone https://github.com/miticojo/s2i-ocp-ansible-operations.git
docker build -t s2i-ocp-ansible-operations:latest --build-arg OCP_VER=v3.9.31 .
```

**Red Hat OpenShift** image:
```
git clone https://github.com/miticojo/s2i-ocp-ansible-operations.git
docker build -t s2i-ocp-ansible-operations:latest --build-arg OCP_VER=v3.9.31 -f Dockerfile.rhel7 .
```

## S2I local usage
You can build final container image using S2I image from local repository (example):
```
git clone https://github.com/miticojo/s2i-ocp-ansible-operations.git
s2i build . --copy  --context-dir=example/ miticojo/s2i-ocp-ansible-operations:latest my-ocp-automation
```
or from your ansible git repo (example):
```
s2i build https://github.com/miticojo/s2i-ocp-ansible-operations.git  --context-dir=example/ miticojo/s2i-ocp-ansible-operations:latest my-ocp-automation
```
