#
# Cookbook Name:: myiis-cookbook
# Recipe:: default
#
# Copyright 2015, Great Websites Inc
#

# Use the 'windows_feature' resource to idempotently install IIS
windows_feature 'IIS-WebServerRole' do
  action :install
end

# Use the 'powershell_script' resource to ensure that the default IIS files are removed
# Idempotentcy achieved here using the 'only_if' guard
powershell_script 'Remove default IIS files' do
  code <<-EOH
    Remove-Item C:/inetpub/wwwroot/*.*
    Get-ChildItem C:/inetpub/
  EOH
  only_if { File.exist?('C:/inetpub/wwwroot/iisstart.htm') }
  action :run
end

# Avoid the high CPU usage after kitchen converge
windows_task '\Microsoft\Windows\Application Experience\ProgramDataUpdater' do
  action :disable
end

# Use the 'file' resource to create a test file
file 'c:\opscode\chef\test.txt' do
  content 'File creation testi!'
end
