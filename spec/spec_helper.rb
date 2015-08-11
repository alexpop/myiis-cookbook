require 'chefspec'
require 'chefspec/berkshelf'

LOG_LEVEL = :fatal
WINDOWS2012_OPTS = {
  :platform => 'windows',
  :version => '2012r2',
  :log_level => LOG_LEVEL,
  :file_cache_path => 'c:\tmp'
}

at_exit { ChefSpec::Coverage.report! }