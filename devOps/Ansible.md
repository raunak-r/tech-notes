## Installation - Ansible
> sudo apt-get install ansible
> ansible --version

```
> sudo pip install ansible
```

If you’re not familiar with virtualenvs, you can use a newer tool called pipsi that will automatically install Ansible into a virtualenv for you:
```
$ wget https://raw.githubusercontent.com/mitsuhiko/pipsi/master/get-pipsi.py
$ python get-pipsi.py
$ pipsi install ansible
```

If you’ve installed with pipsi, and you wanted to install docker-py
(needed by the Ansible Docker modules) and boto (needed by the Ansible EC2 modules), you’d do it like this:
```
$ cd ~/.local/venvs/ansible
$ source bin/activate
$ pip install docker-py boto
```

If you’re feeling adventurous and want to use the bleeding-edge version of Ansible, you can grab the development branch from GitHub:
```
$ git clone https://github.com/ansible/ansible.git --recursive
```

If you’re running Ansible from the development branch, you’ll need to run these commands each time to set up your environment variables, including your PATH variable so that your shell knows where the ansible and ansible-playbooks programs are.
```
$ cd ./ansible
$ source ./hacking/env-setup
```

## Setting Up A Server - Vagrant

[Vagrant](#./Vagrant.md)