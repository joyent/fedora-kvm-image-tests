require 'spec_helper'

# Files that should be installed

# product
describe file('/etc/product') do
	it { should be_file }
	it { should contain "Name: Joyent Instance" }
	it { should contain "Image: #{property[:name]} #{property[:version]}" }
	it { should contain "Documentation: #{property[:doc_url]}" }
end

## MOTD
describe file('/etc/motd') do
  it { should be_file }
  it { should contain "Instance (#{property[:name]} #{property[:version]}" }
  it { should contain "#{property[:doc_url]}" }
end

describe file('/etc/issue') do
  it { should be_file }
  it { should be_linked_to '/etc/motd' }
end

describe file('/etc/issue.net') do
    it { should be_file }
    it { should be_linked_to '/etc/motd' }
end
