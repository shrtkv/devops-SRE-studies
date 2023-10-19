#
# Cookbook:: example
# Recipe:: default
#
# Copyright:: 2023, The Authors, All Rights Reserved.

package 'apache2' do
 action :install
end
service 'apache2' do
action [:enable, :start]
end
 file 'var/www/html/index.html' do
content "hello world, chef!"
end
