FROM accetto/ubuntu-vnc-xfce-g3:latest

# switch user to root for installing packages
USER root

# update apt
RUN apt update

# set environment variables for $HOME, $STARTUPDIR, and $INST_SCRIPTS
ENV HOME /home/headless
#ENV STARTUPDIR /dockerstartup
#ENV INST_SCRIPTS $STARTUPDIR/install

######### Customize Container Here ###########

# copy over install_files/ for use in playbooks
ADD install_files /home/headless/install_files

# Install sudo (required by Ansible)
RUN apt install -y sudo

# Install Pip and psycopg2 (required by Ansible)
RUN apt install -y python3-pip && pip install psycopg2-binary

# install Ansible per 
# https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html#installing-ansible-on-ubuntu
RUN apt update && apt -y install software-properties-common && add-apt-repository --yes --update ppa:ansible/ansible && apt install -y ansible && rm -rf /var/lib/apt/lists/*

# run Ansible commands
COPY ./requirements.yaml ./playbook.yaml ./
RUN ansible-galaxy install -r requirements.yaml && ansible-playbook -i,localhost playbook.yaml --tags "all" && rm -f ./*.yaml

# Custom Desktop Background - replace bg_custom.png on disk with your own background image
COPY ./bg_custom.png /usr/share/extra/backgrounds/bg_default.png

# clean up install_files/
RUN rm -rf /home/headless/install_files/

######### End Customizations ###########

# Remove install cache
RUN apt clean autoclean && apt autoremove -y && rm -rf /var/lib/{apt,dpkg,cache,log}/

# set permissions
#RUN chown 1001:0 $HOME
#RUN $STARTUPDIR/set_user_permission.sh $HOME

USER 1001
ENTRYPOINT [ "/usr/bin/tini", "--", "tail", "-f", "/dev/null" ]
