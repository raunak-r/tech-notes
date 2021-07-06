# Stacer
The most recent version of Ubuntu supported by the PPA is disco, not focal. A solution is to go in the folder /etc/apt/sources.list.d and open the file called something similar to stacer.list
Inside the file, replace the string:
deb http://ppa.launchpad.net/oguzhaninan/stacer/ubuntu focal main
with
deb http://ppa.launchpad.net/oguzhaninan/stacer/ubuntu disco main
https://askubuntu.com/a/1240417
