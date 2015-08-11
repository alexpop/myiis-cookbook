require_relative '../spec_helper.rb'

describe 'myiis-cookbook::default' do
  context 'When all attributes are valid' do
    # Define the 'path', 'runner' and 'node' variables
    let(:runner) { ChefSpec::ServerRunner.new(WINDOWS2012_OPTS) }
    let(:node) { runner.node }
    cached(:chef_run) do
      # Stub the file being checked by the recipe
      allow(File).to receive('exist?').and_call_original
      allow(File).to receive('exist?').with("C:/inetpub/wwwroot/iisstart.htm").and_return(true)
      runner.converge(described_recipe)
    end

    it '- does not raise an error' do
      expect{chef_run}.not_to raise_error
    end

    # verity that `windows_feature` with `install` action exists in the resource collection
    it '- uses the `windows_feature` resource to `install` IIS-WebServerRole' do
      expect(chef_run).to install_windows_feature('IIS-WebServerRole')
    end

    it "- tests stubbing" do
      allow(File).to receive(:exist?).and_call_original
      allow(File).to receive(:exist?).with('/etc/something').and_return(true)
      expect(chef_run).to delete_file('/etc/something')
    end

    # verity that `powershell_script` with `run` action exists in the resource collection
    it '- uses the `powershell_script` resource to `run` a script' do
      allow(File).to receive(:exist?).and_call_original
      allow(File).to receive(:exist?).with("C:/inetpub/wwwroot/iisstart.htm").and_return(true)
      expect(chef_run).to run_powershell_script('Remove default IIS files')
    end
  end
end

