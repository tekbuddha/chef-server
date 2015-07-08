default['chef-server']['push-client']['version'] = nil
default['chef-server']['chef-server-core']['version'] = nil
default['chef-server']['source_url'] = case node['platform_family']
                                when 'debian'
                                  if node['platform_version'].to_f == 14.04
                                    'https://web-dl.packagecloud.io/chef/stable/packages/ubuntu/trusty/chef-server-core_12.1.0-1_amd64.deb'
                                  elsif node['platform_version'].to_f == 12.04
                                    'https://web-dl.packagecloud.io/chef/stable/packages/ubuntu/precise/chef-server-core_12.1.0-1_amd64.deb'
                                  elsif node['platform_version'].to_f == 10.04
                                    'https://web-dl.packagecloud.io/chef/stable/packages/ubuntu/lucid/chef-server-core_12.1.0-1_amd64.deb'
                                  end
                                when 'rhel'
                                  if node['platform_version'].to_i == 6
                                    'https://web-dl.packagecloud.io/chef/stable/packages/el/6/chef-server-core-12.1.0-1.el6.x86_64.rpm'
                                  elsif node['platform_version'].to_i == 5
                                    'https://web-dl.packagecloud.io/chef/stable/packages/el/5/chef-server-core-12.1.0-1.el5.x86_64.rpm'
                                  end
                                end
