require "octokit"
require "json"
require "marky_markdown"

# Each Action has an event passed to it.
event = JSON.parse(File.read(ENV['GITHUB_EVENT_PATH']))
safeword = "MARKYMARKED"

# puts event
puts "-------------------------------------------------"

# Exit Neutral if this is not a newly "opened" issue
exit(78) if event["action"] != "opened"
#
# Grab issue body
body = event["issue"]["body"]

exit(78) if body.include?(safeword)

# Use GITHUB_TOKEN to interact with the GitHub API
client = Octokit::Client.new(access_token: ENV['GITHUB_TOKEN'])

number = event["issue"]["number"]
full_name = event["repository"]["full_name"]

body = MarkyMarkdown::Transformer.transform(body)

# TODO: Update marky_markdown to output var object to place in comment
comment = "\r\n\r\n<!-- #{safeword} -->"

body << comment

# Update same issue with marked file and comment
client.update_issue(full_name, number, {body: body})

puts "MarkyMarkdown::Transformer succesfully marked body"
puts "-------------------------------------------------"

puts "Action succesful udated issue body"
