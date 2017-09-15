namespace :onesky do

  desc 'Upload all string files locale to OneSky platform.'
  task :upload_all => :environment do
    file_client.upload(locale_path)
    puts 'Done!'
  end

  desc 'Download translations from OneSky platform.'
  task :download_all => :environment do
    file_client.download(locale_path)
    puts 'Done!'
  end

  def file_client
    require 'erb'
    data = YAML::load(ERB.new(File.read(Rails.root.join('config', 'onesky.yml'))).result)
    Onesky::Rails::FileClient.new data
  end

  def locale_path
    Rails.root.join('config/locales')
  end

end
