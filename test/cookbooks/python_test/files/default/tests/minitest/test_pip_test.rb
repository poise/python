require 'minitest/spec'

describe_recipe 'python_test::test_pip' do
  include MiniTest::Chef::Assertions
  include MiniTest::Chef::Context
  include MiniTest::Chef::Resources

  it "ran first should_dsl pip install" do
    assert File.exist?("/tmp/first-install.txt"), `/tmp/virtualenv/bin/pip freeze`
  end

  it "did not run second should_dsl pip install" do
    assert !File.exist?("/tmp/second-install.txt"), `/tmp/virtualenv/bin/pip freeze`
  end
end
