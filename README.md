# Chef Solo Deployment Scripts

When using chef solo you need ruby and chef to be installed on the server in order to be run. These bash scripts install ruby and chef and run it on the given host.

## Getting started

The deploy.sh script packages this project (including cookbooks) and copies it to the host. Then it installs ruby and runs chef.

    ./deploy.sh your-hostname

Keep running deploy.sh when changing cookbooks.

## Configuration

I've added comments to deploy.sh and install.sh. You might have to change the scripts in case you are root or need sudo.

## Credits

Initial idea taken from the [opiniatedprogrammer.com](http://www.opinionatedprogrammer.com/2011/06/chef-solo-tutorial-managing-a-single-server-with-chef/) - great blog post!

Also found a lot of adaptions on github:
* https://github.com/pferdefleisch/vagrant-or-chef-solo-bootstrap
* https://github.com/kortina/spotify-jukebox-server
* https://github.com/map7/chef-solo
* https://github.com/pjungwir/illuminatedcomputing-chef-solo