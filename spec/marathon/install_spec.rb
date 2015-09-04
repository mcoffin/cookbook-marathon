require 'spec_helper'

describe 'marathon::install' do
  let(:chef_run) { ChefSpec::SoloRunner.converge(described_recipe) }
  it 'creates directory[/opt/marathon]' do
    expect(chef_run).to create_directory('/opt/marathon')
  end
end
