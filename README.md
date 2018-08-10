# s2i-ocp-ansible-operations

[![Codefresh build status]( https://g.codefresh.io/api/badges/pipeline/miticojo/miticojo%2Fs2i-ocp-ansible-operations%2Fs2i-ocp-ansible-operations?branch=master&key=eyJhbGciOiJIUzI1NiJ9.NTgxY2U5ZDEzMWQ4ZWYwMTAwMzg4ODAx.1bCEWtvg0QcZRXP3Jq4E9qw4QgAzETDgbF3dlLfUIIs&type=cf-1)]( https://g.codefresh.io/repositories/miticojo/s2i-ocp-ansible-operations/builds?filter=trigger:build;branch:master;service:5b6cd298aedcd08626ccbdb1~s2i-ocp-ansible-operations)

Ansible OpenShift Operation S2I Builder image of ansible-container.  
Just put your playboook in your Git repo and build with S2I.

## Import Template in OKD/Openshift
```
curl -s  https://raw.githubusercontent.com/miticojo/s2i-ocp-ansible-operations/master/openshift-template.yaml |  oc -n openshift apply -f openshift-template.yaml
```
run a playboook from template:
```
oc new-app  --template=s2i-ocp-ansible-operations --param=NAMESPACE=<your-namespace> --param=SOURCE_REPOSITORY_URL=<your-repo-url>
```

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
