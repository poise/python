#
# Author:: Alex Kiernan (<alexk@alexandalex.com>)
# Cookbook Name:: python
# Recipe:: cook-3084
#
# Copyright 2013, Alex Kiernan
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

include_recipe "python"

python_virtualenv "cook-3084" do
end

python_virtualenv "cook-3084-interpreter" do
  # on EL5 the default python we install is called python26
  if !node['python']['install_method'].eql?("source") &&
     platform_family?('rhel') &&
     node['platform_version'].split('.').first.to_i < 6
    interpreter '/usr/bin/python26'
  else
    interpreter 'python'
  end
end
