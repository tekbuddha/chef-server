# Management Console - using the compat shim resource
chef_server_ingredient 'manage' do
  config <<-EOS
disable_sign_up true
support_email_address "#{node['chef_admin']}"
EOS
  action :install
end

file '/tmp/opscode-manage.firstrun' do
  content 'ilovechef\n'
  action :create
end

ingredient_config 'manage' do
  notifies :reconfigure, 'chef_server_ingredient[manage]'
  sensitive true
end
