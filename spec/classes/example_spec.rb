require 'spec_helper'

describe 'artifactory_consul' do
  context 'supported operating systems' do
    on_supported_os.each do |os, facts|
      context "on #{os}" do
        let(:facts) do
          facts
        end

        context "artifactory_consul class without any parameters" do
          it { is_expected.to compile.with_all_deps }

          it { is_expected.to contain_class('artifactory_consul::params') }
          it { is_expected.to contain_class('artifactory_consul::install').that_comes_before('artifactory_consul::config') }
          it { is_expected.to contain_class('artifactory_consul::config') }
          it { is_expected.to contain_class('artifactory_consul::service').that_subscribes_to('artifactory_consul::config') }

          it { is_expected.to contain_service('artifactory_consul') }
          it { is_expected.to contain_package('artifactory_consul').with_ensure('present') }
        end
      end
    end
  end

  context 'unsupported operating system' do
    describe 'artifactory_consul class without any parameters on Solaris/Nexenta' do
      let(:facts) do
        {
          :osfamily        => 'Solaris',
          :operatingsystem => 'Nexenta',
        }
      end

      it { expect { is_expected.to contain_package('artifactory_consul') }.to raise_error(Puppet::Error, /Nexenta not supported/) }
    end
  end
end
