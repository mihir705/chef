require 'chefspec'

describe 'nginx::default' do
  let(:chef_run) do
    ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '22.04') do |node|
      node.normal['org']['lab_only'] = true
      node.normal['org']['lab_dir'] = '/tmp/chef-lab'
    end.converge(described_recipe)
  end

  it 'renders a lab nginx config' do
    expect(chef_run).to create_template('/tmp/chef-lab/nginx.conf')
  end

  it 'includes common' do
    expect(chef_run).to include_recipe('common::default')
  end
end
