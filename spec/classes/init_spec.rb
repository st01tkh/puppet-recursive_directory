require 'spec_helper'
describe 'recursive_directory' do

  context 'with defaults for all parameters' do
    it { should contain_class('recursive_directory') }
  end
end
