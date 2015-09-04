require 'serverspec'

set :backend, :exec

describe service('marathon') do
  it { should be_enabled }
end
