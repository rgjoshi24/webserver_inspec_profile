# encoding: utf-8
# copyright: 2018, The Authors

title 'sample section'

# you can also use plain tests
describe file('/tmp') do
  it { should be_directory }
end

# you add controls here
control 'tmp-1.0' do                        # A unique ID for this control
  impact 0.7                                # The criticality, if this control fails.
  title 'Create /tmp directory'             # A human-readable title
  desc 'An optional description...'
  describe file('/tmp') do                  # The actual test
    it { should be_directory }
  end
end

control 'webapp-01' do
  impact 1.0
  title 'WebServer should be running'
  desc 'WebServer should be running.'
  describe service('httpd') do
    it { should be_installed }
    it { should be_running }
  end
end

control 'webapp-02' do
  impact 1.0
  title 'WebServer should be enabled'
  desc 'Configure apache service to be automatically started at boot time'
  describe service('httpd') do
    it { should be_enabled }
  end
end
