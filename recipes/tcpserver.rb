#
# Cookbook Name:: qmail
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

package 'tcsh'

bash 'download_tcpserver' do
  cwd '/usr/local/src'
  user 'root'
  group 'root'
  code <<-EOC
    wget http://cr.yp.to/ucspi-tcp/ucspi-tcp-0.88.tar.gz
    tar zxvf ucspi-tcp-0.88.tar.gz
  EOC
  creates "/usr/local/src/ucspi-tcp-0.88"
end

template "/usr/local/src/ucspi-tcp-0.88/error.h" do
  source 'ucspi-tcp-0.88/error.h'
end

bash 'install_tcpserver' do
  cwd '/usr/local/src/ucspi-tcp-0.88'
  user 'root'
  group 'root'
  code <<-EOC
    make setup check
    cd
    echo '127.:allow,RELAYCLIENT=""' > /etc/tcp.smtp
    tcprules /etc/tcp.smtp.cdb /etc/tcp.smtp.tmp < /etc/tcp.smtp
  EOC
  # creates "/etc/tcp.smtp"
end


