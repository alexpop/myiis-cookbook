#
# Cookbook Name:: myiis-cookbook
# Recipe:: harden
#
# Copyright 2015, Great Websites Inc
#

# rule 'windows-base-101'
# title 'Safe DLL Search Mode is Enabled'
registry_key 'HKLM\System\CurrentControlSet\Control\Session Manager' do
  values [{ name: 'SafeDllSearchMode', type: :dword, data: 1 }]
  recursive true
  action :create
end

# rule 'windows-base-103'
# title 'All Shares are Configured to Prevent Anonymous Access'
registry_key 'HKLM\System\CurrentControlSet\Services\LanManServer\Parameters' do
  values [{ name: 'NullSessionShares', type: :multi_string, data: [] }]
  recursive true
  action :create
end

# rule 'windows-base-201'
# title 'Strong Windows NTLMv2 Authentication Enabled; Weak LM Disabled'
registry_key 'HKLM\System\CurrentControlSet\Control\Lsa' do
  values [{ name: 'LmCompatibilityLevel', type: :dword, data: 4 }]
  recursive true
  action :create
end

# rule 'windows-base-202' do
# title 'Enable Strong Encryption for Windows Network Sessions on Clients'
registry_key 'HKLM\System\CurrentControlSet\Control\Lsa\MSV1_0' do
  values [{ name: 'NTLMMinClientSec', type: :dword, data: 537_395_200 }]
  recursive true
  action :create
end

# rule 'windows-base-203' do
# title 'Enable Strong Encryption for Windows Network Sessions on Servers'
registry_key 'HKLM\System\CurrentControlSet\Control\Lsa\MSV1_0' do
  values [{ name: 'NTLMMinServerSec', type: :dword, data: 537_395_200 }]
  recursive true
  action :create
end

# rule 'windows-ie-101'
# title 'IE 64-bit tab'
registry_key 'HKLM\Software\Policies\Microsoft\Internet Explorer\Main' do
  values [{ name: 'Isolation64Bit', type: :dword, data: 1 }]
  recursive true
  action :create
end

# rule 'windows-ie-102' do
# title 'Run antimalware programs against ActiveX controls'
registry_key 'HKLM\Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3' do
  values [{ name: '270C', type: :dword, data: 0 }]
  recursive true
  action :create
end

# rule 'windows-rdp-100' do
# title 'Windows Remote Desktop Configured to Always Prompt for Password'
registry_key 'HKLM\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services' do
  values [{ name: 'fPromptForPassword', type: :dword, data: 1 }]
  recursive true
  action :create
end

# rule 'windows-rdp-101'
# title 'Strong Encryption for Windows Remote Desktop Required'
registry_key 'HKLM\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services' do
  values [{ name: 'MinEncryptionLevel', type: :dword, data: 3 }]
  recursive true
  action :create
end

# rule 'windows-audit-100'
# title 'Configure System Event Log (Application)'
registry_key 'HKLM\Software\Policies\Microsoft\Windows\EventLog\Application' do
  values [{ name: 'MaxSize', type: :dword, data: 67_108_864 }]
  recursive true
  action :create
end

# rule 'windows-audit-101'
# title 'Configure System Event Log (Security)'
registry_key 'HKLM\Software\Policies\Microsoft\Windows\EventLog\Security' do
  values [{ name: 'MaxSize', type: :dword, data: 67_108_864 }]
  recursive true
  action :create
end

# rule 'windows-audit-102'
# title 'Configure System Event Log (Setup)'
registry_key 'HKLM\Software\Policies\Microsoft\Windows\EventLog\Setup' do
  values [{ name: 'MaxSize', type: :dword, data: 67_108_864 }]
  recursive true
  action :create
end

# rule 'windows-audit-103'
# title 'Configure System Event Log (System)'
registry_key 'HKLM\Software\Policies\Microsoft\Windows\EventLog\System' do
  values [{ name: 'MaxSize', type: :dword, data: 67_108_864 }]
  recursive true
  action :create
end
