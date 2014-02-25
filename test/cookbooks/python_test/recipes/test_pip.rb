#
# Author:: Hugo Lopes Tavares <hltbra@gmail.com>
# Cookbook Name:: python
# Recipe:: test_virtualenv
#
# Copyright 2013, Heavy Water Operations, LLC.
# Copyright 2014, Yipit, Inc.
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

file "/tmp/first-install.txt" do
  content "test"
  action :nothing
end

file "/tmp/second-install.txt" do
  content "test"
  action :nothing
end

python_virtualenv "/tmp/virtualenv" do
  owner "root"
  group "root"
  action :create
end

python_pip "should_dsl first install" do
  package_name "should_dsl"
  virtualenv "/tmp/virtualenv"
  version "2.1.2"
  notifies :create, "file[/tmp/first-install.txt]"
end

python_pip "should_dsl second install" do
  package_name "should_dsl"
  virtualenv "/tmp/virtualenv"
  # same version as before
  version "2.1.2"
  notifies :create, "file[/tmp/second-install.txt]"
end
