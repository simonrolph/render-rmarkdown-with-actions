# Rendering R markdown using GitHub Actions and hosted on GitHub pages

## Overview

Automating generating reports is useful tool. For example, I might want a webpage to list recent butterflies that were observed in a local nature reserve. You could run a scheduled job on your computer, but maybe you don't want to keep your computer turned on at all hours. Cloud based solutions like Posit Connect can help you do this by running R markdown files on a schedule (https://docs.posit.co/connect/user/scheduling/). Alternatively, we could be using GitHub actions! And we can use this in connection with GitHub pages to seamlessly be able to host the generated outputs.

This repo provides a very simple demonstrator which generates a new lucky number every day which you can view here: https://simonrolph.github.io/render-rmarkdown-with-actions/ the page is generated at 00:01 of each day.

## How it works

Using GitHub Actions we can automate the process of running an R script to trigger an Rmarkdown document to run to generate a report, and committing the newly created output back to the repository. This is then hosted on GitHub pages.

`.github/workflows/main.yml` provides the GitHub actions workflow. In summary it sets up the necessary R environment and dependencies, runs an R script to generate a report, then configures Git to commit and push the changes back to the repository. It is triggered by a schedule (https://docs.github.com/en/actions/using-workflows/events-that-trigger-workflows#schedule). 

`run.R` is the script that is run by `main.yml` and triggers the markdown rendering. In `run.R` we create a file name for our output based on today's date. We trigger a `rmarkdown::render` call which uses  `report_markdown.Rmd` as the R markdown report. So you could put anything R code in there you like, pull data from APIs, do some data wrangling, draw some plots etc. The html output is saved into the folder `reports`. The latest report is copied to `index.html` so that it can be hosted by GitHub pages.

The `main.yml` workflow pushes the newly generated content to the repository and then deploys the page. Note this issue https://github.com/actions/checkout/issues/439
