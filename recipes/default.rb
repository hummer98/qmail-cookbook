#
# Cookbook Name:: qmail
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

log 'hello world'

# include yum::default
# 
# yum_repository "opensuse" do
#   url "http://download.opensuse.org/repositories/home:/weberho:/qmailtoaster/CentOS_5/home:weberho:qmailtoaster.repo"
#   action :add
# end

## group, usr, dir
#
directory '/var/qmail' do
  owner  'root'
  group  'root'
  mode   '0755'
  action :create
end

%w{ nofiles qmail }.each do |grp|
  group grp do
    group_name grp
    action     [:create]
  end
end

user 'alias' do
  comment  'alias'
  group    'nofiles'
  home     '/var/qmail/alias'
  shell    '/bin/false'
  password nil
  supports :manage_home => true
  action   [:create, :manage]
end

%w{ qmaild qmaill qmailp }.each do |usr|
  user usr do
    comment  usr
    group    'nofiles'
    home     '/var/qmail'
    shell    '/bin/false'
    password nil
    supports :manage_home => true
    action   [:create, :manage]
  end
end

%w{ qmailq qmailr qmails }.each do |usr|
  user usr do
    comment  usr
    group    'qmail'
    home     '/var/qmail'
    shell    '/bin/false'
    password nil
    supports :manage_home => true
    action   [:create, :manage]
  end
end


bash 'download_qmail' do
  cwd '/usr/local/src'
  user 'root'
  group 'root'
  code <<-EOC
    wget http://qmail.teraren.com/netqmail-1.06.tar.gz
    tar xvfz netqmail-1.06.tar.gz
  EOC
  creates "/usr/local/src/netqmail-1.06"
end

bash 'install_qmail' do
  cwd '/usr/local/src/netqmail-1.06'
  user 'root'
  group 'root'
  code <<-EOC
    sudo make setup
    sudo make check
    sudo ./config-fast #{node['qmail']['domain']}
  EOC
  creates "/usr/local/src/netqmail-1.06/config-fast"
end

