require 'spec_helper'

describe 'marathon::service on ubuntu-14.04' do
  let(:chef_run) { ChefSpec::SoloRunner.new(
    platform: 'ubuntu',
    version: '14.04'
  ).converge('marathon::service') }

  it 'creates service[marathon]' do
    expect(chef_run).to start_service('marathon')
  end
end
