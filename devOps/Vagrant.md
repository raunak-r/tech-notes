## Setting Up A Server - Vagrant

Using Vagrant to Set Up a Test Server
```
If you’d prefer not to spend the money on a public cloud, I recommend you install Vagrant on your machine. Vagrant is an excellent open source tool for managing virtual machines. You can use Vagrant to boot a Linux virtual machine inside of your laptop, and we can use that as a test server.
```

Vagrant needs the VirtualBox virtualizer to be installed on your machine. Download VirtualBox and then download Vagrant.

#### Installation
```
> sudo apt-get install virtualbox
> sudo apt-get install vagrant
	> vagrant --version
	$ Vagrant 2.0.2

> In case of errors on WSL
	sudo dpkg-reconfigure virtualbox-dkms
	sudo dpkg-reconfigure virtualbox
	$ export VAGRANT_WSL_ENABLE_WINDOWS_ACCESS="1"
	$ export PATH="$PATH:/mnt/c/Program Files/Oracle/VirtualBox"

cd to the folder playbooks
> vagrant init ubuntu/trusty64
> vagrant up
```

```
# SSH into your VM by
> vagrant ssh 
# Output the SSH Connection Details
> vagrant ssh-config
```

```
The important lines are:
HostName 127.0.0.1
User vagrant
Port 2222
IdentityFile /Users/lorinhochstein/dev/ansiblebook/ch01/playbooks/.vagrant/
machines/default/virtualbox/private_key
```

Confirm that you can start an SSH session from the command line using this information.
In my case, the SSH command is:

```
$ ssh vagrant@127.0.0.1 -p 2222 -i /Users/lorinhochstein/dev/ansiblebook/ch01/
playbooks/.vagrant/machines/default/virtualbox/private_key
```