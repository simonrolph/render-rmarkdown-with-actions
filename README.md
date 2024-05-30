# Rendering R markdown using GitHub Actions and hosted on GitHub pages

Using GitHub Actions to automates the process of running an R script in the necessary R environment, generating a report, and committing the changes back to the repository.

`.github/workflows/main.yml` provides the GitHun actions workflow in summary it runs an R script to generate a report, sets up the necessary R environment and dependencies, and configures Git to commit and push the changes back to the repository. It is triggered by pushes and pull requests to the main branch. The workflow uses the GITHUB_TOKEN for authentication to ensure the commit and push operations are successful.

`run.R` is the script that triggers the markdown rendering

`report_markdown.Rmd` is the R markdown report which is rendered

