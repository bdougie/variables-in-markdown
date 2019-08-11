require "octokit"
require "json"

# Each Action has an event passed to it.
event = JSON.parse(File.read(ENV['GITHUB_EVENT_PATH']))
puts event.inspect

# Use GITHUB_TOKEN to interact with the GitHub API
client = Octokit::Client.new(access_token: ENV['GITHUB_TOKEN'])

markdown = client.issue("bdougie/bot-test-repo", "265").body

puts "***Printing out this repo's issues***"
puts markdowk
