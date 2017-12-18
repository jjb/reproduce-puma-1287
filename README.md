# reproduce-puma-1287

## interesting files

* config.ru
* config/puma.rb

## setup

install vagrant: https://www.vagrantup.com/downloads.html

### terminal 1

```
vagrant up # will take several minutes if you don't have a xenial32 base box locally
vagrant ssh
cd /vagrant
bundle install
```

### terminal 2

```
vagrant ssh
```

## reproduction

1. run `rails s` in terminal 1
1. run `curl http://0.0.0.0:3000` in terminal 2
1. observe correct behavior in both terminals
1. `^c` out of `rails s` in terminal 1
1. edit Gemfile to comment out puma 3.7.1 and activate puma 3.11.0
1. `bundle update puma` in one of the terminals
1. run `rails s` in terminal 1
1. run `curl http://0.0.0.0:3000` in terminal 2
1. observe incorrect behavior in both terminals
