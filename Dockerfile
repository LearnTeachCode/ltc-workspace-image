FROM lscr.io/linuxserver/webtop:ubuntu-mate
USER root

######### Customize Container Here ###########

# copy over install_files/ for use in playbooks
ADD install_files $HOME/install_files

# install Ansible per 
# https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html#installing-ansible-on-ubuntu
RUN apt update && apt -y install software-properties-common && add-apt-repository --yes --update ppa:ansible/ansible && apt install -y ansible && rm -rf /var/lib/apt/lists/*

# run Ansible commands
COPY ./requirements.yaml ./playbook.yaml ./
RUN ansible-galaxy install -r requirements.yaml && ansible-playbook -i,localhost playbook.yaml --tags "all" && rm -f ./*.yaml

# Custom Desktop Background - replace bg_custom.png on disk with your own background image
COPY ./bg_fairy_penguins_1600x800.png /usr/share/backgrounds/bg_default.png

# clean up install_files/
RUN rm -rf $HOME/install_files/

######### End Customizations ###########

USER 1000
