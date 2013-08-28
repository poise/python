require 'minitest/spec'

describe_recipe 'python_test::cook-3084' do
  include MiniTest::Chef::Assertions
  include MiniTest::Chef::Context
  include MiniTest::Chef::Resources

  it "created a virtualenv in cook-3084" do
    result = assert_sh("cook-3084/bin/python -c 'import sys; from os.path import basename; print basename(sys.prefix)'")
    assert_match /cook-3084\n/, result
  end

  it "created a virtualenv in cook-3084-interpreter" do
    result = assert_sh("cook-3084-interpreter/bin/python -c 'import sys; from os.path import basename; print basename(sys.prefix)'")
    assert_match /cook-3084-interpreter\n/, result
  end
end
