# Rendering R markdown using GitHub Actions and hosted on GitHub pages

## Overview

Using GitHub Actions we can automate the process of running an R script to trigger an Rmarkdown document to run to generate a report, and committing the newly created output back to the repository. This is then hosted on GitHub pages.

`.github/workflows/main.yml` provides the GitHuB actions workflow in summary it runs an R script to generate a report, sets up the necessary R environment and dependencies, and configures Git to commit and push the changes back to the repository. It is triggered by pushes and pull requests to the main branch. The workflow uses the GITHUB_TOKEN for authentication to ensure the commit and push operations are successful.

`run.R` is the script that triggers the markdown rendering.

`report_markdown.Rmd` is the R markdown report which is rendered.

The folder `reports` is where the 'report' for each day is saved.

The latest report is copied to `index.html` so that it can be hosted by GitHub pages.
