require 'spec_helper'

describe 'python::default' do
  let :chef_run do
    ChefSpec::Runner.new(platform: 'ubuntu', version: '12.04').converge described_recipe
  end

  before do
    stub_command("/usr/bin/python -c 'import setuptools'").and_return(true)
  end

  it 'includes python::package by default' do
    expect(chef_run).to include_recipe('python::package')
  end

  it 'includes python::pip' do
    expect(chef_run).to include_recipe('python::pip')
  end

  it 'includes python::virtualenv' do
    expect(chef_run).to include_recipe('python::virtualenv')
  end
end
