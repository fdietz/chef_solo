#!/bin/bash

json="${1}"

chef_solo=`which chef-solo`

function install_ruby_from_source {
  ruby_version="1.9.3-p327"

  # download ruby
  cd /tmp
  wget ftp://ftp.ruby-lang.org/pub/ruby/1.9/ruby-"$ruby_version".tar.gz
  tar -xvzf ruby-"$ruby_version".tar.gz
  
  # install ruby
  cd ruby-"$ruby_version"/
  ./configure --prefix=/usr/local
  make
  make install

  # install chef gem
  gem install chef --no-rdoc --no-ri
}

if ! test -f "$chef_solo"; then
  echo "chef-solo not found. Setup system..."  

  # upgrade all packages headerless
  aptitude update && apt-get -o Dpkg::Options::="--force-confnew" --force-yes -fuy dist-upgrade

  # install ruby requirements
  apt-get install -y curl build-essential openssl libreadline6 libreadline6-dev curl git-core zlib1g zlib1g-dev libssl-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt-dev autoconf libc6-dev ncurses-dev automake libtool bison

  install_ruby_from_source
  
  chef_solo=`which chef-solo`

  cd ~/chef
fi

# run chef solo
"$chef_solo" --config solo.rb --json-attributes "$json"