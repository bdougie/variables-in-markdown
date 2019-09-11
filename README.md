# Variables in Markdown
This GitHub Action will allow you to set variables in Markdown and allow you to interpolate throughout your file.

## Usage

This GitHub Action that replaces template in your variables

```yml
on: issues
name: Template Variables in Markdown
jobs:
  markdown:
    name: markdown-marker
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@master
    - uses: bdougie/variables-in-markdown@master
      env:
        GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}

```
## Testing

This action is best used with issue templates. Create an examples `.github/ISSUE_TEMPLATE.md` file. This file should have front matter to help construct the new issue:

```markdown
---
title: New Issue
labels: bug, enhancement
---
<!--#
NOUN=mother
ATTRIBUTION=Mark Wahlberg
$-->

"Say hi to your {{ NOUN }} for me," {{ ATTRIBUTION }}
```

You'll notice that the above example has some `{{ MUSTACHE }}` variables. This is need for the API to find and replace variables. This is powered by the [marky_markdown](https://rubygems.org/gems/marky_markdown) ruby gem.

