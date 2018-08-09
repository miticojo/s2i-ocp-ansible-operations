ARG OCP_VER=latest
FROM  docker.io/openshift/origin-ansible:$OCP_VER

MAINTAINER Giorgio Crivellari <gcrivell@redhat.com>


LABEL    io.k8s.description="Build OpenShift Operation Docker Images" \
         io.k8s.display-name="OpenShift Ansible-Container S2I Image" \
         io.openshift.tags="builder,ansible" \
         io.openshift.s2i.scripts-url=image:///usr/libexec/s2i \
         io.s2i.scripts-url=image:///usr/libexec/s2i

CMD      /usr/libexec/s2i/assemble

COPY     bin/  /usr/libexec/s2i/

USER     1001
