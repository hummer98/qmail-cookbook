#
# Cookbook Name:: qmail
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

node[:qmail][:user].each do |usr|
  bash "create #{} Maildir" do
    cwd "/home/#{usr}"
    user usr
    group usr
    code <<-EOC
      /var/qmail/bin/maildirmake /home/#{usr}/Maildir
      touch .qmail
      chmod 600 .qmail
    EOC
    creates "/home/#{usr}/Maildir"
  end
end


