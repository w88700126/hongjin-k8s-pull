from w88700126/python-docker-environment
RUN yum -y install rsync subversion
ADD server /server/server
ADD shellrsync /server/shellrsync
ADD cmd /server/cmd
ADD rsync /etc
RUN chmod 600 /etc/rsyncd.secrets
RUN chmod 600 /etc/rsyncd.pass
