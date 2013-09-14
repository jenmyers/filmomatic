require "sinatra"
require "kickscraper"

Kickscraper.configure do |config|
  config.email = ENV["KICKSTARTER_EMAIL"]
  config.password = ENV["KICKSTARTER_PASSWORD"]
end

get "/" do
  erb :index
end

get "/project" do
  client = Kickscraper.client
  @project = client.category("Narrative Film").projects.sample
  erb :project
end