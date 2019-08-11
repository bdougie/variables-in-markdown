require "octokit"
require "json"
require "marky_markdown"

# Each Action has an event passed to it.
event = JSON.parse(File.read(ENV['GITHUB_EVENT_PATH']))

# Use GITHUB_TOKEN to interact with the GitHub API
client = Octokit::Client.new(access_token: ENV['GITHUB_TOKEN'])

# Grab issue body
body = event["issue"]["body"]
number = event["issue"]["number"]
full_name = event["repository"]["full_name"]

puts "-------------------------------------------------"
puts MarkyMarkdown::Transformer.transform(body)

# client.update_issue(full_name, number, body)
# puts "-------------------------------------------------"

# puts "Action succesful udated issue body"
