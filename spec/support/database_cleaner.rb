RSpec.configure do |config|
  # config.before(:each) do
  #   DatabaseCleaner.start
  # end
  # config.after(:each) do
  #   DatabaseCleaner.clean
  # end
  config.before(:all) do
    DatabaseCleaner.start
  end
  config.after(:all) do
    DatabaseCleaner.clean
  end
end