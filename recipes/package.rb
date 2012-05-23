#
# Author:: Seth Chisamore <schisamo@opscode.com>
# Cookbook Name:: python
# Recipe:: package
#
# Copyright 2011, Opscode, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# COOK-1016 Handle RHEL/CentOS namings of python packages, by installing EPEL repo & package
# This implementation was determined a stopgap measure until CHEF-2410 is implemented and widespread.
if node['platform'] == 'centos' || node['platform'] == 'redhat'
  major_version = node['platform_version'].split('.').first.to_i
  if major_version == 5
    include_recipe 'yum::epel'
  else
    # Do nothing.
  end
end

python_pkgs = if node['platform'] == 'centos' || node['platform'] == 'redhat'
                major_version = node['platform_version'].split('.').first.to_i
                if major_version == 6
                  ["python", "python-devel"]
                else
                  ["python26", "python26-devel"]
                end
              else
                value_for_platform(
                                   ["debian","ubuntu"] => {
                                     "default" => ["python","python-dev"]
                                   },
                                   ["fedora","amazon"] => {
                                     "default" => ["python","python-devel"]
                                   },
                                   ["freebsd"] => {
                                     "default" => ["python"]
                                   },
                                   "default" => ["python","python-dev"]
                                   )
              end

python_pkgs.each do |pkg|
  package pkg do
    action :install
  end
end
