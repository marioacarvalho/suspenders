PROJECT_DIRECTORY = FileUtils.pwd

RSpec.configure do |config|
  config.before(:suite) do
    set_argvs
    clean_suspended_directory
    create_tmp_dir
    run_suspenders
  end

  config.after(:suite) do
    #clean_suspended_directory
  end
end

def clean_suspended_directory
  FileUtils.rm_rf suspended_directory
end

def create_tmp_dir
  begin
    FileUtils.mkdir "#{PROJECT_DIRECTORY}/tmp"
  rescue Errno::EEXIST => e
  end
end

def set_argvs
  ARGV.replace [suspended_directory]
end

def run_suspenders
  Suspenders::AppGenerator.start
end

def suspended_directory
  @suspended_directory ||= "#{PROJECT_DIRECTORY}/tmp/dummy"
end
