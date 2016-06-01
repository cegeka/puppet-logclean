require 'spec_helper_acceptance'

describe 'logclean' do

  describe 'running puppet code' do
    it 'should work with no errors' do
      pp = <<-EOS
        class { 'logclean':
          logconfig => [
            '/var/log/something-*.log;30',
          ]
        } 
      EOS

      # Run it twice and test for idempotency
      apply_manifest(pp, :catch_failures => true)
      apply_manifest(pp, :catch_changes => true)
    end
    describe file('/etc/logclean.conf') do
      it { should contain 'something' }
    end
  end
end
