require 'spec_helper'

describe 'suspending a project' do
  it 'creates a new rails project' do
    expect(File.directory?(suspended_directory)).to be true
  end

  it 'creates a staging file which requires the production file' do
    staging_file = "#{suspended_directory}/config/environments/staging.rb"

    binding.pry

    expect('a').to eq boom
  end

  def boom
    'foo'
  end
end

