#!/bin/bash

curl -L https://github.com/allejo/jekyll-toc/releases/download/v1.0.10/toc.html --output _includes/toc.html
bundle exec jekyll build
