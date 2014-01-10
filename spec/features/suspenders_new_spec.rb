require 'spec_helper'

describe 'suspending a project' do
  it 'creates a new rails project' do
    expect(File.directory?(suspended_directory)).to be true
  end

  it 'creates a staging file which requires the production file' do
    staging_file = "#{suspended_directory}/config/environments/staging.rb"

    expect(IO.read(staging_file)).to eq expected_staging_file
  end

  it 'configures smtp' do
    production_file = "#{suspended_directory}/config/environments/production.rb"
    expect(IO.read(production_file)).to include('smtp')
  end
end

def expected_staging_file
  <<EOF
require_relative 'production'
Mail.register_interceptor RecipientInterceptor.new(ENV['EMAIL_RECIPIENTS'])
EOF
end
def smtp_settings
  <<EOF
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
    address: 'smtp.sendgrid.net',
    authentication: :plain,
    domain: 'heroku.com',
    password: ENV['SENDGRID_PASSWORD'],
    port: '587',
    user_name: ENV['SENDGRID_USERNAME']
  }
EOF
end
