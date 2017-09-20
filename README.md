# reproduce-puma-1287

## interesting files

* config.ru
* config/puma.rb

## setup

### terminal 1

```
vagrant up # provisioning will run, which will take a couple minutes
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
1. edit Gemfile to comment out puma 3.7.1 and activate puma 3.10.0
1. `bundle update puma` in one of the terminals
1. run `rails s` in terminal 1
1. run `curl http://0.0.0.0:3000` in terminal 2
1. observe incorrect behavior in both terminals
